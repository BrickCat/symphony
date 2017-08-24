/*
 * Symphony - A modern community (forum/SNS/blog) platform written in Java.
 * Copyright (C) 2012-2017,  b3log.org & hacpai.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.b3log.symphony.api;

import org.apache.commons.lang.StringUtils;
import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Level;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.Pagination;
import org.b3log.latke.model.User;
import org.b3log.latke.service.LangPropsService;
import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.After;
import org.b3log.latke.servlet.annotation.Before;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.servlet.renderer.JSONRenderer;
import org.b3log.latke.util.Requests;
import org.b3log.latke.util.Strings;
import org.b3log.symphony.model.Article;
import org.b3log.symphony.model.Book;
import org.b3log.symphony.model.Common;
import org.b3log.symphony.model.UserExt;
import org.b3log.symphony.processor.advice.LoginCheck;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchEndAdvice;
import org.b3log.symphony.processor.advice.stopwatch.StopwatchStartAdvice;
import org.b3log.symphony.service.ArticleQueryService;
import org.b3log.symphony.service.BookMgmtService;
import org.b3log.symphony.service.BookQueryService;
import org.b3log.symphony.util.Symphonys;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Book processor.
 * <p>
 * <ul>
 * <li>Gets articles with the specified tags (/apis/articles?tags=tag1,tag2&p=1&size=10), GET</li>
 * </ul>
 * </p>
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @version 1.1.0.4, Jan 21, 2017
 * @since 1.9.0
 */
@RequestProcessor
public class WeAppProcessor {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(WeAppProcessor.class);

    /**
     * Book query service.
     */
    @Inject
    private BookQueryService bookQueryService;

    /**
     * Book management service.
     */
    @Inject
    private BookMgmtService bookMgmtService;

    /**
     * Language service.
     */
    @Inject
    private LangPropsService langPropsService;

    /**
     * Article query service.
     */
    @Inject
    private ArticleQueryService articleQueryService;

    /**
     * Get books.
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/wx/recent", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class})
    @After(adviceClass = {StopwatchEndAdvice.class})
    public void getRecent(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        String pageStr = requestJSONObject.optString("p");
        if (!Strings.isNumeric(pageStr)) {
            pageStr = "1";
        }

        final int pageNum = Integer.valueOf(pageStr);

        int pageSize = Symphonys.getInt("indexArticlesCnt");

        final int avatarViewMode = (int) request.getAttribute(UserExt.USER_AVATAR_VIEW_MODE);

        String sortModeStr = StringUtils.substringAfter(request.getRequestURI(), "/wx/recent");
        int sortMode;
        switch (sortModeStr) {
            case "":
                sortMode = 0;

                break;
            case "/hot":
                sortMode = 1;

                break;
            case "/good":
                sortMode = 2;

                break;
            case "/reply":
                sortMode = 3;

                break;
            default:
                sortMode = 0;
        }

        final JSONObject result = articleQueryService.getRecentArticles(avatarViewMode, sortMode, pageNum, pageSize);

        result.put(Keys.STATUS_CODE, true);

        context.renderJSON(result);
    }

    /**
     * Shares a book.
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/book/share", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class, LoginCheck.class})
    @After(adviceClass = {StopwatchEndAdvice.class})
    public void shareBook(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response) {
        JSONObject requestJSONObject;
        try {
            requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        } catch (final Exception e) {
            LOGGER.log(Level.ERROR, "Parses request failed", e);
            context.renderJSON(false);
            context.renderJSONValue(Keys.MSG, langPropsService.get("queryFailedLabel"));

            return;
        }

        String isbn = requestJSONObject.optString(Common.ISBN);
        isbn = StringUtils.trim(isbn);

        if (StringUtils.isBlank(isbn)) {
            context.renderJSON(false);
            context.renderJSONValue(Keys.MSG, langPropsService.get("queryFailedLabel"));

            return;
        }

        final JSONObject user = (JSONObject) request.getAttribute(User.USER);

        final JSONObject book = bookQueryService.getBookByISBN(isbn);
        if (null == book) {
            context.renderJSON(false);
            context.renderJSONValue(Keys.MSG, langPropsService.get("queryFailedLabel"));

            return;
        }


        final JSONObject result = bookMgmtService.shareBook(book, user);

        final JSONRenderer jsonRenderer = new JSONRenderer();
        jsonRenderer.setJSONObject(result);
        context.setRenderer(jsonRenderer);
    }

    /**
     * Gets a book.
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/book/info", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {StopwatchStartAdvice.class})
    @After(adviceClass = {StopwatchEndAdvice.class})
    public void getBook(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        String isbn = requestJSONObject.optString(Common.ISBN);
        isbn = StringUtils.trim(isbn);

        if (StringUtils.isBlank(isbn)) {
            context.renderJSON(false);
            context.renderJSONValue(Keys.MSG, langPropsService.get("queryFailedLabel"));

            return;
        }

        final JSONObject book = bookQueryService.getBookByISBN(isbn);
        if (null == book) {
            context.renderJSON(false);
            context.renderJSONValue(Keys.MSG, langPropsService.get("queryFailedLabel"));

            return;
        }

        final JSONObject ret = new JSONObject();
        ret.put(Keys.STATUS_CODE, true);
        ret.put(Book.BOOK, book);

        context.renderJSON(ret);
    }
}
