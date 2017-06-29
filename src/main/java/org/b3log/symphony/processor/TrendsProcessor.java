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
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }


    @RequestProcessing(value = "/trends/add-trends",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void  addTrend (final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServiceException {
        String content = request.getParameter(Trend.TREND_CONTENT);
        String trendId = request.getParameter(Trend.TREND_T_ID);
        try {
            final JSONObject trend = trendsQueryService.getTrend(trendId);
            if(null == trend){
                LOGGER.log(Level.ERROR, "add trend failed");
                return;
            }
            trend.put(Trend.TREND_CONTENT,content);
            trendsMgmtService.updateTrend(trendId,trend);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        response.sendRedirect(Latkes.getServePath() + "/admin/trends");
    }
}
