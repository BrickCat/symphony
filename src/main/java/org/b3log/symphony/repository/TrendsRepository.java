package org.b3log.symphony.repository;


import org.b3log.latke.repository.AbstractRepository;
import org.b3log.latke.repository.annotation.Repository;
import org.b3log.symphony.model.Trend;
import org.b3log.symphony.model.Video;

/**
 * Created by 860117030 on 2017/5/24.
 */
@Repository
public class TrendsRepository extends AbstractRepository {
    public TrendsRepository() {
        super("trends");
    }


}
