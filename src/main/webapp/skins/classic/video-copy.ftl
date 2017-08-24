<#include "macro-head.ftl">
<#include "macro-pagination-query.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${video.videoTitle} - ${symphonyLabel}">
        <meta name="keywords" content="${video.videoTag}" />
        <meta name="description" content="${video.videoRemarks}"/>
        <meta http-equiv="Access-Control-Allow-Origin" content="*">

        </@head>

        <link rel="stylesheet" href="${staticServePath}/css/index.css?${staticResourceVersion}" />
        <link rel="stylesheet" href="${staticServePath}/js/lib/editor/codemirror.min.css?${staticResourceVersion}">

        <!-- Open Graph -->
        <meta property="og:locale" content="zh_CN" />
        <meta property="og:type" content="article" />
        <meta property="og:title" content="${video.videoTitle} - ${symphonyLabel}" />
        <meta property="og:description" content="${video.videoRemarks}" />
        <meta property="og:image" content="${video.videoImgPath}" />
        <meta property="og:url" content="${servePath}${video.videoUrl}" />
        <meta property="og:site_name" content="BrickCat" />
        <!-- Twitter Card -->
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:description" content="${video.videoRemarks}" />
        <meta name="twitter:title" content="${video.videoTitle} - ${symphonyLabel}" />

    </head>
    <body itemscope itemtype="http://schema.org/Product" class="article" oncontextmenu=self.event.returnValue=false onselectstart="return false">
        <#include "header.ftl">
        <div class="article-body">
            <div class="wrapper">
                <div class="article-info fn-flex">
                <a rel="author" href="${servePath}/member/${video.videoAuthorName}"><div
                        class="avatar-mid tooltipped tooltipped-se" aria-label="${video.videoAuthorName}" style="background-image:url('${video.videoAuthorThumbnailURL}')"></div></a>
                    <div class="fn-flex-1 fn-ellipsis">
                    <a rel="author" href="${servePath}/member/${video.videoAuthorName}" class="ft-gray"><strong class="ft-gray">${video.videoAuthorName}</strong></a>

                        <br/>

                        <span class="ft-gray">${symphonyLabel} ${video.videoAuthor.userNo?c} ${numVIPLabel}</span>

                        <br/>
                        <span class="ft-gray">
                                <a rel="nofollow" class="ft-gray" href="#comments">
                                    <b class="article-level<#if video.videoCommentCount lt 40>${(video.videoCommentCount/10)?int}<#else>4</#if>">${video.videoCommentCount}</b> ${cmtLabel}</a>
                                &nbsp;•&nbsp;
                                <span class="article-level<#if video.videoViewCount lt 400>${(video.videoViewCount/100)?int}<#else>4</#if>">
                                <#if video.videoViewCount < 1000>
                                ${video.videoViewCount}
                                 <#else>
                                ${video.videoViewCntDisplayFormat}
                                </#if>
                                </span>
                                ${viewLabel}
                                &nbsp;•&nbsp;
                                ${video.timeAgo}
                        </span>
                    </div>
                    <div class="article-actions action-btns">
                        <span class="tooltipped tooltipped-n<#if isLoggedIn && 0 == video.videoVote> ft-red</#if>" aria-label="${upLabel}"
                        <#if permissions["commonGoodVideo"].permissionGrant>
                              onclick="Video.voteUp('${video.oId}', 'video', this)"
                        <#else>
                              onclick="Video.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-up"></span>${video.videoGoodCount}</span> &nbsp;

                        <span  class="tooltipped tooltipped-n<#if isLoggedIn && 1 == video.videoVote> ft-red</#if>" aria-label="${downLabel}"
                        <#if permissions["commonBadVideo"].permissionGrant>
                               onclick="Video.voteDown('${video.oId}', 'video', this)"
                        <#else>
                               onclick="Video.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-down"></span>${video.videoBadCount}</span> &nbsp;

                    <#if isLoggedIn && isFollowing>
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${uncollectLabel}"
                            <#if permissions["commonFollowVideo"].permissionGrant>
                              onclick="Util.unfollow(this, '${video.oId}', 'video',${video.videoCollectCount})"
                            <#else>
                              onclick="Video.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span>${video.videoCollectCount}</span>
                    <#else>
                        <span class="tooltipped tooltipped-n" aria-label="${collectLabel}"
                            <#if permissions["commonFollowVideo"].permissionGrant>
                              onclick="Util.follow(this, '${video.oId}', 'video', ${video.videoCollectCount})"
                            <#else>
                              onclick="Video.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span>${video.videoCollectCount}</span>
                    </#if> &nbsp;
                    <#if isLoggedIn && isWatching>
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${unfollowLabel}"
                            <#if permissions["commonWatchVideo"].permissionGrant>
                              onclick="Util.unfollow(this, '${video.oId}', 'video-watch',${video.videoWatchCount})"
                            <#else>
                              onclick="Video.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-view"></span>${video.videoWatchCount}</span>
                    <#else>
                        <span class="tooltipped tooltipped-n" aria-label="${followLabel}"
                            <#if permissions["commonWatchVideo"].permissionGrant>
                              onclick="Util.follow(this, '${video.oId}', 'video-watch', ${video.videoWatchCount})"
                            <#else>
                              onclick="Video.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-view"></span>${video.videoWatchCount}</span>
                    </#if> &nbsp;




                    <#--置顶-->
                    <#if video.isMyVideo && permissions["commonStickVideo"].permissionGrant>
                        <a class="tooltipped tooltipped-n" aria-label="${stickLabel}"
                           href="javascript:Video.stick('${video.oId}')"><span class="icon-chevron-up"></span></a> &nbsp;
                    </#if>
                    <#--编辑-->
                    <#if video.isMyVideo && permissions["adminUpdateVideo"].permissionGrant>
                        <a href="${servePath}/video/${video.oId}" aria-label="${editLabel}"
                           class="tooltipped tooltipped-n"><span class="icon-edit"></span></a> &nbsp;
                    </#if>
                    <#--管理-->
                    <#if permissions["adminUpdateVideo"].permissionGrant>
                        <a class="tooltipped tooltipped-n" href="${servePath}/video/${video.oId}" aria-label="${adminLabel}"><span class="icon-setting"></span></a> &nbsp;
                    </#if>
                    </div>
                </div>
                <#--标题-->
                <h1 class="article-title">
                    ${video.videoTitle}
                </h1>
                <script src="${staticServePath}/js/lib/video.js/js/clappr.js"></script>
                <script src="${staticServePath}/js/lib/video.js/js/clappr-playback-rate-plugin.js"></script>

                <div  class="aplayer" style="margin-top: 15px;width: 780px;height:384px;border-radius: 5px;">
                    <div id="player"></div>
                    <script>
                        var player = new Clappr.Player({
                            source: "${nginxHost}${nginxSuffix}/m3u8/${video.videoUrl}",
                            parentId: "#player",
                            width: 780,
                            height:384,
                            autoPlay:true,
                            chromeless: false,
                            watermark: "${staticServePath}/images/favicon.png", position: 'top-right',
                            plugins: {
                                'core': [PlaybackRatePlugin]
                            },
                            playbackRateConfig: {
                                defaultValue: '1.0',
                                options: [
                                    {value: '0.5', label: '0.5x'},
                                    {value: '1.0', label: '1x'},
                                    {value: '2.0', label: '2x'},
                                ]
                            }

                        });
                    </script>
                </div>
                <#--内容-->
                <h3 style="margin-top: 15px">${videoDesIcon}&nbsp;&nbsp;${videoDescLabel}</h3>

                <div class="content-reset article-content" style="margin-top: -5px;">
                    ${video.videoRemarks}
                </div>
            </div>
        </div>

        <div class="main <#if video.videoComments?size == 0> fn-none</#if>">
            <div class="wrapper" id="articleCommentsPanel">
            <#if pjax><!---- pjax {#comments} start ----></#if>
                <div class="module comments" id="comments">
                    <div class="comments-header module-header">
                        <span class="article-cmt-cnt">${video.videoCommentCount} ${cmtLabel}</span>
                        <span class="fn-right<#if video.videoComments?size == 0> fn-none</#if>">
                            <a class="tooltipped tooltipped-nw" href="javascript:Comment.exchangeCmtSort(${userCommentViewMode})"
                               aria-label="<#if 0 == userCommentViewMode>${changeToLabel}${realTimeLabel}${cmtViewModeLabel}<#else>${changeToLabel}${traditionLabel}${cmtViewModeLabel}</#if>"><span class="icon-<#if 0 == userCommentViewMode>sortasc<#else>time</#if>"></span></a>&nbsp;
                            <a class="tooltipped tooltipped-nw" href="javascript:Comment._bgFade($('#bottomComment'))" aria-label="${jumpToBottomCommentLabel}"><span class="icon-chevron-down"></span></a>
                        </span>
                    </div>
                    <div class="list">
                        <ul>
                        <#assign notificationCmtIds = "">
                            <#list video.videoComments as comment>
                            <#assign notificationCmtIds = notificationCmtIds + comment.oId>
                            <#if comment_has_next><#assign notificationCmtIds = notificationCmtIds + ","></#if>
                           <#include 'common/videocom.ftl' />
                        </#list>
                        </ul>
                        <div id="bottomComment"></div>
                    </div>
                    <@pagination url="${servePath}" query="m=${userCommentViewMode}#comments" pjaxTitle="${video.videoTitle} - ${symphonyLabel}" />
                </div>
                <#if pjax><!---- pjax {#comments} end ----></#if>
            </div>
        </div>
        <#include "footer.ftl">
        <span class="tooltipped tooltipped-w radio-btn" onclick="Comment._toggleReply()"
              data-hasPermission="${permissions['commonAddComment'].permissionGrant?c}"
              aria-label="${cmtLabel}"><span class="icon-reply"></span></span>
        <#if isLoggedIn >
        <div class="editor-panel">
            <div class="editor-bg"></div>
            <div class="wrapper">
                <div class="form fn-clear comment-wrap">
                    <div class="fn-flex">
                        <div id="replyUseName" class="fn-flex-1 fn-ellipsis"></div>
                        <span class="tooltipped tooltipped-w fn-pointer editor-hide" onclick="Comment._toggleReply()" aria-label="${hideLabel}"> <span class="icon-chevron-down"></span></span>
                    </div>
                    <div class="article-comment-content">
                        <textarea id="commentContent" placeholder="${commentEditorPlaceholderLabel}"></textarea>
                        <div class="fn-clear comment-submit">
                            <div class="tip fn-left" id="addCommentTip"></div>
                            <div class="fn-right">
                                <#if permissions["commonAddCommentAnonymous"].permissionGrant>
                                    <label class="cmt-anonymous">${anonymousLabel}<input type="checkbox" id="commentAnonymous"></label>
                                </#if>
                                <button class="red" onclick="Comment.add('${video.oId}', '${csrfToken}')">${submitLabel}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </#if>
        <script src="${staticServePath}/js/lib/compress/video-libs.min.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/video-channel.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/video.js?${staticResourceVersion}"></script>
        <script>
            Label.commentErrorLabel = "${commentErrorLabel}";
            Label.symphonyLabel = "${symphonyLabel}";
            Label.thankSentLabel = "${thankSentLabel}";
            Label.videoOId = "${video.oId}";
            Label.articleTitle = "${video.videoTitle}";
            Label.recordDeniedLabel = "${recordDeniedLabel}";
            Label.recordDeviceNotFoundLabel = "${recordDeviceNotFoundLabel}";
            Label.csrfToken = "${csrfToken}";
            Label.notAllowCmtLabel = "${notAllowCmtLabel}";
            Label.upLabel = "${upLabel}";
            Label.downLabel = "${downLabel}";
            Label.confirmRemoveLabel = "${confirmRemoveLabel}";
            Label.removedLabel = "${removedLabel}";
            Label.uploadLabel = "${uploadLabel}";
            Label.userCommentViewMode = ${userCommentViewMode};
            Label.stickConfirmLabel = "${stickConfirmLabel}";
            Label.stickVideoConfirmLabel = "${stickVideoConfirmLabel}";
            Label.audioRecordingLabel = '${audioRecordingLabel}';
            Label.uploadingLabel = '${uploadingLabel}';
            Label.copiedLabel = '${copiedLabel}';
            Label.copyLabel = '${copyLabel}';
            Label.noRevisionLabel = "${noRevisionLabel}";
            Label.thankedLabel = "${thankedLabel}";
            Label.thankLabel = "${thankLabel}";
            Label.isAdminLoggedIn = ${isAdminLoggedIn?c};
            Label.adminLabel = '${adminLabel}';
            Label.thankSelfLabel = '${thankSelfLabel}';
            Label.replyLabel = '${replyLabel}';
            Label.articleAuthorName = '${video.videoAuthorName}';
            Label.referenceLabel = '${referenceLabel}';
            Label.goCommentLabel = '${goCommentLabel}';
            Label.addBoldLabel = '${addBoldLabel}';
            Label.addItalicLabel = '${addItalicLabel}';
            Label.insertQuoteLabel = '${insertQuoteLabel}';
            Label.addBulletedLabel = '${addBulletedLabel}';
            Label.addNumberedListLabel = '${addNumberedListLabel}';
            Label.addLinkLabel = '${addLinkLabel}';
            Label.undoLabel = '${undoLabel}';
            Label.redoLabel = '${redoLabel}';
            Label.previewLabel = '${previewLabel}';
            Label.helpLabel = '${helpLabel}';
            Label.fullscreenLabel = '${fullscreenLabel}';
            Label.uploadFileLabel = '${uploadFileLabel}';
            Label.commonUpdateCommentPermissionLabel = '${commonUpdateCommentPermissionLabel}';
            Label.insertEmojiLabel = '${insertEmojiLabel}';
            Label.commonAtUser = '${permissions["commonAtUser"].permissionGrant?c}';
            Label.noPermissionLabel = '${noPermissionLabel}';
            Label.rewardLabel = '${rewardLabel}';
            Label.videoChannel = "${wsScheme}://${serverHost}:${serverPort}${contextPath}/article-channel?articleId=${video.oId}&articleType=0";
            <#if isLoggedIn>
            Label.currentUserName = '${currentUser.userName}';
            Label.notificationCmtIds = '${notificationCmtIds}';
            </#if>
        </script>
    </body>
</html>
