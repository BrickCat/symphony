package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.repository.RepositoryException;
import org.b3log.latke.repository.Transaction;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.Ids;
import org.b3log.symphony.model.Mind;
import org.b3log.symphony.repository.MindRepository;
import org.json.JSONObject;

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

}
