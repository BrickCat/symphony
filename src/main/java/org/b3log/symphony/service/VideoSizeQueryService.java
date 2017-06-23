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
import org.b3log.latke.util.Ids;
import org.b3log.latke.util.Paginator;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.model.VideoSize;
import org.b3log.symphony.repository.VideoSizeRepository;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by BrickCat on 17/6/12.
 */
@Service
public class VideoSizeQueryService {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(VideoSizeQueryService.class.getName());

    @Inject
    private VideoSizeRepository videoSizeRepository;


    public JSONObject getVideoSize(JSONObject requestJSONObject, Map<String, Class<?>> videoSizeFields) throws ServiceException {
        final JSONObject ret = new JSONObject();

        final Query query = new Query().addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : videoSizeFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }
        if (requestJSONObject.has(VideoSize.USER_ID)) {
            query.setFilter(new PropertyFilter(VideoSize.USER_ID, FilterOperator.EQUAL, requestJSONObject.optString(VideoSize.USER_ID)));
        }
        JSONObject result = null;

        try {
            result = videoSizeRepository.get(query);
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets tags failed", e);
            throw new ServiceException(e);
        }


        return result;
    }

}
