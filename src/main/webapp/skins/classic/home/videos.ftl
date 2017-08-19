<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "${type}">

<link rel="stylesheet" type="text/css" href="${staticServePath}/js/lib/VerticalTimeline/css/default.css" />

<link rel="stylesheet" type="text/css" href="${staticServePath}/js/lib/VerticalTimeline/css/component.css" />

<script src="${staticServePath}/js/lib/VerticalTimeline/js/modernizr.custom.js"></script>

<div class="tabs-sub fn-clear">
    <a pjax-title="${videoLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/videos" <#if type == "videos">class="current"</#if>>${videoLabel}<#if type == "videos"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
    <a pjax-title="${trendAddCommentLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/videos/comments"<#if type == "videoComments"> class="current"</#if>>${trendAddCommentLabel}</a>
<#--<#if currentUser?? && currentUser.userName == user.userName>
<a pjax-title="${anonymousArticleLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "articlesAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/articles/anonymous">${anonymousArticleLabel}<#if type == "articlesAnonymous"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
<a pjax-title="${anonymousCommentLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "commentsAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/comments/anonymous">${anonymousCommentLabel}</a>
</#if>-->
</div>
<#if isLoggedIn && ("adminRole" == currentUser.userRole || currentUser.userName == user.userName)>
<div class="list">
    <#if userHomeVideos?size == 0>
        <p class="ft-center ft-gray home-invisible">${chickenEggLabel}</p>
    </#if>
    <ul class="cbp_tmtimeline">
        <#list userHomeVideos as video>
            <li style="border-bottom:0px solid #fff;">

                <time class="cbp_tmtime" style="margin-left: -110px;margin-top: -20px;" datetime="${video.videoCreateTime?string('yyyy-MM-dd HH:mm')}"><span>${video.videoCreateTime?string('yyyy/MM/dd')}</span> <span>${video.videoCreateTime?string('HH:mm')}</span></time>

                <div class="cbp_tmicon icon-video" style="left: 19%;"></div>

                <div class="cbp_tmlabel" style="cursor:pointer;margin-top: -15px;" onclick="window.location.href = '${servePath}/video/front/${video.oId}/show-video'">

                    <h2>${video.videoTitle}</h2>

                    <div style="height: 150px;margin-top: 10px;">
                        <div style="float: left;width: 40%;"><img src="${nginxHost}${nginxSuffix}/image/${video.videoImgPath}" onerror="this.src='${staticServePath}/images/video/sport.png'" style="height: 150px;border-radius: 5px;"/></div>
                        <div style="float: left;width: 59%;margin-left: 5px;"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${video.videoRemarks}</p></div>
                    </div>
                </div>
            </li>
        </#list>
    </ul>
</div>
<@pagination url="${servePath}/member/${user.userName}/videos" pjaxTitle="${videoLabel} - ${user.userName} - ${symphonyLabel}"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>