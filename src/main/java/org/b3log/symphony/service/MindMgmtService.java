package org.b3log.symphony.service;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.repository.*;
import org.b3log.latke.repository.annotation.Transactional;
import org.b3log.latke.service.LangPropsService;
import org.b3log.latke.service.ServiceException;
import org.b3log.latke.service.annotation.Service;
import org.b3log.latke.util.Ids;
import org.b3log.symphony.model.*;
import org.b3log.symphony.repository.*;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 860117030 on 2017/5/24.
 */
@Service
public class MindMgmtService {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(MindMgmtService.class.getName());


    /**
     * mind repository.
     */
    @Inject
    private MindRepository mindRepository;

    public String addMind(final JSONObject requestJSONObject){
        final Transaction transaction = mindRepository.beginTransaction();

        JSONObject mind = new JSONObject();
        //ID
        mind.put(Keys.OBJECT_ID, Ids.genTimeMillisId());
        //作者
        mind.put(Mind.MIND_AUTHOR_ID,requestJSONObject.optString(Mind.MIND_AUTHOR_ID));
        //内容
        mind.put(Mind.MIND_CONTENT,requestJSONObject.optString(Mind.MIND_CONTENT));
        //创建时间
        mind.put(Mind.MIND_CREATE_TIME,Ids.genTimeMillisId());
        //更新时间
        mind.put(Mind.MIND_UPDATE_TIME,Ids.genTimeMillisId());
        //类型
        mind.put(Mind.MIND_TYPE,requestJSONObject.optInt(Mind.MIND_TYPE));

        try {
            mindRepository.add(mind);
            transaction.commit();
            return mind.optString(Keys.OBJECT_ID);
        } catch (RepositoryException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String updateMind(final String mindId,final JSONObject mind){
        final Transaction transaction = mindRepository.beginTransaction();

        try {
            mindRepository.update(mindId,mind);
            transaction.commit();
            return mindId;
        } catch (RepositoryException e) {
            e.printStackTrace();
            if (transaction.isActive()){
                transaction.rollback();
            }
        }

        return null;
    }

    public void deleteMind(final String mindId){
        final Transaction transaction = mindRepository.beginTransaction();
        try {
            mindRepository.remove(mindId);
        } catch (RepositoryException e) {
            e.printStackTrace();
        }
    }

}
