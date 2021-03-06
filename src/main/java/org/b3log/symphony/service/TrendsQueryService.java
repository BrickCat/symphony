package org.b3log.symphony.service;

import org.apache.commons.lang3.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.repository.*;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.Locales;
import org.b3log.latke.util.Paginator;
import org.b3log.latke.util.Stopwatchs;
import org.b3log.symphony.model.*;
import org.b3log.symphony.processor.advice.validate.UserRegisterValidation;
import org.b3log.symphony.repository.CommentRepository;
import org.b3log.symphony.repository.TrendsRepository;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.b3log.symphony.util.Times;
import org.b3log.symphony.util.TrendUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 860117030 on 2017/6/6.
 */
@Service
public class TrendsQueryService {
    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(TrendsQueryService.class);
    /**
     * User repository.
     */
    @Inject
    private UserRepository userRepository;
    /**
     * Video repository
     */
    @Inject
    private TrendsRepository trendsRepository;

    /**
     * Comment repository.
     */
    @Inject
    private CommentRepository commentRepository;
    /**
     * User query service.
     */
    @Inject
    private UserQueryService userQueryService;
    /**
     * Avatar query service.
     */
    @Inject
    private AvatarQueryService avatarQueryService;

    /**
     * Vote query service.
     */
    @Inject
    private VoteQueryService voteQueryService;

    /**
     * Follow query service.
     */
    @Inject
    private FollowQueryService followQueryService;

    /**
     * Follow query service.
     */
    @Inject
    private CommentQueryService commentQueryService;

    /**
     * Reward query service.
     */
    @Inject
    private RewardQueryService rewardQueryService;

    public JSONObject getTrend(final String trendId) throws ServiceException {
        try {
            return trendsRepository.get(trendId);
        } catch (final RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets a user failed", e);
            throw new ServiceException(e);
        }
    }
    public JSONObject getTrends(final JSONObject requestJSONObject, final Map<String, Class<?>> trendFields,final boolean isLoggedIn) throws ServiceException {
        final JSONObject ret = new JSONObject();

        final int currentPageNum = requestJSONObject.optInt(Pagination.PAGINATION_CURRENT_PAGE_NUM);
        final int pageSize = requestJSONObject.optInt(Pagination.PAGINATION_PAGE_SIZE);
        final int windowSize = requestJSONObject.optInt(Pagination.PAGINATION_WINDOW_SIZE);
        final Query query = new Query().setCurrentPageNum(currentPageNum).setPageSize(pageSize).
                addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : trendFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }
        if (requestJSONObject.has(Trend.TREND_T_ID)) {
            query.setFilter(new PropertyFilter(Trend.TREND_T_ID, FilterOperator.EQUAL, requestJSONObject.optString(Trend.TREND_T_ID)));
        }

        JSONObject result = null;

        try {
            result = trendsRepository.get(query);
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets tags failed", e);
        }
        final int pageCount = result.optJSONObject(Pagination.PAGINATION).optInt(Pagination.PAGINATION_PAGE_COUNT);
        final JSONObject pagination = new JSONObject();
        ret.put(Pagination.PAGINATION, pagination);
        final List<Integer> pageNums = Paginator.paginate(currentPageNum, pageSize, pageCount, windowSize);
        pagination.put(Pagination.PAGINATION_PAGE_COUNT, pageCount);
        pagination.put(Pagination.PAGINATION_PAGE_NUMS, pageNums);

        final JSONArray data = result.optJSONArray(Keys.RESULTS);
        final List<JSONObject> trends = CollectionUtils.<JSONObject>jsonArrayToList(data);

        ret.put(Trend.TRENDS,trends);
        for (JSONObject trend : trends){
            trend.put(Trend.TREND_CREATE_TIME,new Date(trend.optLong(Keys.OBJECT_ID)));
            trend.put(Trend.TREND_CONTENT, trend.optString(Trend.TREND_CONTENT));
            final String senderId = trend.optString(Trend.TREND_AUTHOR_ID);
            final JSONObject sernder = userQueryService.getUser(senderId);
            trend.put(Trend.TREND_T_AUTHOR,sernder);
            trend.put(Trend.TREND_T_PARTICIPANT_THUMBNAIL_URL, avatarQueryService.getAvatarURLByUser(
                    UserExt.USER_AVATAR_VIEW_MODE_C_ORIGINAL, sernder, "48"));
            organizeTrend(trend);
            final String trendId =  trend.optString(Keys.OBJECT_ID);
            if (isLoggedIn){
                final int trendVote = voteQueryService.isVoted(senderId, trendId);
                trend.put(Trend.TREND_T_VOTE, trendVote);
                final boolean isFollowing = followQueryService.isFollowing(senderId, trendId, Follow.FOLLOWING_TYPE_C_TREND);
                trend.put(Common.IS_FOLLOWING, isFollowing);
                final boolean isComment = commentQueryService.isComment(senderId, trendId);
                trend.put(Common.IS_COMMENT, isComment);
                boolean isGift = rewardQueryService.isRewarded(senderId, trendId, Reward.TYPE_C_THANK_TREND);
                trend.put(Common.IS_GIFT, isGift);

            }
            String imageUrl[] = trend.optString(Trend.TREND_IMAGE_URL).split(",");
            if(imageUrl.length > 1){
                trend.put(Trend.IMAGE_STATUS,Trend.IMAGE_MORE);
            }else {
                trend.put(Trend.IMAGE_STATUS,Trend.IMAGE_ONCE);
            }
        }

        return ret;
    }

    public JSONObject getSearchTrends(final int avatarViewMode, final Map<String, Class<?>> trendFields) throws ServiceException {
        final JSONObject ret = new JSONObject();

        final Query query = new Query().
                addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : trendFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }

        JSONObject result = null;

        try {
            result = trendsRepository.get(query);
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets tags failed", e);
        }
        final JSONArray data = result.optJSONArray(Keys.RESULTS);
        final List<JSONObject> trends = CollectionUtils.<JSONObject>jsonArrayToList(data);

        List<JSONObject> list = new ArrayList<JSONObject>();
        for (final JSONObject trend :trends ){
            JSONObject search = new JSONObject();
            search.put(Keys.OBJECT_ID,trend.optString(Keys.OBJECT_ID));
            search.put(Article.ARTICLE_TITLE,trend.optString(Trend.TREND_TITLE));
            search.put(Common.TYPE,2);
            final String senderId = trend.optString(Trend.TREND_AUTHOR_ID);
            final JSONObject sernder = userQueryService.getUser(senderId);
            search.put(Article.ARTICLE_T_AUTHOR_THUMBNAIL_URL + "48",
                    avatarQueryService.getAvatarURLByUser(avatarViewMode, sernder, "48"));
            list.add(search);
        }

        ret.put(Trend.TRENDS,list);

        return ret;
    }
    private void organizeTrend(final JSONObject trend) {
        toTrendDate(trend);

        final String trendId = trend.optString(Keys.OBJECT_ID);

        final int viewCnt = trend.optInt(Trend.TREND_VIEW_CNT);
        final double views = (double)viewCnt/1000;
        if(views>=1){
            final DecimalFormat df = new DecimalFormat("#.#");
            trend.put(Trend.TREND_T_VIEW_CNT_DISPLAY_FORMAT,df.format(views)+"K");
        }

        String trendLatestCmterName = trend.optString(Trend.TREND_LATEST_CMTER_NAME);
        if(StringUtils.isNotBlank(trendLatestCmterName)
                && UserRegisterValidation.invalidUserName(trendLatestCmterName)){
            trendLatestCmterName = UserExt.ANONYMOUS_USER_NAME;
            trend.put(Trend.TREND_LATEST_CMTER_NAME,trendLatestCmterName);
        }
        final Query query = new Query()
                .setPageCount(1).setCurrentPageNum(1).setPageSize(1)
                .setFilter(new PropertyFilter(Comment.COMMENT_ON_ARTICLE_ID, FilterOperator.EQUAL, trendId)).
                        addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);

        try {
            final JSONArray cmts = commentRepository.get(query).optJSONArray(Keys.RESULTS);
            if (cmts.length()>0){
                final  JSONObject latestCmt = cmts.optJSONObject(0);
                latestCmt.put(Comment.COMMENT_CLIENT_COMMENT_ID,latestCmt.optString(Comment.COMMENT_CLIENT_COMMENT_ID));
                trend.put(Trend.TREND_T_LATEST_CMT,latestCmt);
            }
        } catch (RepositoryException e) {
            e.printStackTrace();
        }

    }
    private void toTrendDate(final JSONObject trend) {
        trend.put(Common.TIME_AGO, Times.getTimeAgo(trend.optLong(Keys.OBJECT_ID), Locales.getLocale()));
        trend.put(Common.CMT_TIME_AGO,Times.getTimeAgo(trend.optLong(Trend.TREND_LATEST_CMT_TIME),Locales.getLocale()));
        trend.put(Trend.TREND_CREATE_TIME,new Date(trend.optLong(Trend.TREND_CREATE_TIME)));
        trend.put(Trend.TREND_UPDATE_TIME,trend.optLong(Trend.TREND_UPDATE_TIME));
        trend.put(Trend.TREND_LATEST_CMT_TIME,trend.optLong(Trend.TREND_LATEST_CMT_TIME));
    }


    public JSONObject getTrendById(final int avatarViewMode, final String trendId)throws ServiceException {
        Stopwatchs.start("Get trend by id");
        try {
        final JSONObject trend = trendsRepository.get(trendId);
        if(null == trend){
            return null;
        }
        organizeTrend(avatarViewMode,trend);
        return trend;
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets an trend [trendId=" + trendId + "] failed", e);
            throw new ServiceException(e);
        }finally {
            Stopwatchs.end();
        }
    }

    private void organizeTrend(int avatarViewMode, JSONObject trend) {
        toTrendDate(trend);
        final String trendId = trend.optString(Keys.OBJECT_ID);

        final int viewCnt = trend.optInt(Trend.TREND_VIEW_CNT);

        final double views = (double)viewCnt/1000;

        String imageUrl[] = trend.optString(Trend.TREND_IMAGE_URL).split(",");
        if(imageUrl.length > 1){
            trend.put(Trend.IMAGE_STATUS,Trend.IMAGE_MORE);
        }else {
            trend.put(Trend.IMAGE_STATUS,Trend.IMAGE_ONCE);
        }

        if (views >= 1){
            final DecimalFormat df = new DecimalFormat("#.#");
            trend.put(Trend.TREND_T_VIEW_CNT_DISPLAY_FORMAT,df.format(views)+"K");
        }
        String trendLatestCmterName = trend.optString(Trend.TREND_LATEST_CMTER_NAME);
        if(StringUtils.isNotBlank(trendLatestCmterName)
                && UserRegisterValidation.invalidUserName(trendLatestCmterName)){
            trendLatestCmterName = UserExt.ANONYMOUS_USER_NAME;
            trend.put(Trend.TREND_LATEST_CMTER_NAME,trendLatestCmterName);
        }

        final Query query = new Query()
                .setPageCount(1).setCurrentPageNum(1).setPageSize(1)
                .setFilter(new PropertyFilter(Comment.COMMENT_ON_ARTICLE_ID, FilterOperator.EQUAL, trendId)).
                        addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        try {
            final JSONArray cmts = commentRepository.get(query).optJSONArray(Keys.RESULTS);
            if (cmts.length()>0){
                final  JSONObject latestCmt = cmts.optJSONObject(0);
                latestCmt.put(Comment.COMMENT_CLIENT_COMMENT_ID,latestCmt.optString(Comment.COMMENT_CLIENT_COMMENT_ID));
                trend.put(Trend.TREND_T_LATEST_CMT,latestCmt);
            }
        } catch (RepositoryException e) {
            e.printStackTrace();
        }


    }

    /**
     * Gets the user videos with the specified user id, page number and page size.
     *
     * @param avatarViewMode the specified avatar view mode
     * @param userId         the specified user id
     * @param currentPageNum the specified page number
     * @param pageSize       the specified page size
     * @return user articles, return an empty list if not found
     * @throws ServiceException service exception
     */
    public List<JSONObject> getUserTrends(final int avatarViewMode, final String userId,
                                          final int currentPageNum, final int pageSize) throws ServiceException {
        final Query query = new Query().addSort(Trend.TREND_CREATE_TIME, SortDirection.DESCENDING)
                .setCurrentPageNum(currentPageNum).setPageSize(pageSize).
                        setFilter(CompositeFilterOperator.and(
                                new PropertyFilter(Trend.TREND_AUTHOR_ID, FilterOperator.EQUAL, userId),
                                new PropertyFilter(Trend.TREND_STATUS, FilterOperator.EQUAL, Trend.TREND_STATUS_C_VALID)));
        try {
            final JSONObject result = trendsRepository.get(query);
            final List<JSONObject> ret = CollectionUtils.<JSONObject>jsonArrayToList(result.optJSONArray(Keys.RESULTS));
            if (ret.isEmpty()) {
                return ret;
            }

            final JSONObject pagination = result.optJSONObject(Pagination.PAGINATION);
            final int recordCount = pagination.optInt(Pagination.PAGINATION_RECORD_COUNT);
            final int pageCount = pagination.optInt(Pagination.PAGINATION_PAGE_COUNT);

            final JSONObject first = ret.get(0);
            first.put(Pagination.PAGINATION_RECORD_COUNT, recordCount);
            first.put(Pagination.PAGINATION_PAGE_COUNT, pageCount);

            organizeTrends(avatarViewMode, ret);

            return ret;
        } catch (final RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets user videos failed", e);
            throw new ServiceException(e);
        }
    }
    /**
     * Organizes the specified articles.
     *
     * @param avatarViewMode the specified avatarViewMode
     * @param videos       the specified videos
     * @throws RepositoryException repository exception
     * @see #organizeTrend(int, org.json.JSONObject)
     */
    public void organizeTrends(final int avatarViewMode, final List<JSONObject> videos) throws RepositoryException {
        Stopwatchs.start("Organize videos");
        try {
            for (final JSONObject video : videos) {
                organizeTrend(avatarViewMode, video);
            }
        } finally {
            Stopwatchs.end();
        }
    }
}

