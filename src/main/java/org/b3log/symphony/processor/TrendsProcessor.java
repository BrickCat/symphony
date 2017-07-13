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
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
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
        trendFields.put(Trend.TREND_VIEW_CNT,Integer.class);
        trendFields.put(Trend.TREND_COMMENT_CNT,Integer.class);
        trendFields.put(Trend.TREND_IMAGE_URL,String.class);
        trendFields.put(Trend.TREND_CREATE_TIME,Long.class);
        trendFields.put(Trend.TREND_UPDATE_TIME,Long.class);
        trendFields.put(Trend.TREND_LATEST_CMT_TIME,Long.class);

        final JSONObject results = trendsQueryService.getTrends(requestJSONObject,trendFields);
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
}
