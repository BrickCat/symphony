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
import org.b3log.symphony.repository.TrendsRepository;
import org.b3log.symphony.repository.UserRepository;
import org.b3log.symphony.repository.VideoRepository;
import org.b3log.symphony.util.Times;
import org.json.JSONArray;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 860117030 on 2017/6/6.
 */
@Service
public class TrendsQueryService {
    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(TrendsQueryService.class);
    /**
     * User repository.
     */
    @Inject
    private UserRepository userRepository;
    /**
     * Video repository
     */
    @Inject
    private TrendsRepository trendsRepository;

    /**
     * Comment repository.
     */
    @Inject
    private CommentRepository commentRepository;


    public JSONObject getTrend(final String trendId) throws ServiceException {
        try {
            return trendsRepository.get(trendId);
        } catch (final RepositoryException e) {
            LOGGER.log(Level.ERROR, "Gets a user failed", e);
            throw new ServiceException(e);
        }
    }

    private void toTrendDate(final JSONObject trend) {
        trend.put(Common.TIME_AGO, Times.getTimeAgo(trend.optLong(Trend.TREND_CREATE_TIME), Locales.getLocale()));
        trend.put(Common.CMT_TIME_AGO,Times.getTimeAgo(trend.optLong(Trend.TREND_LATEST_CMT_TIME),Locales.getLocale()));
        trend.put(Video.VIDEO_CREATE_TIME,new Date(trend.optLong(Trend.TREND_CREATE_TIME)));
        trend.put(Video.VIDEO_UPDATE_TIME,trend.optLong(Trend.TREND_UPDATE_TIME));
        trend.put(Video.VIDEO_LATEST_CMT_TIME,trend.optLong(Trend.TREND_LATEST_CMT_TIME));
    }
}

