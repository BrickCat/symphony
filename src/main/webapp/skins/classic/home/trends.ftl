<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "${type}">

<link rel="stylesheet" type="text/css" href="${staticServePath}/js/lib/VerticalTimeline/css/timeline.css" />

<script src="${staticServePath}/js/lib/VerticalTimeline/js/jquery-1.8.3.min.js"></script>

<script src="${staticServePath}/js/lib/VerticalTimeline/js/modernizr.js"></script>


<div class="tabs-sub fn-clear">
    <a pjax-title="${trendsLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/trends" <#if type == "trends">class="current"</#if>>${trendsLabel}<#if type == "trends"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
    <a pjax-title="${trendAddCommentLabel} - ${user.userName} - ${symphonyLabel}" href="${servePath}/member/${user.userName}/trends/comments"<#if type == "trendComments"> class="current"</#if>>${trendAddCommentLabel}</a>
<#--<#if currentUser?? && currentUser.userName == user.userName>
<a pjax-title="${anonymousArticleLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "articlesAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/articles/anonymous">${anonymousArticleLabel}<#if type == "articlesAnonymous"> &nbsp;<span class="count">${paginationRecordCount?c}</span></#if></a>
<a pjax-title="${anonymousCommentLabel} - ${user.userName} - ${symphonyLabel}"<#if type == "commentsAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/comments/anonymous">${anonymousCommentLabel}</a>
</#if>-->
</div>
<#if isLoggedIn && ("adminRole" == currentUser.userRole || currentUser.userName == user.userName)>
<div class="list">
    <#if userHomeTrends?size == 0>
        <p class="ft-center ft-gray home-invisible">${chickenEggLabel}</p>
    </#if>
    <section id="cd-timeline" class="cd-container">
        <#list userHomeTrends as trend>
            <div class="cd-timeline-block">
                <div class="cd-timeline-img cd-picture">
                    <img src="${staticServePath}/js/lib/VerticalTimeline/images/cd-icon-picture.svg" alt="Picture">
                </div><!-- cd-timeline-img -->

                <div class="cd-timeline-content">
                    <h2>${trend.trendTitle}</h2>
                    <#list trend.trendImageURL?split(",") as imageUrl>
                        <#if imageUrl_index = 0>
                            <img src="${nginxHost}${nginxSuffix}/trend/${imageUrl}" style="width: 100%;height: 200px;margin-top: 15px;border-radius: 5px;">
                        </#if>
                    </#list>
                    <p>${trend.trendContent}</p>
                    <a href="${servePath}/trend/${trend.oId}/info" class="cd-read-more">阅读更多</a>
                    <span class="cd-date">${trend.trendCreateTime?string('yyyy/MM/dd HH:mm')}</span>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
        </#list>
    </section>
</div>
<@pagination url="${servePath}/member/${user.userName}/trends" pjaxTitle="${videoLabel} - ${user.userName} - ${symphonyLabel}"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>
<script>
    $(function(){
        var $timeline_block = $('.cd-timeline-block');
        //hide timeline blocks which are outside the viewport
        $timeline_block.each(function(){
            if($(this).offset().top > $(window).scrollTop()+$(window).height()*0.75) {
                $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
            }
        });
        //on scolling, show/animate timeline blocks when enter the viewport
        $(window).on('scroll', function(){
            $timeline_block.each(function(){
                if( $(this).offset().top <= $(window).scrollTop()+$(window).height()*0.75 && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
                }
            });
        });
    });
</script>