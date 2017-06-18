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
package org.b3log.symphony.processor;

import org.b3log.latke.Keys;
import org.b3log.latke.ioc.inject.Inject;
import org.b3log.latke.logging.Logger;
import org.b3log.latke.model.User;
import org.b3log.latke.servlet.HTTPRequestContext;
import org.b3log.latke.servlet.HTTPRequestMethod;
import org.b3log.latke.servlet.annotation.Before;
import org.b3log.latke.servlet.annotation.RequestProcessing;
import org.b3log.latke.servlet.annotation.RequestProcessor;
import org.b3log.latke.util.Requests;
import org.b3log.symphony.model.Article;
import org.b3log.symphony.model.Follow;
import org.b3log.symphony.model.Notification;
import org.b3log.symphony.model.Video;
import org.b3log.symphony.processor.advice.LoginCheck;
import org.b3log.symphony.processor.advice.PermissionCheck;
import org.b3log.symphony.service.ArticleQueryService;
import org.b3log.symphony.service.FollowMgmtService;
import org.b3log.symphony.service.NotificationMgmtService;
import org.b3log.symphony.service.VideoQueryService;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.Set;

/**
 * Follow processor.
 * <p>
 * <ul>
 * <li>Follows a user (/follow/user), POST</li>
 * <li>Unfollows a user (/follow/user), DELETE</li>
 * <li>Follows a tag (/follow/tag), POST</li>
 * <li>Unfollows a tag (/follow/tag), DELETE</li>
 * <li>Follows an article (/follow/article), POST</li>
 * <li>Unfollows an article (/follow/article), DELETE</li>
 * <li>Watches an article (/follow/article-watch), POST</li>
 * <li>Unwatches an article (/follow/article-watch), DELETE</li>
 * </ul>
 * </p>
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @version 1.3.0.4, Mar 7, 2017
 * @since 0.2.5
 */
@RequestProcessor
public class FollowProcessor {

    /**
     * Logger.
     */
    private static final Logger LOGGER = Logger.getLogger(FollowProcessor.class.getName());
    /**
     * Holds follows.
     */
    private static final Set<String> FOLLOWS = new HashSet<>();
    /**
     * Follow management service.
     */
    @Inject
    private FollowMgmtService followMgmtService;
    /**
     * Notification management service.
     */
    @Inject
    private NotificationMgmtService notificationMgmtService;
    /**
     * Article query service.
     */
    @Inject
    private ArticleQueryService articleQueryService;
    /**
     * Article query service.
     */
    @Inject
    private VideoQueryService videoQueryService;
    /**
     * Follows a user.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/user", method = HTTPRequestMethod.POST)
    @Before(adviceClass = LoginCheck.class)
    public void followUser(final HTTPRequestContext context, final HttpServletRequest request,
                           final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingUserId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.followUser(followerUserId, followingUserId);

        if (!FOLLOWS.contains(followingUserId + followerUserId)) {
            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, followingUserId);
            notification.put(Notification.NOTIFICATION_DATA_ID, followerUserId);

            notificationMgmtService.addNewFollowerNotification(notification);
        }

        FOLLOWS.add(followingUserId + followerUserId);

        context.renderTrueResult();
    }

    /**
     * Unfollows a user.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/user", method = HTTPRequestMethod.DELETE)
    @Before(adviceClass = LoginCheck.class)
    public void unfollowUser(final HTTPRequestContext context, final HttpServletRequest request,
                             final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingUserId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.unfollowUser(followerUserId, followingUserId);

        context.renderTrueResult();
    }

    /**
     * Follows a tag.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/tag", method = HTTPRequestMethod.POST)
    @Before(adviceClass = LoginCheck.class)
    public void followTag(final HTTPRequestContext context, final HttpServletRequest request,
                          final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingTagId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.followTag(followerUserId, followingTagId);

        context.renderTrueResult();
    }

    /**
     * Unfollows a tag.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/tag", method = HTTPRequestMethod.DELETE)
    @Before(adviceClass = LoginCheck.class)
    public void unfollowTag(final HTTPRequestContext context, final HttpServletRequest request,
                            final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingTagId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.unfollowTag(followerUserId, followingTagId);

        context.renderTrueResult();
    }

    /**
     * Follows an article.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/article", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {LoginCheck.class, PermissionCheck.class})
    public void followArticle(final HTTPRequestContext context, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingArticleId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.followArticle(followerUserId, followingArticleId);

        final JSONObject article = articleQueryService.getArticle(followingArticleId);
        final String articleAuthorId = article.optString(Article.ARTICLE_AUTHOR_ID);

        if (!FOLLOWS.contains(articleAuthorId + followingArticleId + "-" + followerUserId) &&
                !articleAuthorId.equals(followerUserId)) {
            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, articleAuthorId);
            notification.put(Notification.NOTIFICATION_DATA_ID, followingArticleId + "-" + followerUserId);

            notificationMgmtService.addArticleNewFollowerNotification(notification);
        }

        FOLLOWS.add(articleAuthorId + followingArticleId + "-" + followerUserId);

        context.renderTrueResult();
    }

    /**
     * Follows an video.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/video", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {LoginCheck.class, PermissionCheck.class})
    public void followVideo(final HTTPRequestContext context, final HttpServletRequest request,
                              final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingVideoId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.followVdieo(followerUserId, followingVideoId);

        final JSONObject video = videoQueryService.getVideo(followingVideoId);
        final String videoAuthorId = video.optString(Video.VIDEO_AUTHORID);

        if (!FOLLOWS.contains(videoAuthorId + followingVideoId + "-" + followerUserId) &&
                !videoAuthorId.equals(followerUserId)) {
            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, videoAuthorId);
            notification.put(Notification.NOTIFICATION_DATA_ID, followingVideoId + "-" + followerUserId);

            notificationMgmtService.addVideoNewFollowerNotification(notification);
        }

        FOLLOWS.add(videoAuthorId + followingVideoId + "-" + followerUserId);

        context.renderTrueResult();
    }


    /**
     * Unfollows an article.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/article", method = HTTPRequestMethod.DELETE)
    @Before(adviceClass = LoginCheck.class)
    public void unfollowArticle(final HTTPRequestContext context, final HttpServletRequest request,
                                final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingArticleId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.unfollowArticle(followerUserId, followingArticleId);

        context.renderTrueResult();
    }
    /**
     * Unfollows an video.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/video", method = HTTPRequestMethod.DELETE)
    @Before(adviceClass = LoginCheck.class)
    public void unfollowVideo(final HTTPRequestContext context, final HttpServletRequest request,
                                final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingVideoId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.unfollowVideo(followerUserId, followingVideoId);

        context.renderTrueResult();
    }
    /**
     * Watches an article.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/article-watch", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {LoginCheck.class, PermissionCheck.class})
    public void watchArticle(final HTTPRequestContext context, final HttpServletRequest request,
                             final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingArticleId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.watchArticle(followerUserId, followingArticleId);

        final JSONObject article = articleQueryService.getArticle(followingArticleId);
        final String articleAuthorId = article.optString(Article.ARTICLE_AUTHOR_ID);

        if (!FOLLOWS.contains(articleAuthorId + followingArticleId + "-" + followerUserId) &&
                !articleAuthorId.equals(followerUserId)) {
            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, articleAuthorId);
            notification.put(Notification.NOTIFICATION_DATA_ID, followingArticleId + "-" + followerUserId);

            notificationMgmtService.addArticleNewWatcherNotification(notification);
        }

        FOLLOWS.add(articleAuthorId + followingArticleId + "-" + followerUserId);

        context.renderTrueResult();
    }

    /**
     * Unwatches an article.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/article-watch", method = HTTPRequestMethod.DELETE)
    @Before(adviceClass = LoginCheck.class)
    public void unwatchArticle(final HTTPRequestContext context, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingArticleId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.unwatchVideo(followerUserId, followingArticleId);

        context.renderTrueResult();
    }
    /**
     * Watches an video.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/video-watch", method = HTTPRequestMethod.POST)
    @Before(adviceClass = {LoginCheck.class, PermissionCheck.class})
    public void watchvideo(final HTTPRequestContext context, final HttpServletRequest request,
                             final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingVideoId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.watchVideo(followerUserId, followingVideoId);

        final JSONObject video = videoQueryService.getVideo(followingVideoId);
        final String videoAuthorId = video.optString(Video.VIDEO_AUTHORID);

        if (!FOLLOWS.contains(videoAuthorId + followingVideoId + "-" + followerUserId) &&
                !videoAuthorId.equals(followerUserId)) {
            final JSONObject notification = new JSONObject();
            notification.put(Notification.NOTIFICATION_USER_ID, videoAuthorId);
            notification.put(Notification.NOTIFICATION_DATA_ID, followingVideoId + "-" + followerUserId);

            notificationMgmtService.addVideoNewWatcherNotification(notification);
        }

        FOLLOWS.add(videoAuthorId + followingVideoId + "-" + followerUserId);

        context.renderTrueResult();
    }
    /**
     * Unwatches an video.
     * <p>
     * The request json object:
     * <pre>
     * {
     *   "followingId": ""
     * }
     * </pre>
     * </p>
     *
     * @param context  the specified context
     * @param request  the specified request
     * @param response the specified response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/follow/video-watch", method = HTTPRequestMethod.DELETE)
    @Before(adviceClass = LoginCheck.class)
    public void unwatchVideo(final HTTPRequestContext context, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        context.renderJSON();

        final JSONObject requestJSONObject = Requests.parseRequestJSONObject(request, context.getResponse());
        final String followingVideoId = requestJSONObject.optString(Follow.FOLLOWING_ID);

        final JSONObject currentUser = (JSONObject) request.getAttribute(User.USER);
        final String followerUserId = currentUser.optString(Keys.OBJECT_ID);

        followMgmtService.unwatchArticle(followerUserId, followingVideoId);

        context.renderTrueResult();
    }
}
