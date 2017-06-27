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
import org.b3log.symphony.model.Article;
import org.b3log.symphony.model.Pointtransfer;
import org.b3log.symphony.model.UserExt;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.repository.OptionRepository;
import org.b3log.symphony.repository.TagRepository;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 860117030 on 2017/5/24.
 */
@Service
public class VideoMgmtService {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(VideoMgmtService.class.getName());


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
    public  synchronized String addVideo(String id,final JSONObject requestJSONObject, final HttpServletRequest request) throws ServiceException{
        final Transaction transaction = videoRepository.beginTransaction();
        String ret = null;
        //创建Video对象
        JSONObject video = new JSONObject();
        //视频标题
        video.put(Video.VIDEO_TITLE,requestJSONObject.optString(Video.VIDEO_TITLE));
        //视频发布人
        video.put(Video.VIDEO_AUTHORID,requestJSONObject.optString(Video.VIDEO_AUTHORID));
        //视频标签
        video.put(Video.VIDEO_TAG,requestJSONObject.optString(Video.VIDEO_TAG));
        //视频描述
        video.put(Video.VIDEO_REMARKS,requestJSONObject.optString(Video.VIDEO_REMARKS));
        //打赏积分
        video.put(Video.VIDEO_POINT,requestJSONObject.optString(Video.VIDEO_POINT));
        //TODO 和标签表关联
        //视频连接
        video.put(Video.VIDEO_URL,requestJSONObject.optString(Video.VIDEO_URL));
        //视频类型
        video.put(Video.VIDEO_TYPE,requestJSONObject.optString(Video.VIDEO_TYPE));
        //视频状态
        video.put(Video.VIDEO_STATUS,requestJSONObject.optString(Video.VIDEO_STATUS));
        //视频评论数
        video.put(Video.VIDEO_COMMENT_COUNT,0);
        //浏览数
        video.put(Video.VIDEO_VIEW_COUNT,0);
        //打赏内容
        video.put(Video.VIDEO_REWARD_CONTETN,requestJSONObject.optString(Video.VIDEO_REWARD_CONTETN));
        //打赏积分
        video.put(Video.VIDEO_REWARD_POINT,0);
        //视频缩略图地址
        video.put(Video.VIDEO_IMAGE_PATH,requestJSONObject.optString(Video.VIDEO_IMAGE_PATH));
        //视频大小
        video.put(Video.VIDEO_SIZE,requestJSONObject.optString(Video.VIDEO_SIZE));
        //创建时间
        final long currentTimeMillis = System.currentTimeMillis();
        video.put(Video.VIDEO_CREATE_TIME, currentTimeMillis);
        //更新时间
        video.put(Video.VIDEO_UPDATE_TIME, currentTimeMillis);
        //最后观看时间
        video.put(Video.VIDEO_LATEST_CMT_TIME,0L);
        //最后观看人
        video.put(Video.VIDEO_LATEST_CMTER_NAME,0L);
        //下载次数
        video.put(Video.VIDEO_DOWNLOAD_COUNT,0);
        //赞👍
        video.put(Video.VIDEO_GOOD_COUNT,0);
        //踩
        video.put(Video.VIDEO_BAD_COUNT,0);
        //视频观看次数
        video.put(Video.VIDEO_WATCH_COUNT,0);
        //关注
        video.put(Video.VIDEO_COLLECT_CNT,0);
        //排分
        video.put(Video.REDDIT_SCORE,0);
        //置顶
        video.put(Video.VIDEO_STICK,0L);
        video.put(Video.VIDEO_DOWN_PATH,requestJSONObject.optString(Video.VIDEO_DOWN_PATH));
        try {
            if(!"".equals(id)){
                final JSONObject oldVideo = videoRepository.get(id);
                if(null == oldVideo){
                    throw new ServiceException("更新video失败");
                }
                videoRepository.update(id,video);
            }else{
                //生成ID
                 ret = Ids.genTimeMillisId();
                //视频ID
                video.put(Keys.OBJECT_ID, ret);
                videoRepository.add(video);
            }
            transaction.commit();
            return ret;
        } catch (RepositoryException e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            LOGGER.log(Level.ERROR, "Adds a video failed", e);
            throw new ServiceException(e);
        }

    }

    /**
     * Updates the specified tag by the given video id.
     * <p>
     * <b>Note</b>: This method just for admin console.
     * </p>
     *
     * @param videoId the given video id
     * @param video   the specified video
     * @throws ServiceException service exception
     */
    public void updateVideo(final String videoId, final JSONObject video) throws ServiceException {
        final Transaction transaction = videoRepository.beginTransaction();
        try{
            videoRepository.update(videoId,video);
            transaction.commit();

        }catch (final RepositoryException e){
            if (transaction.isActive()){
                transaction.rollback();
            }
            LOGGER.log(Level.ERROR, "Updates a video[id=" + videoId + "] failed", e);
            throw new ServiceException(e);
        }

    }

    /**
     * delete a video
     * @param videoId
     */
    @Transactional
    public void deleteVideo(final String videoId) {
        try {
            final JSONObject video = videoRepository.get(videoId);
            if (null == video) {
                return;
            }
            File downfile = new File(Symphonys.get("nginx.video.dir")+video.optString(Video.VIDEO_DOWN_PATH));
            String temp = video.optString(Video.VIDEO_URL).substring(0,video.optString(Video.VIDEO_URL).lastIndexOf("/"));
            File m3u8file = new File(Symphonys.get("nginx.ffmpeg.dir")+"/"+temp);
            File imagefile = new File(Symphonys.get("nginx.video.image.dir")+video.optString(Video.VIDEO_IMAGE_PATH));
            if(downfile.exists()&&m3u8file.exists()&&imagefile.exists()){
                if(forceDelete(imagefile)&&forceDelete(downfile)&&deleteDir(m3u8file)){
                   videoRepository.remove(videoId);
                }
            }else{
                videoRepository.remove(videoId);
            }

        }catch(RepositoryException e){
                e.printStackTrace();
                LOGGER.log(Level.ERROR, "Delete a video[id=" + videoId + "] failed", e);
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
