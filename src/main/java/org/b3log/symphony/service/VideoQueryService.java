package org.b3log.symphony.service;

import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.repository.RepositoryException;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.json.JSONObject;

/**
 * Created by 860117030 on 2017/6/6.
 */
@Service
public class VideoQueryService {
    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(VideoQueryService.class);
    /**
     * User repository.
     */
    @Inject
    private UserRepository userRepository;
    /**
     * Video repository
     */
    @Inject
    private VideoRepository videoRepository;


    public JSONObject getVideo(final String videoId) throws ServiceException {
        try {
            return videoRepository.get(videoId);
        } catch (final RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets a user failed", e);

            throw new ServiceException(e);
        }
    }
}
