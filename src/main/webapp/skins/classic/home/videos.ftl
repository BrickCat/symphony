<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "${type}">
<div class="tabs-sub fn-clear">
    <a pjax-title="${articleLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/videos" <#if type == "videos">class="current"</#if>>${videoLabel}<#if type == "vidoes"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
    <a pjax-title="${trendAddCommentLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/videos/comments"<#if type == "comments"> class="current"</#if>>${trendAddCommentLabel}</a>
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
    <ul> 
        <#list userHomeVideos as video>

        </#list>
    </ul>
</div>
<@pagination url="${servePath}/member/${user.userName}" pjaxTitle="${articleLabel} - ${user.userName} - ${symphonyLabel}"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>