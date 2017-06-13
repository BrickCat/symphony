package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.User;
import org.b3log.latke.repository.RepositoryException;
import org.b3log.latke.repository.Transaction;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.Ids;
import org.b3log.symphony.model.UserExt;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoSizeRepository;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by BrickCat on 17/6/12.
 */
@Service
public class VideoSizeMgmtService {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(VideoSizeMgmtService.class.getName());

    @Inject
    private VideoSizeRepository videoSizeRepository;
    /**
     * User repository.
     */
    @Inject
    private UserRepository userRepository;

    public  synchronized String addVideoSize(final String id,final JSONObject requestJSONObject) throws ServiceException {
        final Transaction transaction = videoSizeRepository.beginTransaction();
        String ret = null;
        JSONObject videoSize = new JSONObject();
        //VideoSize
        videoSize.put(VideoSize.USER_MAX_VIDEO_SIZE,requestJSONObject.opt(VideoSize.USER_MAX_VIDEO_SIZE));

        videoSize.put(VideoSize.USER_ID,requestJSONObject.opt(VideoSize.USER_ID));
        try{
            if(!"".equals(id)){
                final JSONObject oldVideoSize = videoSizeRepository.get(id);
                if(null == oldVideoSize){
                    throw new ServiceException("更新失败");
                }
                videoSizeRepository.update(id,videoSize);
            }else{
                //生成ID
                ret = Ids.genTimeMillisId();
                //视频ID
                videoSize.put(Keys.OBJECT_ID, ret);
                videoSizeRepository.add(videoSize);
            }
            transaction.commit();
            return ret;
        }catch (RepositoryException e){
            if (transaction.isActive()) {
                transaction.rollback();
            }
            LOGGER.log(Level.ERROR, "Adds a video failed", e);
            throw new ServiceException(e);
        }

    }

}
