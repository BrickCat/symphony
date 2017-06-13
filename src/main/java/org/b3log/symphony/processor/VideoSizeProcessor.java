package org.b3log.symphony.processor;

import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.Latkes;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.service.LangPropsService;
import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.After;
import org.b3log.latke.servlet.annotation.Before;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.freemarker.AbstractFreeMarkerRenderer;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.Strings;
import org.b3log.symphony.model.*;
import org.b3log.symphony.processor.advice.AnonymousViewCheck;
import org.b3log.symphony.processor.advice.CSRFToken;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.processor.advice.PermissionGrant;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.*;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Seven on 17/5/14.
 */
@RequestProcessor
public class VideoSizeProcessor {

    /**
     * logger
     */
    private static final Logger LOGGER = Logger.getLogger(VideoSizeProcessor.class);

    /**
     * pagination window size
     */
    private static final int WINDOW_SIZE = 15;


    /**
     * Pagination page size.
     */
    private static final int PAGE_SIZE = 20;

    /**
     * Data model service.
     */
    @Inject
    private DataModelService dataModelService;

    /**
     * Video model service
     */
    @Inject
    private VideoSizeMgmtService videoSizeMgmtService;

    /**
     *Video queryservice
     */
    @Inject
    private VideoSizeQueryService videoSizeQueryService;
    /**
     * User query service.
     */
    @Inject
    private UserQueryService userQueryService;
    /**
     * Language service.
     */
    @Inject
    private LangPropsService langPropsService;
    /**
     * Pointtransfer management service.
     */
    @Inject
    private PointtransferMgmtService pointtransferMgmtService;

    /**
     * Notification management service.
     */
    @Inject
    private NotificationMgmtService notificationMgmtService;

    @RequestProcessing(value = "/video/update/{userId}/init-size", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void initSize(final String userId,final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        LOGGER.info(userId);
        final JSONObject videoSize = new JSONObject();
        videoSize.put(VideoSize.USER_ID, userId);
        videoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,500);
        videoSizeMgmtService.addVideoSize("",videoSize);
        response.sendRedirect(Latkes.getServePath() + "/admin/users");
    }

    @RequestProcessing(value = "/video/update/{userId}/exchange-size", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void exchangeSize(final String userId,final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        try{
            final JSONObject videoSize = new JSONObject();
            videoSize.put(VideoSize.USER_ID,userId);
            final String size = request.getParameter(VideoSize.USER_MAX_VIDEO_SIZE);
            final Map<String, Class<?>> videoSizeFields = new HashMap<>();
            videoSizeFields.put(Keys.OBJECT_ID,String.class);
            videoSizeFields.put(VideoSize.USER_ID,String.class);
            videoSizeFields.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.class);
            final JSONObject result = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
            final List<JSONObject> list = CollectionUtils.<JSONObject>jsonArrayToList(result.optJSONArray(VideoSize.VIDEO_SIZE));
            if(list.size() == 0){
                videoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,500);
                videoSizeMgmtService.addVideoSize("",videoSize);
            }
            final JSONObject cuerrresult = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
            final List<JSONObject> currrlist = CollectionUtils.<JSONObject>jsonArrayToList(cuerrresult.optJSONArray(VideoSize.VIDEO_SIZE));
            //获取此UserId的存储空间数据
            final JSONObject currVideoSize = currrlist.get(0);
            //根据选择的空间赋值扣除的积分
            int point = 0;
            switch (Integer.valueOf(size)){
                case 100:
                    point = 100;
                    break;
                case 300:
                    point = 240;
                    break;
                case 500:
                    point = 380;
                    break;
                case 800:
                    point = 560;
                    break;
                case 1000:
                    point = 780;
                    break;
                case 3000:
                    point = 1800;
                    break;
                case 5000:
                    point = 2800;
                    break;
                default:
                    break;
            }

            //扣除积分
            final JSONObject user = userQueryService.getUser(userId);
            final int currentPoint = user.optInt(UserExt.USER_POINT);

            if (currentPoint - point < Symphonys.getInt("videoSizeExchangeMin")) {
                final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
                context.setRenderer(renderer);
                renderer.setTemplateName("admin/error.ftl");
                final Map<String, Object> dataModel = renderer.getDataModel();

                dataModel.put(Keys.MSG, langPropsService.get("insufficientBalanceLabel"));
                dataModelService.fillHeaderAndFooter(request, response, dataModel);
                return;
            }

            final String memo = String.valueOf(Math.floor(point / (double) Symphonys.getInt("pointExchangeUnit")));

            final String transferId = pointtransferMgmtService.transfer(userId, Pointtransfer.ID_C_SYS,
                    Pointtransfer.TRANSFER_TYPE_C_SIZE, point, memo, System.currentTimeMillis());

            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, userId);
            notification.put(Notification.NOTIFICATION_DATA_ID, transferId);

            //获取当前空间
            notificationMgmtService.addPointExchangeNotification(notification);
            int currSize = currVideoSize.getInt(VideoSize.USER_MAX_VIDEO_SIZE);
            //修改空间大小
            currVideoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.valueOf(size)+currSize);
            videoSizeMgmtService.addVideoSize(currVideoSize.optString(Keys.OBJECT_ID), currVideoSize);

        }catch (final Exception e) {
            final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
            context.setRenderer(renderer);
            renderer.setTemplateName("admin/error.ftl");
            final Map<String, Object> dataModel = renderer.getDataModel();

            dataModel.put(Keys.MSG, e.getMessage());
            dataModelService.fillHeaderAndFooter(request, response, dataModel);

            return;
        }
        response.sendRedirect(Latkes.getServePath() + "/admin/users");
    }

}
