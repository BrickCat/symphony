package org.b3log.symphony.processor;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.Latkes;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
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
import org.b3log.latke.util.Strings;
import org.b3log.symphony.model.*;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.processor.advice.PermissionGrant;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.*;
import org.b3log.symphony.util.Times;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;


/**
 * Created by Seven on 17/5/14.
 */
@RequestProcessor
public class MallProcessor {

    /**
     * logger
     */
    private static final Logger LOGGER = Logger.getLogger(MallProcessor.class);

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
     * Option query service.
     */
    @Inject
    private OptionQueryService optionQueryService;
    /**
     * Article query service.
     */
    @Inject
    private ArticleQueryService articleQueryService;
    /**
     * User query service.
     */
    @Inject
    private UserQueryService userQueryService;

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

    @RequestProcessing(value = "/mall",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void mallIndex(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/index.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();
        dataModel.put(Common.SELECTED, Common.MALL);
        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    @RequestProcessing(value = "/mall/checkout",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void mallCheckOut(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/checkout.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

    @RequestProcessing(value = "/mall/apparatus",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void mallApparatus(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/apparatus.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        dataModelService.fillHeaderAndFooter(request, response, dataModel);
   }

   @RequestProcessing(value = "/mall/single",method = HTTPRequestMethod.GET)
   @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
   @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
   public void mallSingle(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
       final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
       context.setRenderer(renderer);
       renderer.setTemplateName("mall/single.ftl");
       final Map<String, Object> dataModel = renderer.getDataModel();

       dataModelService.fillHeaderAndFooter(request, response, dataModel);
   }

/**
 * admin************************************************************************************************************************************************************************************************************************
 */

    /**
     * Month days.
     */
    private final List<String> monthDays = new ArrayList<>();

    /**
     * User counts.
     */
    private final List<Integer> userCnts = new ArrayList<>();

    /**
     * Article counts.
     */
    private final List<Integer> articleCnts = new ArrayList<>();

    /**
     * Comment counts.
     */
    private final List<Integer> commentCnts = new ArrayList<>();

    /**
     * History months.
     */
    private final List<String> months = new ArrayList<>();

    /**
     * History user counts.
     */
    private final List<Integer> historyUserCnts = new ArrayList<>();

    /**
     * History article counts.
     */
    private final List<Integer> historyArticleCnts = new ArrayList<>();

    /**
     * History comment counts.
     */
    private final List<Integer> historyCommentCnts = new ArrayList<>();

    /**
     * Loads chart data.
     *
     * @param request the specified HTTP servlet request
     * @param response the specified HTTP servlet response
     * @param context the specified HTTP request context
     * @throws Exception exception
     */
    @RequestProcessing(value = "/mall/cron/chart",method = HTTPRequestMethod.GET)
    @Before(adviceClass = StopwatchStartAdvice.class)
    @After(adviceClass = StopwatchEndAdvice.class)
    public void mallCharts(final HttpServletRequest request, final HttpServletResponse response, final HTTPRequestContext context) throws ServiceException {
        final Date end = new Date();
        final Date dayStart = DateUtils.addDays(end, -30);

        monthDays.clear();
        userCnts.clear();
        articleCnts.clear();
        commentCnts.clear();
        months.clear();
        historyArticleCnts.clear();
        historyCommentCnts.clear();
        historyUserCnts.clear();

        for (int i = 0; i < 31; i++) {
            final Date day = DateUtils.addDays(dayStart, i);
            monthDays.add(DateFormatUtils.format(day, "yyyy-MM-dd"));

            final int userCnt = userQueryService.getUserCntInDay(day);
            userCnts.add(userCnt);

            final int articleCnt = articleQueryService.getArticleCntInDay(day);
            articleCnts.add(articleCnt);

            final int commentCnt = commentQueryService.getCommentCntInDay(day);
            commentCnts.add(commentCnt);
        }

        final JSONObject firstAdmin = userQueryService.getAdmins().get(0);
        final long monthStartTime = Times.getMonthStartTime(firstAdmin.optLong(Keys.OBJECT_ID));
        final Date monthStart = new Date(monthStartTime);

        int i = 1;
        while (true) {
            final Date month = DateUtils.addMonths(monthStart, i);

            if (month.after(end)) {
                break;
            }

            i++;

            months.add(DateFormatUtils.format(month, "yyyy-MM"));

            final int userCnt = userQueryService.getUserCntInMonth(month);
            historyUserCnts.add(userCnt);

            final int articleCnt = articleQueryService.getArticleCntInMonth(month);
            historyArticleCnts.add(articleCnt);

            final int commentCnt = commentQueryService.getCommentCntInMonth(month);
            historyCommentCnts.add(commentCnt);
        }
    }

    /**
     * Shows data chart.
     *
     * @param context the specified context
     * @param request the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/admin/mall",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void adminMall(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/admin-index.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        dataModel.put("monthDays", monthDays);
        dataModel.put("userCnts", userCnts);
        dataModel.put("articleCnts", articleCnts);
        dataModel.put("commentCnts", commentCnts);

        dataModel.put("months", months);
        dataModel.put("historyUserCnts", historyUserCnts);
        dataModel.put("historyArticleCnts", historyArticleCnts);
        dataModel.put("historyCommentCnts", historyCommentCnts);

        dataModelService.fillHeaderAndFooter(request, response, dataModel);

        final int avatarViewMode = (int) request.getAttribute(UserExt.USER_AVATAR_VIEW_MODE);

        dataModelService.fillRandomArticles(avatarViewMode, dataModel);
        dataModelService.fillSideHotArticles(avatarViewMode, dataModel);
        dataModelService.fillSideTags(dataModel);
        dataModelService.fillLatestCmts(dataModel);

        dataModel.put(Common.ONLINE_VISITOR_CNT, optionQueryService.getOnlineVisitorCount());
        dataModel.put(Common.ONLINE_MEMBER_CNT, optionQueryService.getOnlineMemberCount());

        final JSONObject statistic = optionQueryService.getStatistic();
        dataModel.put(Option.CATEGORY_C_STATISTIC, statistic);
    }

    /**
     * products list.
     *
     * @param context the specified context
     * @param request the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/admin/mall/products",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void mallProducts(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/products.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        dataModelService.fillHeaderAndFooter(request, response, dataModel);

    }

    /**
     * add a product.
     *
     * @param context the specified context
     * @param request the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/admin/mall/add-product",method = HTTPRequestMethod.GET)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    @After(adviceClass = {PermissionGrant.class, StopwatchEndAdvice.class})
    public void mallAddProducts(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/add-product.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        dataModelService.fillHeaderAndFooter(request, response, dataModel);

    }

    /**
     *  mall image util corpper.
     *
     * @param context the specified context
     * @param request the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/admin/mall/corpper",method = HTTPRequestMethod.GET)
    public void mallCorpper(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("mall/corpper.ftl");
        final Map<String, Object> dataModel = renderer.getDataModel();

        dataModelService.fillHeaderAndFooter(request, response, dataModel);
    }

}
