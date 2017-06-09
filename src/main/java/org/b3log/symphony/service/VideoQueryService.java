package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.repository.*;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.Paginator;
import org.b3log.symphony.model.Tag;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Date;
import java.util.List;
import java.util.Map;

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


    public JSONObject getVideos(JSONObject requestJSONObject, Map<String, Class<?>> videoFields) throws ServiceException {
        final JSONObject ret = new JSONObject();

        final int currentPageNum = requestJSONObject.optInt(Pagination.PAGINATION_CURRENT_PAGE_NUM);
        final int pageSize = requestJSONObject.optInt(Pagination.PAGINATION_PAGE_SIZE);
        final int windowSize = requestJSONObject.optInt(Pagination.PAGINATION_WINDOW_SIZE);
        final Query query = new Query().setCurrentPageNum(currentPageNum).setPageSize(pageSize).
                addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : videoFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }
        if (requestJSONObject.has(Video.VIDEO_TITLE)) {
            query.setFilter(new PropertyFilter(Video.VIDEO_TITLE, FilterOperator.EQUAL, requestJSONObject.optString(Video.VIDEO_TITLE)));
        }
        JSONObject result = null;

        try {
            result = videoRepository.get(query);
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets tags failed", e);
            throw new ServiceException(e);
        }
        final int pageCount = result.optJSONObject(Pagination.PAGINATION).optInt(Pagination.PAGINATION_PAGE_COUNT);
        final JSONObject pagination = new JSONObject();
        ret.put(Pagination.PAGINATION, pagination);
        final List<Integer> pageNums = Paginator.paginate(currentPageNum, pageSize, pageCount, windowSize);
        pagination.put(Pagination.PAGINATION_PAGE_COUNT, pageCount);
        pagination.put(Pagination.PAGINATION_PAGE_NUMS, pageNums);

        final JSONArray data = result.optJSONArray(Keys.RESULTS);
        final List<JSONObject> videos = CollectionUtils.<JSONObject>jsonArrayToList(data);
        ret.put(Video.VIDEOS,videos);

        for (int i = 0;i<data.length();i++){
            final JSONObject video = data.optJSONObject(i);
            video.put(Video.VIDEO_CREATE_TIME,new Date(video.optLong(Keys.OBJECT_ID)));
        }

        return ret;
    }
}
