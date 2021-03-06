package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.repository.*;
import org.b3log.latke.repository.annotation.Transactional;
import org.b3log.latke.service.LangPropsService;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.Ids;
import org.b3log.symphony.model.*;
import org.b3log.symphony.repository.*;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 860117030 on 2017/5/24.
 */
@Service
public class TrendsMgmtService {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(TrendsMgmtService.class.getName());


    /**
     * Option repository.
     */
    @Inject
    private OptionRepository optionRepository;

    /**
     * Tag repository.
     */
    @Inject
    private TagRepository tagRepository;

    /**
     * User query service.
     */
    @Inject
    private UserQueryService userQueryService;
    /**
     * Vidoe repository
     */
    @Inject
    private VideoRepository videoRepository;

    /***
     * User repository
     */
    @Inject
    private UserRepository userRepository;


    /***
     * LangProps repository
     */
    @Inject
    private LangPropsService langPropsService;

    /***
     * LangProps repository
     */
    @Inject
    private TrendsRepository trendsRepository;

    /**
     * Pointtransfer management service.
     */
    @Inject
    private PointtransferMgmtService pointtransferMgmtService;

    @Inject
    private RewardQueryService rewardQueryService;

    @Inject
    private RewardMgmtService rewardMgmtService;

    @Inject
    private NotificationMgmtService notificationMgmtService;

    @Inject
    private LivenessMgmtService livenessMgmtService;

    /**
     * Adds a video
     * @param requestJSONObject
     * @return videoId
     * @throws ServiceException
     */
    public  synchronized String addTrend(final String id,final JSONObject requestJSONObject) throws ServiceException{
        final Transaction transaction = trendsRepository.beginTransaction();
        String ret = null;
        //创建Trend对象
        JSONObject trends = new JSONObject();
        //创建时间
        final long currentTimeMillis = System.currentTimeMillis();
        //ID
        trends.put(Keys.OBJECT_ID,requestJSONObject.optString(Trend.TREND_T_ID));
        //图片路径
        trends.put(Trend.TREND_IMAGE_URL,requestJSONObject.optString(Trend.TREND_IMAGE_URL));
        //作者
        trends.put(Trend.TREND_AUTHOR_ID,requestJSONObject.optString(Trend.TREND_AUTHOR_ID));
        //缩略图路径
        trends.put(Trend.TREND_T_THUMB_URL,requestJSONObject.optString(Trend.TREND_T_THUMB_URL));
        //标题
        trends.put(Trend.TREND_TITLE,"");
        //标签
        trends.put(Trend.TREND_TAGS,"");
        //评论
        trends.put(Trend.TREND_COMMENT_CNT,0);
        //查看
        trends.put(Trend.TREND_VIEW_CNT,0);
        //打赏
        trends.put(Trend.TREND_GIFT_CNT,0);
        //内容
        trends.put(Trend.TREND_CONTENT,"");
        //打赏内容
        trends.put(Trend.TREND_REWARD_CONTENT,"");
        //打赏积分
        trends.put(Trend.TREND_REWARD_POINT,0);
        //绝对地址
        trends.put(Trend.TREND_PERMALINK,"");
        //创建时间
        trends.put(Trend.TREND_CREATE_TIME,currentTimeMillis);
        //更新时间
        trends.put(Trend.TREND_UPDATE_TIME,currentTimeMillis);
        //最后评论时间
        trends.put(Trend.TREND_LATEST_CMT_TIME,0L);
        //最后评论人
        trends.put(Trend.TREND_LATEST_CMTER_NAME,"");
        //是否可以评论
        trends.put(Trend.TREND_COMMENTABLE,0);
        //类别
        trends.put(Trend.TREND_TYPE,0);
        //状态
        trends.put(Trend.TREND_STATUS,0);
        //赞
        trends.put(Trend.TREND_GOOD_CNT,0);
        //踩
        trends.put(Trend.TREND_BAD_CNT,0);
        // 收藏
        trends.put(Trend.TREND_COLLECT_CNT,0);
        //关注
        trends.put(Trend.TREND_WATCH_CNT,0);
        //置顶
        trends.put(Trend.REDDIT_SCORE,0.00);
        //位置
        trends.put(Trend.TREND_CITY,"");
        //IP
        trends.put(Trend.TREND_IP,"'");
        //UA
        trends.put(Trend.TREND_UA,"");
        //优选
        trends.put(Trend.TREND_PERFECT,0);
        try {
            if(!"".equals(id)){
                final JSONObject oldTrends = trendsRepository.get(id);
                if(null == oldTrends){
                    throw new ServiceException("Update a trend failed");
                }
                trendsRepository.update(id,trends);
            }else{
                trendsRepository.add(trends);
            }
            transaction.commit();
            return ret;
        } catch (RepositoryException e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            LOGGER.log(Level.ERROR, "Adds a trend failed", e);
            throw new ServiceException(e);
        }

    }

    /**
     * Updates the specified tag by the given trend id.
     * <p>
     * <b>Note</b>: This method just for admin console.
     * </p>
     *
     * @param trendId the given trend id
     * @param trend   the specified trend
     * @throws ServiceException service exception
     */
    public void updateTrend(final String trendId, final JSONObject trend) throws ServiceException {
        final Transaction transaction = trendsRepository.beginTransaction();
        try{
            trendsRepository.update(trendId,trend);
            transaction.commit();

        }catch (final RepositoryException e){
            if (transaction.isActive()){
                transaction.rollback();
            }
            LOGGER.log(Level.ERROR, "Updates a trend[id=" + trendId + "] failed", e);
            throw new ServiceException(e);
        }

    }

    /**
     * delete a video
     * @param trendId
     */
    @Transactional
    public void deleteTrend(final String trendId) {
        try {
            final JSONObject trend = trendsRepository.get(trendId);
            if (null == trend) {
                return;
            }
            File file = new File(Symphonys.get("nginx.trend.image.dir")+trendId);
            if(file.exists()){
                if(deleteDir(file)){
                    trendsRepository.remove(trendId);
                }
            }else{
                trendsRepository.remove(trendId);
            }
        }catch(RepositoryException e){
                e.printStackTrace();
                LOGGER.log(Level.ERROR, "Delete a video[id=" + trendId + "] failed", e);
            }
        }

    public boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }

    public void inTrendViewCount(final String trendId) throws ServiceException {
        Symphonys.EXECUTOR_SERVICE.submit(new Runnable() {
            @Override
            public void run() {
                final Transaction transaction = trendsRepository.beginTransaction();
                try {
                    final JSONObject trend = trendsRepository.get(trendId);
                    if (null == trend){
                        return;
                    }
                    final int viewCnt = trend.optInt(Trend.TREND_VIEW_CNT);
                    trend.put(Trend.TREND_VIEW_CNT,viewCnt+1);
                    trendsRepository.update(trendId,trend);
                    transaction.commit();
                }catch (final RepositoryException e){
                    if (transaction.isActive()){
                        transaction.rollback();
                    }
                    LOGGER.log(Level.ERROR, "Incs an videos view count failed", e);
                }
            }
        });
    }

    /**
     * Sticks an article specified by the given article id.
     *
     * @param videoId the given article id
     * @throws ServiceException service exception
     */
    public synchronized void stick(final String videoId) throws ServiceException {
        final Transaction transaction = videoRepository.beginTransaction();

        try {
            final JSONObject video = videoRepository.get(videoId);
            if (null == video) {
                return;
            }

            final String authorId = video.optString(Video.VIDEO_AUTHORID);
            final JSONObject author = userRepository.get(authorId);
            final int balance = author.optInt(UserExt.USER_POINT);

            if (balance - Pointtransfer.TRANSFER_SUM_C_STICK_ARTICLE < 0) {
                throw new ServiceException(langPropsService.get("insufficientBalanceLabel"));
            }

            final Query query = new Query().
                    setFilter(new PropertyFilter(Video.VIDEO_STICK, FilterOperator.GREATER_THAN, 0L));
            final JSONArray videos = videoRepository.get(query).optJSONArray(Keys.RESULTS);
            if (videos.length() > 1) {
                final Set<String> ids = new HashSet<>();
                for (int i = 0; i < videos.length(); i++) {
                    ids.add(videos.optJSONObject(i).optString(Keys.OBJECT_ID));
                }

                if (!ids.contains(videoId)) {
                    throw new ServiceException(langPropsService.get("stickExistLabel"));
                }
            }

            video.put(Video.VIDEO_STICK, System.currentTimeMillis());

            videoRepository.update(videoId, video);

            transaction.commit();

            final boolean succ = null != pointtransferMgmtService.transfer(video.optString(Video.VIDEO_AUTHORID),
                    Pointtransfer.ID_C_SYS, Pointtransfer.TRANSFER_TYPE_C_STICK_ARTICLE,
                    Pointtransfer.TRANSFER_SUM_C_STICK_ARTICLE, videoId, System.currentTimeMillis());
            if (!succ) {
                throw new ServiceException(langPropsService.get("stickFailedLabel"));
            }
        } catch (final RepositoryException e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }

            LOGGER.log(Level.ERROR, "Sticks an video[id=" + videoId + "] failed", e);

            throw new ServiceException(langPropsService.get("stickFailedLabel"));
        }
    }

    /**
     * A user specified by the given sender id thanks the author of an trend specified by the given article id.
     *
     * @param trendId the given article id
     * @param senderId  the given sender id
     * @throws ServiceException service exception
     */
    @Transactional
    public void thank(final String trendId, final String senderId) throws ServiceException {
        try {
            final JSONObject trend = trendsRepository.get(trendId);

            if (null == trend) {
                return;
            }

            final JSONObject sender = userRepository.get(senderId);
            if (null == sender) {
                return;
            }

            if (UserExt.USER_STATUS_C_VALID != sender.optInt(UserExt.USER_STATUS)) {
                return;
            }

            final String receiverId = trend.optString(Trend.TREND_AUTHOR_ID);
            final JSONObject receiver = userRepository.get(receiverId);
            if (null == receiver) {
                return;
            }

            if (UserExt.USER_STATUS_C_VALID != receiver.optInt(UserExt.USER_STATUS)) {
                return;
            }

//            if (receiverId.equals(senderId)) {
//                return;
//            }
            final String thankId = Ids.genTimeMillisId();

            if (rewardQueryService.isRewarded(senderId, trendId, Reward.TYPE_C_THANK_TREND)) {
                return;
            }else {
//                final boolean succ = null != pointtransferMgmtService.transfer(senderId, receiverId,
//                        Pointtransfer.TRANSFER_TYPE_C_ARTICLE_THANK,
//                        Pointtransfer.TRANSFER_SUM_C_ARTICLE_THANK, thankId, System.currentTimeMillis());
//
//                if (!succ) {
//                    throw new ServiceException();
//                }
                trend.put(Trend.TREND_GIFT_CNT,trend.optInt(Trend.TREND_GIFT_CNT)+1);
                trendsRepository.update(trendId,trend);
                int point = receiver.optInt(UserExt.USER_POINT) + Integer.parseInt(Symphonys.get("thankTrendPoint"));
                receiver.put(UserExt.USER_POINT,point);
                userRepository.update(receiverId,receiver);
            }

            final JSONObject reward = new JSONObject();
            reward.put(Keys.OBJECT_ID, thankId);
            reward.put(Reward.SENDER_ID, senderId);
            reward.put(Reward.DATA_ID, trendId);
            reward.put(Reward.TYPE, Reward.TYPE_C_THANK_TREND);

            rewardMgmtService.addReward(reward);

            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, receiverId);
            notification.put(Notification.NOTIFICATION_DATA_ID, thankId);

            notificationMgmtService.addArticleThankNotification(notification);

            livenessMgmtService.incLiveness(senderId, Liveness.LIVENESS_REWARD);
        } catch (final RepositoryException e) {
            LOGGER.log(Level.ERROR, "Thanks an trend[id=" + trendId + "] failed", e);
            throw new ServiceException(e);
        }
    }

}
