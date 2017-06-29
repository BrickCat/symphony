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
import org.b3log.symphony.model.Pointtransfer;
import org.b3log.symphony.model.Trend;
import org.b3log.symphony.model.UserExt;
import org.b3log.symphony.model.Video;
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
    /**
     * Adds a video
     * @param requestJSONObject
     * @return videoId
     * @throws ServiceException
     */
    public  synchronized String addTrend(final String id,final JSONObject requestJSONObject, final HttpServletRequest request) throws ServiceException{
        final Transaction transaction = trendsRepository.beginTransaction();
        String ret = null;
        //创建Trend对象
        JSONObject trend = new JSONObject();
        //创建时间
        final long currentTimeMillis = System.currentTimeMillis();
        //ID
        trend.put(Keys.OBJECT_ID,requestJSONObject.optString(Trend.TREND_T_ID));
        //图片路径
        trend.put(Trend.TREND_IMAGE_URL,requestJSONObject.optString(Trend.TREND_IMAGE_URL));
        //作者
        trend.put(Trend.TREND_AUTHOR_ID,requestJSONObject.optString(Trend.TREND_AUTHOR_ID));
        //标题
        trend.put(Trend.TREND_TITLE,"");
        //标签
        trend.put(Trend.TREND_TAGS,"");
        //评论
        trend.put(Trend.TREND_COMMENT_CNT,0);
        //查看
        trend.put(Trend.TREND_VIEW_CNT,0);
        //内容
        trend.put(Trend.TREND_CONTENT,"");
        //打赏内容
        trend.put(Trend.TREND_REWARD_CONTENT,"");
        //打赏积分
        trend.put(Trend.TREND_REWARD_POINT,0);
        //绝对地址
        trend.put(Trend.TREND_PERMALINK,"");
        //创建时间
        trend.put(Trend.TREND_CREATE_TIME,currentTimeMillis);
        //更新时间
        trend.put(Trend.TREND_UPDATE_TIME,currentTimeMillis);
        //最后评论时间
        trend.put(Trend.TREND_LATEST_CMT_TIME,0L);
        //最后评论人
        trend.put(Trend.TREND_LATEST_CMTER_NAME,"");
        //是否可以评论
        trend.put(Trend.TREND_COMMENTABLE,0);
        //类别
        trend.put(Trend.TREND_TYPE,0);
        //状态
        trend.put(Trend.TREND_STATUS,0);
        //赞
        trend.put(Trend.TREND_GOOD_CNT,0);
        //踩
        trend.put(Trend.TREND_BAD_CNT,0);
        // 收藏
        trend.put(Trend.TREND_COLLECT_CNT,0);
        //关注
        trend.put(Trend.TREND_WATCH_CNT,0);
        //置顶
        trend.put(Trend.REDDIT_SCORE,0.00);
        //位置
        trend.put(Trend.TREND_CITY,"");
        //IP
        trend.put(Trend.TREND_IP,"'");
        //UA
        trend.put(Trend.TREND_UA,"");
        //优选
        trend.put(Trend.TREND_PERFECT,0);
        try {
            if(!"".equals(id)){
                final JSONObject oldVideo = trendsRepository.get(id);
                if(null == oldVideo){
                    throw new ServiceException("Update a trend failed");
                }
                trendsRepository.update(id,trend);
            }else{
                trendsRepository.add(trend);
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
            final JSONObject video = trendsRepository.get(trendId);
            if (null == video) {
                return;
            }

            trendsRepository.remove(trendId);
        }catch(RepositoryException e){
                e.printStackTrace();
                LOGGER.log(Level.ERROR, "Delete a video[id=" + trendId + "] failed", e);
            }
        }


    public boolean forceDelete(File file) {
            boolean result = file.delete();
            int tryCount = 0;
            while (!result && tryCount++ < 10) {
                System.gc();    //回收资源
                result = file.delete();
            }
            return result;
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

    public void inVideoViewCount(final String videoId) throws ServiceException {
        Symphonys.EXECUTOR_SERVICE.submit(new Runnable() {
            @Override
            public void run() {
                final Transaction transaction = videoRepository.beginTransaction();
                try {
                    final JSONObject video = videoRepository.get(videoId);
                    if (null == video){
                        return;
                    }
                    final int viewCnt = video.optInt(Video.VIDEO_VIEW_COUNT);
                    video.put(Video.VIDEO_VIEW_COUNT,viewCnt+1);
                    videoRepository.update(videoId,video);
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
}
