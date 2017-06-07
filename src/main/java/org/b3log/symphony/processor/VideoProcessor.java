package org.b3log.symphony.processor;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.After;
import org.b3log.latke.servlet.annotation.Before;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.freemarker.AbstractFreeMarkerRenderer;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.processor.advice.PermissionGrant;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.DataModelService;
import org.b3log.symphony.service.VideoMgmtService;
import org.b3log.symphony.service.VideoQueryService;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public void showUser(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response,
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
