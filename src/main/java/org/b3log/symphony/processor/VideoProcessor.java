package org.b3log.symphony.processor;

import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.symphony.service.DataModelService;


/**
 * Created by Seven on 17/5/14.
 */
@RequestProcessor
public class VideoProcessor {

    /**
     * logger
     */
    private static final Logger LOGGER = Logger.getLogger(VideoProcessor.class);

    /**
     * pagination window size
     */
    private static final int WINDOW_SIZE = 15;


    /**
     * Pagination page size.
     */
    private static final int PAGE_SIZE = 20;

    /**
     * Data model service.
     */
    @Inject
    private DataModelService dataModelService;






}
