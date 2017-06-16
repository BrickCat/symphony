<#include "macro-head.ftl">
<#include "macro-pagination-query.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${video.videoTitle} - ${symphonyLabel}">
        <meta name="keywords" content="${video.videoTag}" />
        <meta name="description" content="${video.videoRemarks}"/>
        </@head>

        <link href="${staticServePath}/js/lib/video.js/css/video-js.css" rel="stylesheet">
            <!-- If you'd like to support IE8 --><script src="${staticServePath}/js/lib/video.js/js/videojs-ie8.min.js"></script>
        <link rel="stylesheet" href="${staticServePath}/js/lib/highlight.js-9.6.0/styles/github.css">
        <link rel="stylesheet" href="${staticServePath}/css/index.css?${staticResourceVersion}" />
        <link rel="stylesheet" href="${staticServePath}/js/lib/editor/codemirror.min.css?${staticResourceVersion}">
         <link href="${staticServePath}/js/lib/video.js/css/videojs-vjsdownload.css" rel="stylesheet">
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
                <a rel="author" href="${servePath}/member/<#--用户名-->"><div
                        class="avatar-mid tooltipped tooltipped-se" aria-label="admin<#--用户名-->" style="background-image:url('/*图片URL*/')"></div></a>
                    <div class="fn-flex-1 fn-ellipsis">
                    <a rel="author" href="${servePath}/member/<#--发布人姓名-->" class="ft-gray"><strong class="ft-gray"><#--发布人NAME-->admin</strong></a>

                        <br/>

                        <span class="ft-gray">${symphonyLabel} 2<#--几号会员--> ${numVIPLabel}</span>

                        <br/>
                        <span class="ft-gray">
                                &nbsp;
                                <a rel="nofollow" class="ft-gray" href="#comments">
                                    <b class="article-level<#--<#if article.articleCommentCount lt 40>${(article.articleCommentCount/10)?int}<#else>评论级数-->3">5<#--评论数--></b> ${cmtLabel}</a>
                                &nbsp;•&nbsp;
                                <span class="article-level<#--<#if article.articleViewCount lt 400>${(article.articleViewCount/100)?int}<#else> 查看级数-->3">
                                <#--<#if article.articleViewCount < 1000>
                                ${article.articleViewCount}
                                <#else>
                                ${article.articleViewCntDisplayFormat}
                                </#if>-->
                                <#--大于1000后格式化输出-->
                                    10
                                </span>
                        ${viewLabel}
                                &nbsp;•&nbsp;
                        <#--${article.timeAgo}多久前--> 1小时前
                            </span>
                    </div>
                    <#-- 点赞踩编辑 -->
                    <div class="article-actions action-btns">
                        <span class="tooltipped tooltipped-n<#--<#if isLoggedIn && 0 == article.articleVote> ft-red</#if>--> 是否点赞" aria-label="${upLabel}"
                        <#if permissions["commonGoodArticle"].permissionGrant>
                              onclick="Article.voteUp('<#--${article.oId}-->', 'article', this)"
                        <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-up"></span> <#--点赞数-->1</span> &nbsp;

                        <span  class="tooltipped tooltipped-n<#--<#if isLoggedIn && 1 == article.articleVote> ft-red</#if>-->" aria-label="${downLabel}"
                        <#if permissions["commonBadArticle"].permissionGrant>
                               onclick="Article.voteDown('<#--${article.oId}-->', 'article', this)"
                        <#else>
                               onclick="Article.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-down"></span> <#--反对数-->1</span> &nbsp;

                    <#--<#if isLoggedIn && isFollowing>-->
                    <#--取消收藏-->
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${uncollectLabel}"
                           <#-- <#if permissions["commonFollowArticle"].permissionGrant>
                              onclick="Util.unfollow(this, '&lt;#&ndash;${article.oId}&ndash;&gt;', 'article', &lt;#&ndash;${article.articleCollectCnt}收藏数&ndash;&gt;)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span>&lt;#&ndash; ${article.articleCollectCnt}&ndash;&gt;1</span>-->
                    <#--<#else>-->
                    <#--收藏-->
                        <span class="tooltipped tooltipped-n" aria-label="${collectLabel}"
                            <#if permissions["commonFollowArticle"].permissionGrant>
                              onclick="Util.follow(this, '<#--${article.oId}-->', 'article', <#--${article.articleCollectCnt}-->)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span> <#--${article.articleCollectCnt}-->1</span>
                    <#--</#if>--> &nbsp;

                   <#-- <#if isLoggedIn && isWatching>-->
                    <#--取消关注-->
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${unfollowLabel}"
                            <#if permissions["commonWatchArticle"].permissionGrant>
                              onclick="Util.unfollow(this, '<#--${article.oId}'-->, 'article-watch', <#--${article.articleWatchCnt}-->)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-view"></span> <#--${article.articleWatchCnt}-->0</span>
                    <#--<#else>-->
                    <#--关注-->
                        <#--<span class="tooltipped tooltipped-n" aria-label="${followLabel}"
                            <#if permissions["commonWatchArticle"].permissionGrant>
                              onclick="Util.follow(this, '&lt;#&ndash;${article.oId}&ndash;&gt;', 'article-watch', &lt;#&ndash;${article.articleWatchCnt}&ndash;&gt;)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-view"></span> &lt;#&ndash;${article.articleWatchCnt}&ndash;&gt;1</span>-->
                    <#--</#if>--> &nbsp;
                    <#--置顶-->
                    <#if <#--article.isMyArticle && -->permissions["commonStickArticle"].permissionGrant>
                        <a class="tooltipped tooltipped-n" aria-label="${stickLabel}"
                           href="javascript:Article.stick('<#--${article.oId}-->')"><span class="icon-chevron-up"></span></a> &nbsp;
                    </#if>
                    <#--编辑-->
                    <#if <#--article.isMyArticle && 3 != article.articleType &&--> permissions["commonUpdateArticle"].permissionGrant>
                        <a href="${servePath}/update?id=<#--${article.oId}-->" aria-label="${editLabel}"
                           class="tooltipped tooltipped-n"><span class="icon-edit"></span></a> &nbsp;
                    </#if>
                    <#--管理-->
                    <#if permissions["articleUpdateArticleBasic"].permissionGrant>
                        <a class="tooltipped tooltipped-n" href="${servePath}/admin/article/<#--${article.oId}-->" aria-label="${adminLabel}"><span class="icon-setting"></span></a> &nbsp;
                    </#if>
                    </div>
                </div>
                <#--标题-->
                <h1 class="article-title">
                    ${video.videoTitle}
                </h1>
                <div  class="aplayer" style="margin-top: 15px;">
                    <video id="my-video" class="video-js vjs-default-skin" controls preload="auto" width="840" height="384" poster="<#if video.videoImgPath??>${servePath}${video.videoImgPath}</#if>" data-setup='{ "aspectRatio":"840:384", "playbackRates": [1, 1.5, 2] }'>
                        <source src="${servePath}${video.videoUrl}" type="video/mp4">
                    </video>
                    <script src="${staticServePath}/js/lib/video.js/js/video.min.js"></script>
                    <script src="${staticServePath}/js/lib/video.js/js/videojs-vjsdownload.js"></script>
                    <script type="text/javascript">

                        var player = videojs(document.querySelector('.video-js'), {
                            "playbackRates": [1, 1.5, 2],
                            "autoplay": true,
                            plugins: {
                                vjsdownload:{
                                    beforeElement: 'playbackRateMenuButton',
                                    textControl: 'Download',
                                    name: 'downloadButton'
                                }
                            }
                        } , function() {
                            this.on('downloadvideo', function(){
                                var fileURL=window.open ('${servePath}${video.videoUrl}',"height=0,width=0,toolbar=no,menubar=no,scrollbars=no,resizable=on,location=no,status=no");
                                fileURL.document.execCommand("SaveAs");
                                fileURL.window.close();
                                fileURL.close();
                            });
                        });
                    </script>
                </div>
                <#--内容-->
                <h3 style="margin-top: 15px">${videoDesIcon}&nbsp;&nbsp;${videoDescLabel}</h3>

                <div class="content-reset article-content" style="margin-top: -5px;">
                    ${video.videoRemarks}hgdhghdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
                </div>
            </div>
        </div>

        <div class="main <#--<#if video.videoComments?size == 0>--> fn-none<#--</#if>-->">
            <div class="wrapper" id="articleCommentsPanel">
            <#if pjax><!---- pjax {#comments} start ----></#if>
                <div class="module comments" id="comments">
                    <div class="comments-header module-header">
                        <span class="article-cmt-cnt"><#--${article.articleCommentCount} 回帖数-->12 ${cmtLabel}</span>
                        <span class="fn-right<#--评论列表<#if article.articleComments?size == 0>--> fn-none<#--</#if>-->">
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
                            <#include 'common/comment.ftl' />
                        </#list>
                        </ul>
                        <div id="bottomComment"></div>
                    </div>
                    <@pagination url="${servePath}<#---->" query="m=${userCommentViewMode}#comments" pjaxTitle="${video.videoTitle} - ${symphonyLabel}" />
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
        <script src="${staticServePath}/js/lib/compress/article-libs.min.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/channel${miniPostfix}.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/video.js?${staticResourceVersion}"></script>
        <script>
            Label.commentErrorLabel = "${commentErrorLabel}";
            Label.symphonyLabel = "${symphonyLabel}";
            Label.thankSentLabel = "${thankSentLabel}";
            Label.articleOId = "${video.oId}";
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
            <#if isLoggedIn>
            Label.currentUserName = '${currentUser.userName}';
            Label.notificationCmtIds = '${notificationCmtIds}';
            </#if>
        </script>
    </body>
</html>
