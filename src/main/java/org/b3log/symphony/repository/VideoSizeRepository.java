package org.b3log.symphony.repository;

import org.b3log.latke.repository.AbstractRepository;
import org.b3log.latke.repository.annotation.Repository;
import org.b3log.symphony.model.VideoSize;

/**
 * Created by BrickCat on 17/6/12.
 */
@Repository
public class VideoSizeRepository  extends AbstractRepository {
    public VideoSizeRepository(){
        super(VideoSize.VIDEO_SIZE);
    }
}
