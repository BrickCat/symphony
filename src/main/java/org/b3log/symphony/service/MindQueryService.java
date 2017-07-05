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
import org.b3log.symphony.model.Mind;
import org.b3log.symphony.repository.MindRepository;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

/**
 * Created by 860117030 on 2017/5/24.
 */
@Service
public class MindQueryService {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(MindQueryService.class.getName());


    /**
     * mind repository.
     */
    @Inject
    private MindRepository mindRepository;

    public JSONObject getMind(final String mindId){
        try {
            return mindRepository.get(mindId);
        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        return null;
    }

    public JSONObject getMinds(final JSONObject requestJSONObject,final Map<String, Class<?>> mindFields) throws ServiceException {
        final JSONObject ret = new JSONObject();

        final int currentPageNum = requestJSONObject.optInt(Pagination.PAGINATION_CURRENT_PAGE_NUM);
        final int pageSize = requestJSONObject.optInt(Pagination.PAGINATION_PAGE_SIZE);
        final int windowSize = requestJSONObject.optInt(Pagination.PAGINATION_WINDOW_SIZE);
        final Query query = new Query().setCurrentPageNum(currentPageNum).setPageSize(pageSize).
                addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : mindFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }
        if (requestJSONObject.has(Mind.MIND_AUTHOR_ID)) {
            query.setFilter(new PropertyFilter(Mind.MIND_AUTHOR_ID, FilterOperator.EQUAL, requestJSONObject.optString(Mind.MIND_AUTHOR_ID)));
        }
        JSONObject result = null;
        try {
            result = mindRepository.get(query);
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
        final List<JSONObject> minds = CollectionUtils.<JSONObject>jsonArrayToList(data);

        return ret.put(Mind.MINDS,minds);
    }
}
