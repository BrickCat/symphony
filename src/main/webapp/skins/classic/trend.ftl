<#include "macro-head.ftl">
<#include "macro-pagination-query.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${trendsLabel} - ${symphonyLabel}">
        <meta name="keywords" content="${trend.trendTitle}" />
        <meta name="description" content="${trend.trendContent}"/>
        <meta http-equiv="Access-Control-Allow-Origin" content="*">

        </@head>
        <link rel="stylesheet" href="${staticServePath}/css/index.css?${staticResourceVersion}" />
        <link rel="stylesheet" href="${staticServePath}/js/lib/editor/codemirror.min.css?${staticResourceVersion}">
        <link rel="stylesheet" href="${staticServePath}/js/lib/trends/JPicture/css/jPicture.min.css">
        <!-- Open Graph -->
        <meta property="og:locale" content="zh_CN" />
        <meta property="og:type" content="trend" />
        <meta property="og:title" content="${trend.trendTitle} - ${symphonyLabel}" />
        <meta property="og:description" content="${trend.trendContent}" />
        <meta property="og:site_name" content="BrickCat" />
        <!-- Twitter Card -->
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:description" content="${trend.trendContent}" />
        <meta name="twitter:title" content="${trend.trendTitle} - ${symphonyLabel}" />
    </head>
    <body itemscope itemtype="http://schema.org/Product" class="article" oncontextmenu=self.event.returnValue=false onselectstart="return false">
        <#include "header.ftl">
        <div class="article-body">
            <div class="wrapper">
                <div class="article-info fn-flex">
                <a rel="author" href="${servePath}/member/${trend.trendAuthorName}"><div
                        class="avatar-mid tooltipped tooltipped-se" aria-label="${trend.trendAuthorName}" style="background-image:url('${trend.trendAuthorThumbnailURL}')"></div></a>
                    <div class="fn-flex-1 fn-ellipsis">
                    <a rel="author" href="${servePath}/member/${trend.trendAuthorName}" class="ft-gray"><strong class="ft-gray">BrickCat</strong></a>

                        <br/>

                        <span class="ft-gray">${symphonyLabel} ${trend.trendAuthor.userNo?c} ${numVIPLabel}</span>

                        <br/>
                        <span class="ft-gray">
                                <a rel="nofollow" class="ft-gray" href="#comments">
                                    <b class="article-level<#if trend.trendCommentCount lt 40>${(trend.trendCommentCount/10)?int}<#else>4</#if>">${trend.trendCommentCount}</b> ${cmtLabel}</a>
                                &nbsp;•&nbsp;
                                <span class="article-level<#if trend.trendViewCount lt 400>${(trend.trendViewCount/100)?int}<#else>4</#if>">
                                <#if trend.trendViewCount < 1000>
                                ${trend.trendViewCount}
                                 <#else>
                                ${trend.trendViewCntDisplayFormat}
                                </#if>
                                </span>
                                ${viewLabel}
                                &nbsp;•&nbsp;
                                ${trend.timeAgo}
                        </span>
                    </div>
                    <div class="article-actions action-btns">
                        <span class="tooltipped tooltipped-n<#if isLoggedIn && 0 == trendVote> ft-red</#if>" aria-label="${upLabel}"
                        <#if permissions["commonGoodVideo"].permissionGrant>
                              onclick="Trend.voteUp('${trend.oId}', 'trend', this)"
                        <#else>
                              onclick="trend.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-up"></span>${trend.trendGoodCnt}</span> &nbsp;

                    <#if isLoggedIn && isFollowing>
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${uncollectLabel}"
                            <#if permissions["commonFollowVideo"].permissionGrant>
                              onclick="Util.unfollow(this, '${trend.oId}', 'trend',${trend.trendCollectCnt})"
                            <#else>
                              onclick="Trend.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span>${trend.trendCollectCnt}</span>
                    <#else>
                        <span class="tooltipped tooltipped-n" aria-label="${collectLabel}"
                            <#if permissions["commonFollowVideo"].permissionGrant>
                              onclick="Util.follow(this, '${trend.oId}', 'trend', ${trend.trendCollectCnt})"
                            <#else>
                              onclick="trend.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span>${trend.trendCollectCnt}</span>
                    </#if> &nbsp;
                        <span class="tooltipped tooltipped-w<#if isLoggedIn && isGift> ft-red</#if>" aria-label="${rewardLabel}"
                              onclick="Trend.thank('${trend.oId}','${trend.trendAuthorId}',this)">
                                            <span class="icon-goods"></span>&nbsp;${trend.trendGiftCnt}</span> &nbsp;

                    <#--编辑-->
                    <#if trend.isMyTrend && permissions["adminUpdateVideo"].permissionGrant>
                        <a href="${servePath}/trend/${trend.oId}" aria-label="${editLabel}"
                           class="tooltipped tooltipped-n"><span class="icon-edit"></span></a> &nbsp;
                    </#if>
                    <#--管理-->
                    <#if permissions["adminUpdateVideo"].permissionGrant>
                        <a class="tooltipped tooltipped-n" href="${servePath}/trend/${trend.oId}" aria-label="${adminLabel}"><span class="icon-setting"></span></a> &nbsp;
                    </#if>
                    </div>
                </div>
                <#--标题-->
                <#--<h1 class="article-title">
                    ${trend.trendTitle}
                </h1>-->
                <#--内容-->
                <#--<h3 style="margin-top: 15px">${videoDesIcon}&nbsp;&nbsp;${trendDescLabel}</h3>-->
                <div class="content-reset article-content" style="margin-top: -5px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${trend.trendContent}fghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdffghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdffghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdffghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdffghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdffghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdffghdfggfdhfghdfghdfghdfghdfghfgbcvnvnghfgdhrthgfdhfghdfghrhdtgfhdfhfghdf
                </div>
                <#--<div style="height: 10px;width:900px;margin-left:-70px;margin-top:15px;border-top: #C0C0C0 dashed 1px;">

                </div>-->
                <!-- HTML 主体结构，需按照此格式书写，其中的 <a> 链接可根据实际需要添加或删除 -->
                <!-- 左右箭头和切换按钮的样式可根据实际需求在 jPicture.css 文件中进行修改 -->
                <div id="imgBox" style=" width: 770px; height: 400px; margin-left: auto; margin-right: auto;margin-top: 15px;border-radius: 10px;">
                    <div>
                        <div><a href="#1"><img src="${staticServePath}/js/lib/trends/JPicture/images/1.png"></a></div>
                        <div><a href="#2"><img src="${staticServePath}/js/lib/trends/JPicture/images/2.png"></a></div>
                        <div><a href="#3"><img src="${staticServePath}/js/lib/trends/JPicture/images/3.png"></a></div>
                        <div><a href="#4"><img src="${staticServePath}/js/lib/trends/JPicture/images/4.png"></a></div>
                        <div><a href="#5"><img src="${staticServePath}/js/lib/trends/JPicture/images/5.png"></a></div>
                        <div><a href="#6"><img src="${staticServePath}/js/lib/trends/JPicture/images/6.png"></a></div>
                    </div>
                </div>

            </div>
        </div>

        <div class="main <#if trend.trendComments?size == 0> fn-none</#if>">
            <div class="wrapper" id="articleCommentsPanel">
            <#if pjax><!---- pjax {#comments} start ---->;</#if>
                <div class="module comments" id="comments">
                    <div class="comments-header module-header">
                        <span class="article-cmt-cnt">${trend.trendCommentCount} ${cmtLabel}</span>
                        <span class="fn-right<#if trend.trendComments?size == 0> fn-none</#if>">
                            <a class="tooltipped tooltipped-nw" href="javascript:Comment.exchangeCmtSort(${userCommentViewMode})"
                               aria-label="<#if 0 == userCommentViewMode>${changeToLabel}${realTimeLabel}${cmtViewModeLabel}<#else>${changeToLabel}${traditionLabel}${cmtViewModeLabel}</#if>"><span class="icon-<#if 0 == userCommentViewMode>sortasc<#else>time</#if>"></span></a>&nbsp;
                            <a class="tooltipped tooltipped-nw" href="javascript:Comment._bgFade($('#bottomComment'))" aria-label="${jumpToBottomCommentLabel}"><span class="icon-chevron-down"></span></a>
                        </span>
                    </div>
                    <div class="list">
                        <ul>
                        <#assign notificationCmtIds = "">
                            <#list trend.trendComments as comment>
                            <#assign notificationCmtIds = notificationCmtIds + comment.oId>
                            <#if comment_has_next><#assign notificationCmtIds = notificationCmtIds + ","></#if>
                           <#include 'common/videocom.ftl' />
                        </#list>
                        </ul>
                        <div id="bottomComment"></div>
                    </div>
                    <@pagination url="${servePath}" query="m=${userCommentViewMode}#comments" pjaxTitle="${trend.trendTitle} - ${symphonyLabel}" />
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
                                <button class="red" onclick="Comment.add('${trend.oId}', '${csrfToken}')">${submitLabel}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </#if>
        <script src="${staticServePath}/js/lib/compress/video-libs.min.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/trend-channel.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/lib/trends/trend.js?${staticResourceVersion}"></script>
        <script src="${staticServePath}/js/lib/trends/JPicture/js/jquery-1.12.4.min.js"></script>
        <script src="${staticServePath}/js/lib/trends/JPicture/js/jPicture.min.js"></script>

        <script type="text/javascript">
            jPicture("#imgBox", {
                type: "slide",
                autoplay: 3000
            });

        </script>

        <script>
            Label.commentErrorLabel = "${commentErrorLabel}";
            Label.symphonyLabel = "${symphonyLabel}";
            Label.thankSentLabel = "${thankSentLabel}";
            Label.trendOId = "${trend.oId}";
            Label.articleTitle = "${trend.trendTitle}";
            Label.recordDeniedLabel = "${recordDeniedLabel}";
            Label.recordDeviceNotFoundLabel = "${recordDeviceNotFoundLabel}";
            Label.csrfToken = "${csrfToken}";
            Label.notAllowCmtLabel = "${notAllowCmtLabel}";
            Label.upLabel = "${upLabel}";
            Label.downLabel = "${downLabel}";
            Label.confirmRemoveLabel = "${confirmRemoveLabel}";
            Label.removedLabel = "${removedLabel}";
            Label.uploadLabel = "${uploadLabel}";
            Label.trendAlreadyThankLabel = "${trendAlreadyThankLabel}";
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
            Label.trendChannel = "${wsScheme}://${serverHost}:${serverPort}${contextPath}/article-channel?articleId=${trend.oId}&articleType=0";
            <#if isLoggedIn>
            Label.currentUserName = '${currentUser.userName}';
            </#if>
        </script>
    </body>
</html>
