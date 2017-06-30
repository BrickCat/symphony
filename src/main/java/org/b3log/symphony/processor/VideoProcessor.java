package org.b3log.symphony.processor;

import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.Latkes;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.model.User;
import org.b3log.latke.service.LangPropsService;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.After;
import org.b3log.latke.servlet.annotation.Before;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.freemarker.AbstractFreeMarkerRenderer;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.Paginator;
import org.b3log.latke.util.Stopwatchs;
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
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
    private static final int PAGE_SIZE = 30;

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
     * Avatar query service.
     */
    @Inject
    private AvatarQueryService avatarQueryService;

    /**
     *Video queryservice
     */
    @Inject
    private VideoQueryService videoQueryService;

    /**
     * User query service.
     */
    @Inject
    private UserQueryService userQueryService;

    /**
     * Follow query service.
     */
    @Inject
    private FollowQueryService followQueryService;

    /**
     * Vote query service.
     */
    @Inject
    private VoteQueryService voteQueryService;
    /**
     * Reward query service.
     */
    @Inject
    private RewardQueryService rewardQueryService;
    /**
     * Comment query service.
     */
    @Inject
    private CommentQueryService commentQueryService;
    /**
     * Language service.
     */
    @Inject
    private LangPropsService langPropsService;

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
        dataModel.put(Common.SELECTED, Common.VIDEOS);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    /**
     * Shows video with the specified article id.
     *
     * @param context   the specified context
     * @param request   the specified request
     * @param response  the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/video/front/addvideo",method = HTTPRequestMethod.POST)
    public void addVideo(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServiceException {
        final String ret = request.getParameter(Video.VIDEO_T_ID);
        final String videoTitle = request.getParameter(Video.VIDEO_TITLE);
        final String videoTag = request.getParameter(Video.VIDEO_TAG);
        final String videoRemarks = request.getParameter(Video.VIDEO_REMARKS);
        final int videoType = Integer.parseInt(request.getParameter(Video.VIDEO_TYPE));
        final int videoStatus = Integer.parseInt(request.getParameter(Video.VIDEO_STATUS));
        final int videoPoint = Integer.parseInt(request.getParameter(Video.VIDEO_POINT));
        if(StringUtils.isBlank(videoTitle)){
            response.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_TITLE);
            return;
        }
        if (StringUtils.isBlank(videoTag)){
            response.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_TAG);
            return;
        }
        if (StringUtils.isBlank(videoRemarks)){
            response.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_REMARKS);
            return;
        }
        if(videoType == 1 && videoPoint==0){
            response.sendRedirect(Latkes.getServePath() + "/video/front/check?type="+Video.VIDEO_POINT);
            return;
        }

        final JSONObject video = videoQueryService.getVideo(ret);
        if(null == video){
            LOGGER.log(Level.ERROR, "add vidoe failed");
            return;
        }

        video.put(Video.VIDEO_TITLE,videoTitle);
        video.put(Video.VIDEO_TAG,videoTag);
        video.put(Video.VIDEO_REMARKS,videoRemarks);
        video.put(Video.VIDEO_TYPE,videoType);
        video.put(Video.VIDEO_POINT,videoPoint);
        video.put(Video.VIDEO_STATUS,videoStatus);

        videoMgmtService.updateVideo(ret,video);

        response.sendRedirect(Latkes.getServePath() + "/admin/videos");
    }

    /**
     * Shows video with the specified article id.
     *
     * @param context   the specified context
     * @param request   the specified request
     * @param response  the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/video/front/{videoId}/show-video", method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, AnonymousViewCheck.class})
    @After(adviceClass = {CSRFToken.class, PermissionGrant.class, StopwatchEndAdvice.class})
    public void frontShowVideo(final String videoId,final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("/video.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        final int avatarViewMode = (int) request.getAttribute(UserExt.USER_AVATAR_VIEW_MODE);

        final JSONObject video = videoQueryService.getVideoById(avatarViewMode,videoId);

        if(null == video){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        final HttpSession session = request.getSession(false);
        if (null != session){
            session.setAttribute(Video.VIDEO_T_ID,videoId);
        }
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
        final String authorId = video.optString(Video.VIDEO_AUTHORID);

        final JSONObject author = userQueryService.getUser(authorId);
        if (Video.VIDEO_STATUS_C_TRUE == video.optInt(Video.VIDEO_STATUS)){
            video.put(Video.VIDEO_T_AUTHOR_NAME,author.optString(User.USER_NAME));
            video.put(Video.VIDEO_T_AUTHOR_URL, author.optString(User.USER_URL));
            video.put(Video.VIDEO_T_AUTHOR_INTRO, author.optString(UserExt.USER_INTRO));
        }else{
            video.put(Video.VIDEO_T_AUTHOR_NAME, UserExt.ANONYMOUS_USER_NAME);
            video.put(Video.VIDEO_T_AUTHOR_URL, "");
            video.put(Video.VIDEO_T_AUTHOR_INTRO, "");
        }
        dataModel.put(Video.VIDEO,video);

        video.put(Common.IS_MY_VIDEO, false);

        video.put(Video.VIDEO_T_AUTHOR, author);

        String cmtViewModeStr = request.getParameter("m");

        JSONObject currentUser = null;
        String currentUserId = null;
        final boolean isLoggedIn = (Boolean) dataModel.get(Common.IS_LOGGED_IN);

        if (isLoggedIn) {
            currentUser = (JSONObject) dataModel.get(Common.CURRENT_USER);
            currentUserId = currentUser.optString(Keys.OBJECT_ID);
            video.put(Common.IS_MY_VIDEO, currentUserId.equals(video.optString(Video.VIDEO_AUTHORID)));

            final boolean isFollowing = followQueryService.isFollowing(currentUserId, videoId, Follow.FOLLOWING_TYPE_C_VIDEO);
            dataModel.put(Common.IS_FOLLOWING, isFollowing);

            final boolean isWatching = followQueryService.isFollowing(currentUserId, videoId, Follow.FOLLOWING_TYPE_C_VIDEO_WATCH);
            dataModel.put(Common.IS_WATCHING, isWatching);

            final int videoeVote = voteQueryService.isVoted(currentUserId, videoId);
            video.put(Video.VIDEO_T_VOTE, videoeVote);

            if (Strings.isEmptyOrNull(cmtViewModeStr) || !Strings.isNumeric(cmtViewModeStr)) {
                cmtViewModeStr = currentUser.optString(UserExt.USER_COMMENT_VIEW_MODE);
            }
        } else if (Strings.isEmptyOrNull(cmtViewModeStr) || !Strings.isNumeric(cmtViewModeStr)) {
            cmtViewModeStr = "0";
        }

        final int cmtViewMode = Integer.valueOf(cmtViewModeStr);
        dataModel.put(UserExt.USER_COMMENT_VIEW_MODE, cmtViewMode);

        if(!(Boolean)request.getAttribute((Keys.HttpRequest.IS_SEARCH_ENGINE_BOT))){
            videoMgmtService.inVideoViewCount(videoId);
        }

        String stickConfirmLabel = langPropsService.get("stickVideoConfirmLabel");
        stickConfirmLabel = stickConfirmLabel.replace("{point}", Symphonys.get("pointStickArticle"));
        dataModel.put("stickVideoConfirmLabel", stickConfirmLabel);
        dataModel.put("pointThankArticle", Symphonys.get("pointThankArticle"));

        String pageNumStr = request.getParameter("p");
        if (Strings.isEmptyOrNull(pageNumStr) || !Strings.isNumeric(pageNumStr)) {
            pageNumStr = "1";
        }

        final int pageNum = Integer.valueOf(pageNumStr);
        final int pageSize = Symphonys.getInt("articleCommentsPageSize");
        final int windowSize = Symphonys.getInt("articleCommentsWindowSize");

        final int commentCnt = video.getInt(Video.VIDEO_COMMENT_COUNT);
        final int pageCount = (int) Math.ceil((double) commentCnt / (double) pageSize);

        final List<Integer> pageNums = Paginator.paginate(pageNum, pageSize, pageCount, windowSize);

        if (!pageNums.isEmpty()) {
            dataModel.put(Pagination.PAGINATION_FIRST_PAGE_NUM, pageNums.get(0));
            dataModel.put(Pagination.PAGINATION_LAST_PAGE_NUM, pageNums.get(pageNums.size() - 1));
        }

        dataModel.put(Pagination.PAGINATION_CURRENT_PAGE_NUM, pageNum);
        dataModel.put(Pagination.PAGINATION_PAGE_COUNT, pageCount);
        dataModel.put(Pagination.PAGINATION_PAGE_NUMS, pageNums);
        dataModel.put(Common.VIDEO_COMMENTS_PAGE_SIZE, pageSize);

        final String commenterId = video.optString(Video.VIDEO_AUTHORID);
        final JSONObject videoer = userQueryService.getUser(commenterId);
        // Load comments
        final List<JSONObject> videoComments =
                commentQueryService.getArticleComments(avatarViewMode, videoId, pageNum, pageSize, cmtViewMode);
        video.put(Video.VIDEO_T_COMMENTS, (Object) videoComments);
        video.put(Video.VIDEO_T_AUTHOR_THUMBNAIL_URL, avatarQueryService.getAvatarURLByUser(
                UserExt.USER_AVATAR_VIEW_MODE_C_ORIGINAL, videoer, "48"));
        // Fill comment thank
        Stopwatchs.start("Fills comment thank");
        try{
            final String thankTemplate = langPropsService.get("thankConfirmLabel");
            for (final JSONObject comment : videoComments){
                comment.put(Comment.COMMENT_T_NICE, comment.optDouble(Comment.COMMENT_SCORE, 0D));

                final String thankStr = thankTemplate.replace("{point}", String.valueOf(Symphonys.getInt("pointThankComment")))
                        .replace("{user}", comment.optJSONObject(Comment.COMMENT_T_COMMENTER).optString(User.USER_NAME));
                comment.put(Comment.COMMENT_T_THANK_LABEL, thankStr);

                final String commentId = comment.optString(Keys.OBJECT_ID);
                if (isLoggedIn) {
                    comment.put(Common.REWARDED,
                            rewardQueryService.isRewarded(currentUserId, commentId, Reward.TYPE_C_COMMENT));
                    final int commentVote = voteQueryService.isVoted(currentUserId, commentId);
                    comment.put(Comment.COMMENT_T_VOTE, commentVote);
                }
                comment.put(Common.REWARED_COUNT, rewardQueryService.rewardedCount(commentId, Reward.TYPE_C_COMMENT));
            }

        }finally {
            Stopwatchs.end();
        }

        dataModel.put(Common.SELECTED, Common.VIDEOS);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    /**
     * Removes an video.
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

        JSONObject oldVideo = videoQueryService.getVideo(videoId);

        final Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()){
            final String name = parameterNames.nextElement();
            final String value = request.getParameter(name);
            if(name.equals(Video.VIDEO_POINT)
                    ||name.equals(Video.VIDEO_STATUS)
                    ||name.equals(Video.VIDEO_TYPE)){
                oldVideo.put(name,Integer.valueOf(value));
            }
            oldVideo.put(name,value);
        }

        videoMgmtService.updateVideo(videoId,oldVideo);

        JSONObject newVideo  = videoQueryService.getVideo(videoId);

        dataModel.put(Video.VIDEO,newVideo);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
        response.sendRedirect(Latkes.getServePath() + "/video/"+videoId);
    }

    /**
     *
     * @param context
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestProcessing(value = "/video/front/check", method = HTTPRequestMethod.GET)
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
        }else if ("format".equals(type)){
            dataModel.put(Keys.MSG,"..(≥◇≤)..格式出错了哟~");
        }else if ("MaxSize".equals(type)){
            dataModel.put(Keys.MSG,"哎呀~视频太大了我承受不住了~~w_w~~");
        }else if("MinSize".equals(type)){
            dataModel.put(Keys.MSG,"哎呀~视频太小了  w_w");
        }else {
            dataModel.put(Keys.MSG,"< ( _ _ ) >哎呀~存储空间不够了，快去积分兑换吧~");
        }
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }
    /**
     * Lists mans.
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/video/front/videos", method = HTTPRequestMethod.POST)
    public void listMans(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        context.renderJSON().renderTrueResult();

        String pageNumStr = request.getParameter("p");
        if (StringUtils.isBlank(pageNumStr)) {
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
        //图片地址
        videoFields.put(Video.VIDEO_IMAGE_PATH,String.class);
        //描述
        videoFields.put(Video.VIDEO_REMARKS,String.class);
        //创建日期
        videoFields.put(Video.VIDEO_CREATE_TIME,String.class);
        //下载地址
        videoFields.put(Video.VIDEO_DOWN_PATH,String.class);

        final JSONObject result = videoQueryService.getVideos(requestJSONObject,videoFields);
        final List<JSONObject> videos = CollectionUtils.jsonArrayToList(result.optJSONArray(Video.VIDEOS));

        context.renderJSONValue(Video.VIDEOS, videos);
    }

    /**
     * Sticks an article.
     *
     * @param request  the specified HTTP servlet request
     * @param response the specified HTTP servlet response
     * @param context  the specified HTTP request context
     * @throws Exception exception
     */
    @RequestProcessing(value = "/video/stick", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = StopwatchEndAdvice.class)
    public void stickVidoe(final HttpServletRequest request, final HttpServletResponse response, final HTTPRequestContext context)
            throws Exception {
        final JSONObject currentUser = userQueryService.getCurrentUser(request);
        if (null == currentUser) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);

            return;
        }

        final String videoId = request.getParameter(Video.VIDEO_T_ID);
        if (Strings.isEmptyOrNull(videoId)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);

            return;
        }

        final JSONObject vidoe = videoQueryService.getVideo(videoId);
        if (null == vidoe) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);

            return;
        }

        if (!currentUser.optString(Keys.OBJECT_ID).equals(vidoe.optString(Video.VIDEO_AUTHORID))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);

            return;
        }

        context.renderJSON();

        try {
            videoMgmtService.stick(videoId);
        } catch (final ServiceException e) {
            context.renderMsg(e.getMessage());

            return;
        }

        context.renderTrueResult().renderMsg(langPropsService.get("stickSuccLabel"));
    }
}
