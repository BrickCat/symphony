package org.b3log.symphony.service;

import org.apache.commons.lang3.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.repository.*;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.CollectionUtils;
import org.b3log.latke.util.Locales;
import org.b3log.latke.util.Paginator;
import org.b3log.latke.util.Stopwatchs;
import org.b3log.symphony.model.*;
import org.b3log.symphony.processor.advice.validate.UserRegisterValidation;
import org.b3log.symphony.repository.CommentRepository;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.b3log.symphony.util.Times;
import org.json.JSONArray;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.ArrayList;
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

    /**
     * Comment repository.
     */
    @Inject
    private CommentRepository commentRepository;
    /**
     * Avatar query service.
     */
    @Inject
    private AvatarQueryService avatarQueryService;

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

    public JSONObject getSearchVideos(final int avatarViewMode, Map<String, Class<?>> videoFields) throws ServiceException {
        final JSONObject ret = new JSONObject();
        final Query query = new Query().
                addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : videoFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }
        JSONObject result = null;

        try {
            result = videoRepository.get(query);
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets tags failed", e);
            throw new ServiceException(e);
        }

        final JSONArray data = result.optJSONArray(Keys.RESULTS);
        final List<JSONObject> videos = CollectionUtils.<JSONObject>jsonArrayToList(data);

        List<JSONObject> list = new ArrayList<JSONObject>();

        for (final JSONObject video : videos  ){
            final String authorId = video.optString(Video.VIDEO_AUTHORID);
            JSONObject search = new JSONObject();
            search.put(Keys.OBJECT_ID,video.optString(Keys.OBJECT_ID));
            search.put(Article.ARTICLE_TITLE,video.optString(Video.VIDEO_TITLE));
            search.put(Common.TYPE,1);
            try {
                final JSONObject author = userRepository.get(authorId);
                search.put(Article.ARTICLE_T_AUTHOR_THUMBNAIL_URL + "48",
                        avatarQueryService.getAvatarURLByUser(avatarViewMode, author, "48"));
            } catch (RepositoryException e) {
                e.printStackTrace();
            }
            list.add(search);
        }
        ret.put(Video.VIDEOS,list);
        return ret;
    }

    public JSONObject getUserVideoSize(JSONObject requestJSONObject, Map<String, Class<?>> videoFields) throws ServiceException {
        final JSONObject ret = new JSONObject();
        final Query query = new Query().addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);
        for (final Map.Entry<String, Class<?>> tagField : videoFields.entrySet()) {
            query.addProjection(tagField.getKey(), tagField.getValue());
        }
        if (requestJSONObject.has(Video.VIDEO_AUTHORID)) {
            query.setFilter(new PropertyFilter(Video.VIDEO_AUTHORID, FilterOperator.EQUAL, requestJSONObject.optString(Video.VIDEO_AUTHORID)));
        }
        JSONObject result = null;

        try {
            result = videoRepository.get(query);
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets tags failed", e);
            throw new ServiceException(e);
        }
        final JSONArray data = result.optJSONArray(Keys.RESULTS);
        final List<JSONObject> videos = CollectionUtils.<JSONObject>jsonArrayToList(data);
        ret.put(Video.VIDEOS,videos);
        return ret;
    }

    public JSONObject getVideoById(final int avatarViewMode, final String videoId) throws ServiceException {
        Stopwatchs.start("Get video by id");
        try {
            final JSONObject ret = videoRepository.get(videoId);

            if(null == ret){
               return null;
            }
            organizeVideo(avatarViewMode,ret);
            return ret;
        } catch (RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets an video [videoId=" + videoId + "] failed", e);
            throw new ServiceException(e);
        }finally {
            Stopwatchs.end();
        }
    }

    private void organizeVideo(final int avatarViewMode,final JSONObject video) {
        toVideoDate(video);

        final String videoId = video.optString(Keys.OBJECT_ID);

        final int viewCnt = video.optInt(Video.VIDEO_VIEW_COUNT);
        final double views = (double)viewCnt/1000;
        if(views>=1){
            final DecimalFormat df = new DecimalFormat("#.#");
            video.put(Video.VIDEO_T_VIEW_CNT_DISPLAY_FORMAT,df.format(views)+"K");
        }

        String videoLatestCmterName = video.optString(Video.VIDEO_LATEST_CMTER_NAME);
        if(StringUtils.isNotBlank(videoLatestCmterName)
                && UserRegisterValidation.invalidUserName(videoLatestCmterName)){
            videoLatestCmterName = UserExt.ANONYMOUS_USER_NAME;
            video.put(Video.VIDEO_LATEST_CMTER_NAME,videoLatestCmterName);
        }
        final Query query = new Query()
                .setPageCount(1).setCurrentPageNum(1).setPageSize(1)
                .setFilter(new PropertyFilter(Comment.COMMENT_ON_ARTICLE_ID, FilterOperator.EQUAL, videoId)).
                        addSort(Keys.OBJECT_ID, SortDirection.DESCENDING);

        try {
            final JSONArray cmts = commentRepository.get(query).optJSONArray(Keys.RESULTS);
            if (cmts.length()>0){
                final  JSONObject latestCmt = cmts.optJSONObject(0);
                latestCmt.put(Comment.COMMENT_CLIENT_COMMENT_ID,latestCmt.optString(Comment.COMMENT_CLIENT_COMMENT_ID));
                video.put(Video.VIDEO_T_LATEST_CMT,latestCmt);
            }
        } catch (RepositoryException e) {
            e.printStackTrace();
        }

    }

    private void toVideoDate(final JSONObject video) {
        video.put(Common.TIME_AGO, Times.getTimeAgo(video.optLong(Video.VIDEO_CREATE_TIME), Locales.getLocale()));
        video.put(Common.CMT_TIME_AGO,Times.getTimeAgo(video.optLong(Video.VIDEO_LATEST_CMT_TIME),Locales.getLocale()));
        video.put(Video.VIDEO_CREATE_TIME,new Date(video.optLong(Video.VIDEO_CREATE_TIME)));
        video.put(Video.VIDEO_UPDATE_TIME,video.optLong(Video.VIDEO_UPDATE_TIME));
        video.put(Video.VIDEO_LATEST_CMT_TIME,video.optLong(Video.VIDEO_LATEST_CMT_TIME));
    }
}

