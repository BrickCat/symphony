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
import org.b3log.latke.servlet.renderer.freemarker.FreeMarkerRenderer;
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
import java.util.*;


/**
 * Created by Seven on 17/5/14.
 */
@RequestProcessor
public class TrendsProcessor {

    /**
     * logger
     */
    private static final Logger LOGGER = Logger.getLogger(TrendsProcessor.class);

    /**
     * pagination window size
     */
    private static final int WINDOW_SIZE = 15;

    /**
     * Avatar query service.
     */
    @Inject
    private AvatarQueryService avatarQueryService;

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

    /**
     * Article query service.
     */
    @Inject
    private ArticleQueryService articleQueryService;

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
    /**
     * Trend service.
     */
    @Inject
    private TrendsQueryService trendsQueryService;

    /**
     * Trend mgmt service.
     */
    @Inject
    private TrendsMgmtService trendsMgmtService;


    @RequestProcessing(value = "/trends", method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, AnonymousViewCheck.class})
    @After(adviceClass = {CSRFToken.class, PermissionGrant.class, StopwatchEndAdvice.class})
    public void frontTrends(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        final Map<String, Object> dataModel = renderer.getDataModel();
        renderer.setTemplateName("/trends.ftl");

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
        final String trendId = request.getParameter(Trend.TREND_T_ID);
        if (!Strings.isEmptyOrNull(trendId)) {
            //标题
            requestJSONObject.put(Trend.TREND_T_ID, trendId);
        }
        final Map<String, Class<?>> trendFields = new HashMap<>();
        trendFields.put(Keys.OBJECT_ID, String.class);
        trendFields.put(Trend.TREND_AUTHOR_ID,String.class);
        trendFields.put(Trend.TREND_TITLE,String.class);
        trendFields.put(Trend.TREND_CONTENT,String.class);
        trendFields.put(Trend.TREND_CREATE_TIME,String.class);
        trendFields.put(Trend.TREND_STATUS,String.class);
        trendFields.put(Trend.TREND_GOOD_CNT,Integer.class);
        trendFields.put(Trend.TREND_BAD_CNT,Integer.class);
        trendFields.put(Trend.TREND_VIEW_CNT,Integer.class);
        trendFields.put(Trend.TREND_COMMENT_CNT,Integer.class);
        trendFields.put(Trend.TREND_GIFT_CNT,Integer.class);
        trendFields.put(Trend.TREND_COLLECT_CNT,Integer.class);
        trendFields.put(Trend.TREND_IMAGE_URL,String.class);
        trendFields.put(Trend.TREND_CREATE_TIME,Long.class);
        trendFields.put(Trend.TREND_UPDATE_TIME,Long.class);
        trendFields.put(Trend.TREND_LATEST_CMT_TIME,Long.class);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
        final boolean isLoggedIn = (Boolean) dataModel.get(Common.IS_LOGGED_IN);

        final JSONObject results = trendsQueryService.getTrends(requestJSONObject,trendFields,isLoggedIn);
        final List<JSONObject> trends = CollectionUtils.jsonArrayToList(results.optJSONArray(Trend.TRENDS));
        dataModel.put(Trend.TRENDS, trends);

        final JSONObject pagination = results.optJSONObject(Pagination.PAGINATION);
        final int pageCount = pagination.optInt(Pagination.PAGINATION_PAGE_COUNT);
        final JSONArray pageNums = pagination.optJSONArray(Pagination.PAGINATION_PAGE_NUMS);
        dataModel.put(Pagination.PAGINATION_FIRST_PAGE_NUM, pageNums.opt(0));
        dataModel.put(Pagination.PAGINATION_LAST_PAGE_NUM, pageNums.opt(pageNums.length() - 1));
        dataModel.put(Pagination.PAGINATION_CURRENT_PAGE_NUM, pageNum);
        dataModel.put(Pagination.PAGINATION_PAGE_COUNT, pageCount);
        dataModel.put(Pagination.PAGINATION_PAGE_NUMS, CollectionUtils.jsonArrayToList(pageNums));
        dataModelService.fillHeaderAndFooter(request, response, dataModel);

        final int avatarViewMode = (int) request.getAttribute(UserExt.USER_AVATAR_VIEW_MODE);

        final JSONObject result = articleQueryService.getRecentArticles(avatarViewMode, 0, pageNum, pageSize);
        final List<JSONObject> allArticles = (List<JSONObject>) result.get(Article.ARTICLES);

        final List<JSONObject> stickArticles = new ArrayList<>();

        final Iterator<JSONObject> iterator = allArticles.iterator();
        while (iterator.hasNext()) {
            final JSONObject article = iterator.next();

            final boolean stick = article.optInt(Article.ARTICLE_T_STICK_REMAINS) > 0;
            article.put(Article.ARTICLE_T_IS_STICK, stick);

            if (stick) {
                stickArticles.add(article);
                iterator.remove();
            }
        }
        dataModel.put(Common.STICK_ARTICLES, stickArticles);
        dataModel.put(Common.LATEST_ARTICLES, allArticles);
        dataModelService.fillRandomArticles(avatarViewMode, dataModel);
        dataModelService.fillSideHotArticles(avatarViewMode, dataModel);
        dataModelService.fillSideTags(dataModel);
        dataModelService.fillLatestCmts(dataModel);
    }

    @RequestProcessing(value = "/trends/{trendId}",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void showTrend(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response,
                          final String trendId) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("admin/trend.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();;
        final JSONObject trend = trendsQueryService.getTrend(trendId);
        dataModel.put(Trend.TREND,trend);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    @RequestProcessing(value = "/trends/add-trends",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void  addTrend (final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServiceException {
        String content = request.getParameter(Trend.TREND_CONTENT);
        String trendId = request.getParameter(Trend.TREND_T_ID);
        String trendTitle = request.getParameter(Trend.TREND_TITLE);
        try {
            final JSONObject trend = trendsQueryService.getTrend(trendId);
            if(null == trend){
                LOGGER.log(Level.ERROR, "add trend failed");
                return;
            }
            trend.put(Trend.TREND_CONTENT,content);
            trend.put(Trend.TREND_TITLE,trendTitle);
            trendsMgmtService.updateTrend(trendId,trend);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        response.sendRedirect(Latkes.getServePath() + "/admin/trends");
    }

    @RequestProcessing(value = "/trends/{trendId}/update-trend",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void updateTrend(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response,
                            final String trendId) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("admin/trend.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        JSONObject oldTrend = trendsQueryService.getTrend(trendId);
        if (null == oldTrend){
            LOGGER.error("not find trend id = "+trendId+",update error");
            return;
        }
        final Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()){
            final String name = parameterNames.nextElement();
            final String value = request.getParameter(name);
            oldTrend.put(name,value);
        }
        trendsMgmtService.updateTrend(trendId,oldTrend);

        JSONObject newTrend = trendsQueryService.getTrend(trendId);

        dataModel.put(Trend.TREND,newTrend);
        dataModelService.fillHeaderAndFooter(request,response,dataModel);
        response.sendRedirect(Latkes.getServePath() + "/trends/"+trendId);
    }
    @RequestProcessing(value = "/trends/remove-trend", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void removeTrend(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final String trendId = request.getParameter(Trend.TREND_T_ID);
        trendsMgmtService.deleteTrend(trendId);

        response.sendRedirect(Latkes.getServePath() + "/admin/trends");
    }

    @RequestProcessing(value = "/trend/thank",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = StopwatchEndAdvice.class)
    public void thank(final HttpServletRequest request, final HttpServletResponse response, final HTTPRequestContext context)
            throws Exception {
        final JSONObject currentUser = userQueryService.getCurrentUser(request);
        if (null == currentUser) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);

            return;
        }

        final String trendId = request.getParameter(Trend.TREND_T_ID);
        if (Strings.isEmptyOrNull(trendId)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);

            return;
        }

        context.renderJSON();

        try {
            trendsMgmtService.thank(trendId, currentUser.optString(Keys.OBJECT_ID));
        } catch (final ServiceException e) {
            context.renderMsg(langPropsService.get("transferFailLabel"));

            return;
        }

        context.renderTrueResult();
    }

    @RequestProcessing(value = "/trend/{trendId}/info",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, AnonymousViewCheck.class})
    @After(adviceClass = {CSRFToken.class, PermissionGrant.class, StopwatchEndAdvice.class})
    public void trend(final HttpServletRequest request, final HttpServletResponse response, final HTTPRequestContext context,
                      final String trendId)
            throws Exception{
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("/trend.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        final int avatarViewMode = (int) request.getAttribute(UserExt.USER_AVATAR_VIEW_MODE);

        final JSONObject trend = trendsQueryService.getTrendById(avatarViewMode,trendId);


        if (null == trend){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        final HttpSession session = request.getSession(false);
        if (null != session){
            session.setAttribute(Trend.TREND_T_ID,trendId);
        }

        dataModelService.fillHeaderAndFooter(request, response, dataModel);

        final String authorId = trend.optString(Trend.TREND_AUTHOR_ID);

        final JSONObject author = userQueryService.getUser(authorId);
        trend.put(Trend.TREND_T_AUTHOR_NAME,author.optString(User.USER_NAME));
        trend.put(Trend.TREND_T_AUTHOR_URL, author.optString(User.USER_URL));
        trend.put(Trend.TREND_T_AUTHOR_INTRO, author.optString(UserExt.USER_INTRO));


        final JSONObject currentUser = userQueryService.getCurrentUser(request);
        final String userId = currentUser.optString(Keys.OBJECT_ID);


        dataModel.put(Trend.TREND,trend);

        trend.put(Common.IS_MY_TREND, false);
        trend.put(Trend.TREND_T_AUTHOR, author);

        String cmtViewModeStr = request.getParameter("m");

        String currentUserId = null;
        final boolean isLoggedIn = (Boolean) dataModel.get(Common.IS_LOGGED_IN);

        if (isLoggedIn){
            currentUserId = currentUser.optString(Keys.OBJECT_ID);
            trend.put(Common.IS_MY_VIDEO, currentUserId.equals(trend.optString(Trend.TREND_AUTHOR_ID)));

            final int trendVote = voteQueryService.isVoted(userId, trendId);
            dataModel.put(Trend.TREND_T_VOTE, trendVote);

            final boolean isFollowing = followQueryService.isFollowing(userId, trendId, Follow.FOLLOWING_TYPE_C_TREND);
            dataModel.put(Common.IS_FOLLOWING, isFollowing);

            final boolean isComment = commentQueryService.isComment(userId, trendId);
            dataModel.put(Common.IS_COMMENT, isComment);

            boolean isGift = rewardQueryService.isRewarded(userId, trendId, Reward.TYPE_C_THANK_TREND);
            dataModel.put(Common.IS_GIFT, isGift);

            if (Strings.isEmptyOrNull(cmtViewModeStr) || !Strings.isNumeric(cmtViewModeStr)) {
                cmtViewModeStr = currentUser.optString(UserExt.USER_COMMENT_VIEW_MODE);
            }
        }else if (Strings.isEmptyOrNull(cmtViewModeStr) || !Strings.isNumeric(cmtViewModeStr)) {
            cmtViewModeStr = "0";
        }
        final int cmtViewMode = Integer.valueOf(cmtViewModeStr);
        dataModel.put(UserExt.USER_COMMENT_VIEW_MODE, cmtViewMode);

        if(!(Boolean)request.getAttribute((Keys.HttpRequest.IS_SEARCH_ENGINE_BOT))){
            trendsMgmtService.inTrendViewCount(trendId);
        }

        String pageNumStr = request.getParameter("p");
        if (Strings.isEmptyOrNull(pageNumStr) || !Strings.isNumeric(pageNumStr)) {
            pageNumStr = "1";
        }

        final int pageNum = Integer.valueOf(pageNumStr);
        final int pageSize = Symphonys.getInt("articleCommentsPageSize");
        final int windowSize = Symphonys.getInt("articleCommentsWindowSize");

        final int commentCnt = trend.getInt(Trend.TREND_COMMENT_CNT);
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

        final String commenterId = trend.optString(Trend.TREND_AUTHOR_ID);
        final JSONObject videoer = userQueryService.getUser(commenterId);

        // Load comments
        final List<JSONObject> trendComments =
                commentQueryService.getArticleComments(avatarViewMode, trendId, pageNum, pageSize, cmtViewMode);
        trend.put(Trend.TREND_T_COMMENTS, (Object) trendComments);
        trend.put(Trend.TREND_T_AUTHOR_THUMBNAIL_URL, avatarQueryService.getAvatarURLByUser(
                UserExt.USER_AVATAR_VIEW_MODE_C_ORIGINAL, videoer, "48"));
        // Fill comment thank
        Stopwatchs.start("Fills comment thank");
        try{
            final String thankTemplate = langPropsService.get("thankConfirmLabel");
            for (final JSONObject comment : trendComments){
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

        dataModel.put(Common.SELECTED, Common.TRENDS);

        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }
}
