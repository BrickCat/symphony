<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="${trendsLabel} - ${symphonyLabel}">
    <meta name="description" content="${symphonyLabel} ${trendVideosLabel},${symphonyLabel} ${coldVideosLabel}"/>
</@head>
    <link rel="canonical" href="${servePath}/trends">
    <link href="${staticServePath}/js/lib/trends/baguetteBox/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${staticServePath}/js/lib/trends/baguetteBox/css/baguetteBox.min.css">
    <link rel="stylesheet" href="${staticServePath}/js/lib/trends/baguetteBox/css/gallery-grid.css">
    <link rel="stylesheet" href="${staticServePath}/js/lib/gifsee.js/js/gifplayer.min.css">
</head>
<body>
<#include "header.ftl">
<div class="main">
    <div class="wrapper">
        <div class="content">
            <div class="module">
                <div class="module-header">
                    <h2>
                    ${trendsHotLabel}
                    </h2>
                </div>
                <div class="module-panel list">
                <#list trends as trend>
                    <div class="container gallery-container" style="width: 80%;margin-left: 10%;margin-top: 3%;border:1px solid #D1CFCF;">
                        <div class="article-info fn-flex" style="margin-left: 2%;margin-top: 2%">
                            <a rel="author" href="${servePath}/member/${trend.trendAuthor.userName}">
                                <div class="avatar-mid tooltipped tooltipped-se" aria-label="${trend.trendAuthor.userName}" style="background-image:url('${trend.trendParticipantThumbnailURL}')">

                                </div>
                            </a>
                            <div class="fn-flex-1 fn-ellipsis" style="margin-top: -2%;">
                                <a rel="author" href="${servePath}/member/${trend.trendAuthor.userName}" class="ft-gray"><strong class="ft-gray">${trend.trendAuthor.userName}</strong></a>

                                <br/>

                                <span class="ft-gray">${symphonyLabel} ${trend.trendAuthor.userNo} ${numVIPLabel}</span>

                                <br/>
                                <span class="ft-gray">
                                                <a rel="nofollow" class="ft-gray" href="#comments">
                                                    <b class="article-level<#if trend.trendCommentCount lt 40>${(trend.trendCommentCount/10)?int}<#else>4</#if>">${trend.trendCommentCount}</b> ${cmtLabel}</a>
                                                &nbsp;•&nbsp;
                                                <span class="article-level<#if trend.trendViewCount lt 400>${(trend.trendViewCount/100)?int}<#else>4</#if>">
                                                    <#if 10 < 1000>
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
                            <span class="tooltipped tooltipped-n" style="margin-right: 10px;height: 56px;width: 56px;" aria-label="More">
                                <svg height="36" viewBox="0 -1 17 14" width="36">${moreIcon}</svg>
                            </span>
                        </div>
                        <div class="content-reset article-content" style="margin-left: 13%;margin-right: 3%;margin-bottom: 0%;margin-top: 2%;">
                        ${trend.trendContent}
                        </div>
                        <div class="tz-gallery" style="margin-left: 10%;">
                            <div class="row">
                                <#list trend.trendImageURL?split(",") as imageUrl>
                                    <#list imageUrl?split(".") as img>
                                        <#if img == "gif">
                                            <div class="col-sm-6 col-md-4">
                                                <a class="lightbox" href="${nginxHost}:${nginxProt}/trend/${imageUrl}">
                                                <#list imageUrl?split(".") as img2>
                                                    <#if img2 != "gif" && img2 != "png">
                                                        <img src="${nginxHost}:${nginxProt}/trend/${img2}.png" class="gifs" style="width: 190px;height: 134px;" alt="Park">
                                                        <ins class='play-gif'>GIF</ins>
                                                    </#if>
                                                </#list>
                                                </a>
                                            </div>
                                        <#elseif img == "png" || img == "jpg">
                                            <div class="col-sm-6 col-md-4">
                                                <a class="lightbox" href="${nginxHost}:${nginxProt}/trend/${imageUrl}">
                                                    <img src="${nginxHost}:${nginxProt}/trend/${imageUrl}" style="width: 190px;height: 134px;" alt="Park">
                                                </a>
                                            </div>
                                        </#if>
                                    </#list>
                                </#list>
                            </div>
                        </div>
                    </div>
                    <div class="row trend-comment">
                        <div class="col-sm-1 trend-comment-left">
                            <img class="trend-comment-img" style="padding-left: 10px;" src="${staticServePath}/images/trend/trend-sport-left.gif">
                        </div>
                        <div class="col-sm-10 trend-comment-mid">
                            <div class="trend-comment-bar">
                                <div class="trend-comment-bar-left" style="border-right: 1px dashed #C0C0C0;">
                                    <div class="trend-comment-bar-thumb">
                                        <span class="tooltipped tooltipped-w<#if isLoggedIn && 0 == trend.trendGoodCnt> ft-red</#if>" aria-label="${upLabel}"
                                            <#if permissions["commonGoodVideo"].permissionGrant>
                                              onclick="Trend.voteUp('${trend.oId}', 'trend', this)"
                                            <#else>
                                              onclick="Trend.permissionTip(Label.noPermissionLabel)"
                                            </#if>><span class="icon-thumbs-up"></span>&nbsp;${trend.trendGoodCnt}</span>
                                    </div>
                                </div>
                                <div class="trend-comment-bar-mid" style="border-right: 1px dashed #C0C0C0">
                                    <div class="trend-comment-bar-thumb">
                                        <#if isLoggedIn>
                                            <span class="tooltipped tooltipped-n ft-red" aria-label="${uncollectLabel}"
                                                <#if permissions["commonFollowVideo"].permissionGrant>
                                                  onclick="Util.unfollow(this, '${trend.oId}', 'trend',${trend.trendCollectCnt})"
                                                <#else>
                                                  onclick="Trend.permissionTip(Label.noPermissionLabel)"
                                                </#if>><span class="icon-star"></span>&nbsp;${trend.trendCollectCnt}</span>
                                        <#else>
                                            <span class="tooltipped tooltipped-n" aria-label="${collectLabel}"
                                                <#if permissions["commonFollowVideo"].permissionGrant>
                                                  onclick="Util.follow(this, '${trend.oId}', 'trend', ${trend.trendCollectCnt})"
                                                <#else>
                                                  onclick="Trend.permissionTip(Label.noPermissionLabel)"
                                                </#if>><span class="icon-star"></span>&nbsp;${trend.trendCollectCnt}</span>
                                        </#if>
                                    </div>
                                </div>
                                <div class="trend-comment-bar-mid" style="border-right: 1px dashed #C0C0C0">
                                    <div class="trend-comment-bar-thumb" onclick="Comment.trendetail('${trend.oId}')">
                                        <span class="tooltipped tooltipped-w<#if isLoggedIn && 0 == trend.trendCommentCount> ft-red</#if>" aria-label="${upLabel}"
                                            <#if permissions["commonAddComment"].permissionGrant>
                                              onclick="Trend.trendetail('${trend.oId}')"
                                            <#else>
                                              onclick="Trend.permissionTip(Label.noPermissionLabel)"
                                            </#if>><span class="icon-cmts"></span>&nbsp;${trend.trendCommentCount}</span>
                                    </div>
                                </div>
                                <div class="trend-comment-bar-mid" style="border-right: 1px dashed #C0C0C0">
                                    <div class="trend-comment-bar-thumb" onclick="Comment.trendetail('${trend.oId}')">
                                        <a class="tooltipped tooltipped-w" aria-label="${stickLabel}">
                                            <span class="icon-goods"></span>&nbsp;999
                                        </a>
                                    </div>
                                </div>
                                <div class="trend-comment-bar-right">
                                    <div class="trend-comment-bar-thumb">
                                        <span  class="tooltipped tooltipped-n<#if isLoggedIn && 0 == trend.trendBadCnt> ft-red</#if>" aria-label="${downLabel}"
                                            <#if permissions["commonBadVideo"].permissionGrant>
                                               onclick="Trend.voteDown('${trend.oId}', 'trend', this)"
                                            <#else>
                                               onclick="Trend.permissionTip(Label.noPermissionLabel)"
                                            </#if>><span class="icon-thumbs-down"></span>&nbsp;${trend.trendBadCnt}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1 trend-comment-right">
                            <img class="trend-comment-img" style="padding-left: 10px;" src="${staticServePath}/images/trend/trend-sport-right.gif">
                        </div>
                    </div>
                </#list>
                </div>
            </div>
        </div>
        <div class="side">
        <#include "trends_side.ftl">
        </div>
    </div>
</div>
<#include "footer.ftl">

<script type="text/javascript" src="${staticServePath}/js/lib/trends/baguetteBox/js/baguetteBox.min.js"></script>
<script type="text/javascript" src="${staticServePath}/js/lib/trends/trend.js"></script>

<script type="text/javascript">
    baguetteBox.run('.tz-gallery');
    Label.noPermissionLabel = '${noPermissionLabel}';
</script>
</body>
</html>