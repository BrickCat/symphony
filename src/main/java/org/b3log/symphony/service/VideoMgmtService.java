package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.repository.RepositoryException;
import org.b3log.latke.repository.Transaction;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.Ids;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.repository.OptionRepository;
import org.b3log.symphony.repository.TagRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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
        //创建时间
        video.put(Video.VIDEO_CREATE_TIME, System.currentTimeMillis());
        //更新时间
        video.put(Video.VIDEO_UPDATE_TIME,System.currentTimeMillis());
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
        try {
            if(!"".equals(id)){
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
}
