package org.b3log.symphony.processor;

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
import org.b3log.latke.util.Ids;
import org.b3log.latke.util.Strings;
import org.b3log.symphony.model.Mind;
import org.b3log.symphony.model.Trend;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.processor.advice.PermissionGrant;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.*;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Seven on 17/5/14.
 */
@RequestProcessor
public class MindProcessor {

    /**
     * logger
     */
    private static final Logger LOGGER = Logger.getLogger(MindProcessor.class);

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
     * Language service.
     */
    @Inject
    private MindMgmtService mindMgmtService;

    /**
     * Language service.
     */
    @Inject
    private MindQueryService mindQueryService;

    @RequestProcessing(value = "/mind/add-mind",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    public void addMind(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response){
        context.renderJSON();
        final JSONObject mind = new JSONObject();

        //获取当前用户
        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String currentUserId = currentUser.optString(Keys.OBJECT_ID);

        mind.put(Mind.MIND_AUTHOR_ID,currentUserId);
        mind.put(Mind.MIND_CONTENT,request.getParameter(Mind.MIND_CONTENT));
        mind.put(Mind.MIND_TYPE,request.getParameter(Mind.MIND_TYPE));

        String ret = mindMgmtService.addMind(mind);

        context.renderJSONValue(Mind.MIND_T_ID,ret);
    }

    @RequestProcessing(value = "/mind/update-mind",method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, PermissionCheck.class})
    public void updateMind(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        context.renderJSON();
        final String mindId = request.getParameter(Mind.MIND_T_ID);

        JSONObject mind = mindQueryService.getMind(mindId);

        if(null == mind){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        mind.put(Mind.MIND_CONTENT,request.getParameter(Mind.MIND_CONTENT));
        mind.put(Mind.MIND_UPDATE_TIME, Ids.genTimeMillisId());

        String ret = mindMgmtService.updateMind(mindId,mind);

        context.renderJSONValue(Mind.MIND_T_ID,ret);

        context.renderJSONValue(Mind.MIND_CONTENT+"1",mind.optString(Mind.MIND_CONTENT));
    }



}
