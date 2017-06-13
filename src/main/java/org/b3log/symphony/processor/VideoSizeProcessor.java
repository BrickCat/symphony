package org.b3log.symphony.processor;

import org.apache.commons.lang.StringUtils;
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
import org.b3log.symphony.model.Common;
import org.b3log.symphony.model.Tag;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.processor.advice.AnonymousViewCheck;
import org.b3log.symphony.processor.advice.CSRFToken;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.processor.advice.PermissionGrant;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.*;
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

    @RequestProcessing(value = "/video/update/{userId}", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void updateUser(final String userId,final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        LOGGER.info(userId);
        final JSONObject videoSize = new JSONObject();
        videoSize.put(VideoSize.USER_ID, userId);
        final Map<String, Class<?>> videoSizeFields = new HashMap<>();
        videoSizeFields.put(Keys.OBJECT_ID,String.class);
        videoSizeFields.put(VideoSize.USER_ID,String.class);
        videoSizeFields.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.class);
        final JSONObject result = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
        final List<JSONObject> list = CollectionUtils.<JSONObject>jsonArrayToList(result.optJSONArray(VideoSize.VIDEO_SIZE));
        final JSONObject currVideoSize = list.get(0);
        currVideoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,500);
        videoSizeMgmtService.addVideoSize(currVideoSize.optString(Keys.OBJECT_ID),currVideoSize);
        response.sendRedirect(Latkes.getServePath() + "/admin/users");
    }

    @RequestProcessing(value = "/video/update/{userId}/exchange-size", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void exchangeSize(final String userId,final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        LOGGER.info(userId);
        final JSONObject videoSize = new JSONObject();
        final String size = request.getParameter(VideoSize.USER_MAX_VIDEO_SIZE);
        videoSize.put(VideoSize.USER_ID, userId);
        final Map<String, Class<?>> videoSizeFields = new HashMap<>();
        videoSizeFields.put(Keys.OBJECT_ID,String.class);
        videoSizeFields.put(VideoSize.USER_ID,String.class);
        videoSizeFields.put(VideoSize.USER_MAX_VIDEO_SIZE,Integer.class);
        final JSONObject result = videoSizeQueryService.getVideoSize(videoSize,videoSizeFields);
        final List<JSONObject> list = CollectionUtils.<JSONObject>jsonArrayToList(result.optJSONArray(VideoSize.VIDEO_SIZE));
        final JSONObject currVideoSize = list.get(0);
        currVideoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,500);
        videoSizeMgmtService.addVideoSize(currVideoSize.optString(Keys.OBJECT_ID),currVideoSize);
        response.sendRedirect(Latkes.getServePath() + "/admin/users");
    }

}
