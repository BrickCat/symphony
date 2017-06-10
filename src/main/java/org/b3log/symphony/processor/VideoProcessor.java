package org.b3log.symphony.processor;

import org.b3log.latke.Keys;
import org.b3log.latke.Latkes;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.After;
import org.b3log.latke.servlet.annotation.Before;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.freemarker.AbstractFreeMarkerRenderer;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.Strings;
import org.b3log.symphony.model.Article;
import org.b3log.symphony.model.Common;
import org.b3log.symphony.model.Tag;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.processor.advice.AnonymousViewCheck;
import org.b3log.symphony.processor.advice.CSRFToken;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.processor.advice.PermissionGrant;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.DataModelService;
import org.b3log.symphony.service.VideoMgmtService;
import org.b3log.symphony.service.VideoQueryService;
import org.json.JSONArray;
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
public class VideoProcessor {

    /**
     * logger
     */
    private static final Logger LOGGER = Logger.getLogger(VideoProcessor.class);

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
    private VideoMgmtService videoMgmtService;

    /**
     *Video queryservice
     */
    @Inject
    private VideoQueryService videoQueryService;

    @RequestProcessing(value = "/video", method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void updateUser(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final String videoId = request.getParameter("id");
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("admin/video.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();
        final JSONObject video = videoQueryService.getVideo(videoId);
        dataModel.put(Video.VIDEO,video);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    @RequestProcessing(value = "/video/{videoId}",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void showVideo(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response,
                         final String videoId) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("admin/video.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();
        final JSONObject video = videoQueryService.getVideo(videoId);
        dataModel.put(Video.VIDEO,video);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    /**
     * Shows article with the specified article id.
     *
     * @param context   the specified context
     * @param request   the specified request
     * @param response  the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/video/front/videos", method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, AnonymousViewCheck.class})
    @After(adviceClass = {CSRFToken.class, PermissionGrant.class, StopwatchEndAdvice.class})
    public void frontVideo(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        final Map<String, Object> dataModel = renderer.getDataModel();
        renderer.setTemplateName("/videos.ftl");
        String pageNumStr = request.getParameter("p");
        if (Strings.isEmptyOrNull(pageNumStr) || !Strings.isNumeric(pageNumStr)) {
            pageNumStr = "1";
        }
        final int pageNum = Integer.valueOf(pageNumStr);
        final int pageSize = PAGE_SIZE;
        final int windowSize = WINDOW_SIZE;
        final JSONObject requestJSONObject = new JSONObject();
        requestJSONObject.put(Pagination.PAGINATION_CURRENT_PAGE_NUM, pageNum);
        requestJSONObject.put(Pagination.PAGINATION_PAGE_SIZE, pageSize);
        requestJSONObject.put(Pagination.PAGINATION_WINDOW_SIZE, windowSize);
        final String videoTitle = request.getParameter(Common.VIDEO_TITLE_TAG);
        if (!Strings.isEmptyOrNull(videoTitle)) {
            //标题
            requestJSONObject.put(Tag.TAG_TITLE, videoTitle);
        }
        final Map<String, Class<?>> videoFields = new HashMap<>();
        //TODO 视频缩略图
        //Id
        videoFields.put(Keys.OBJECT_ID, String.class);
        //标题
        videoFields.put(Video.VIDEO_TITLE, String.class);
        //状态
        videoFields.put(Video.VIDEO_STATUS,Integer.class);
        //描述
        videoFields.put(Video.VIDEO_REMARKS,String.class);
        //创建日期
        videoFields.put(Video.VIDEO_CREATE_TIME,String.class);

        final JSONObject result = videoQueryService.getVideos(requestJSONObject,videoFields);
        final List<JSONObject> videos = CollectionUtils.jsonArrayToList(result.optJSONArray(Video.VIDEOS));
        dataModel.put(Video.VIDEOS, CollectionUtils.jsonArrayToList(result.optJSONArray(Video.VIDEOS)));

        final JSONObject pagination = result.optJSONObject(Pagination.PAGINATION);
        final int pageCount = pagination.optInt(Pagination.PAGINATION_PAGE_COUNT);
        final JSONArray pageNums = pagination.optJSONArray(Pagination.PAGINATION_PAGE_NUMS);
        dataModel.put(Pagination.PAGINATION_FIRST_PAGE_NUM, pageNums.opt(0));
        dataModel.put(Pagination.PAGINATION_LAST_PAGE_NUM, pageNums.opt(pageNums.length() - 1));
        dataModel.put(Pagination.PAGINATION_CURRENT_PAGE_NUM, pageNum);
        dataModel.put(Pagination.PAGINATION_PAGE_COUNT, pageCount);
        dataModel.put(Pagination.PAGINATION_PAGE_NUMS, CollectionUtils.jsonArrayToList(pageNums));
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    /**
     * Removes an article.
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */

    @RequestProcessing(value = "/video/remove-video", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void removeVideo(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final String videoId = request.getParameter(Video.VIDEO_T_ID);
        videoMgmtService.deleteVideo(videoId);

        response.sendRedirect(Latkes.getServePath() + "/admin/videos");
    }
    @RequestProcessing(value = "/video/update/{videoId}",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void updateUser(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response,
                         final String videoId) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("admin/video.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        JSONObject video = videoQueryService.getVideo(videoId);

        final Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()){
            final String name = parameterNames.nextElement();
            final String value = request.getParameter(name);
            if(name.equals(Video.VIDEO_POINT)
                    ||name.equals(Video.VIDEO_STATUS)
                    ||name.equals(Video.VIDEO_TYPE)){
                video.put(name,Integer.valueOf(value));
            }
            video.put(name,value);
        }

        videoMgmtService.updateVideo(videoId,video);

        video = videoQueryService.getVideo(videoId);

        dataModel.put(Video.VIDEO,video);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    /**
     *
     * @param context
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestProcessing(value = "/video/check", method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void showCheckVideoInfo(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response
                           ) throws Exception {
        final String type = request.getParameter("type");
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("admin/error.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();
        if(Video.VIDEO_TITLE.equals(type)){
            dataModel.put(Keys.MSG, "视频怎么能没有标题呢 ？~  >_<|||");
        }else if (Video.VIDEO_TAG.equals(type)){
            dataModel.put(Keys.MSG, "来个标签吧 ( *>.<* ) ~");
        }else if (Video.VIDEO_REMARKS.equals(type)){
            dataModel.put(Keys.MSG,"~w_w~ 给你的视频提供描述吧~");
        }else if (Video.VIDEO_TYPE.equals(type)){
            dataModel.put(Keys.MSG,"你确定免 (*^＠^*) 费提供下载嘛..(≥◇≤)..~");
        }else if (Video.VIDEO_POINT.equals(type)){
            dataModel.put(Keys.MSG,"给你的视频..(≥◇≤)..定个价格（积分）吧~");
        }else if (Video.VIDEO_STATUS.equals(type)){
            dataModel.put(Keys.MSG,"你的视频ㄟ(‧‧) (‧‧)ㄟ是否启用啊 啊 啊 啊~");
        }else if ("videoSize".equals(type)){
            dataModel.put(Keys.MSG,"你竟然< ( _ _ ) >不上传视频 啊~");
        }else if ("videoErrorInfo".equals(type)){
            dataModel.put(Keys.MSG,"( -___- )b上传失败了~呜呜呜~");
        }
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }
}
