package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.User;
import org.b3log.latke.repository.Transaction;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.symphony.model.UserExt;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.repository.OptionRepository;
import org.b3log.symphony.repository.TagRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

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
     * Vidoe repository
     */
    @Inject
    private VideoRepository videoRepository;
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
     * Adds a video
     * @param requestJSONObject
     * @return videoId
     * @throws ServiceException
     */
    public  synchronized String addVideo(final JSONObject requestJSONObject, final HttpServletRequest request) throws ServiceException{
        final Transaction transaction = videoRepository.beginTransaction();
        final JSONObject currentUser = userQueryService.getCurrentUser(request);
        JSONObject video = new JSONObject();
        video.put(Video.VIDEO_TITLE,requestJSONObject.optString(Video.VIDEO_TITLE));
        video.put(Video.VIDEO_AUTHORID,currentUser.optInt(UserExt.USER_T_ID));
        return "";
    }
}
