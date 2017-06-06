package org.b3log.symphony.repository;


import org.b3log.latke.logging.Level;
import org.b3log.latke.repository.AbstractRepository;
import org.b3log.latke.repository.Query;
import org.b3log.latke.repository.RepositoryException;
import org.b3log.latke.repository.annotation.Repository;
import org.b3log.latke.repository.jdbc.JDBCRepositoryException;
import org.b3log.symphony.model.Video;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Created by 860117030 on 2017/5/24.
 */
@Repository
public class VideoRepository extends AbstractRepository {
    public VideoRepository() {
        super(Video.VIDEO);
    }


}
