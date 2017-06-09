<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "video">
<div class="list content admin">
    <div class="module list">
        <form method="GET" action="${servePath}/admin/videos" class="form">
            <input name="videoTitileOrVideoTag" type="text" placeholder="${videoURl}/${videoTag}"/>
            <button type="submit" class="green">${searchLabel}</button> &nbsp;
            <#if permissions["adminAddVideo"].permissionGrant>
                <button type="button" class="btn red" onclick="window.location = '${servePath}/admin/add-video'">${adminAddVideoPermissionLabel}</button>
            </#if>
        </form>
        <#if videos ??>
            <ul>
                <#list videos as item>
                    <li>
                        <div class="fn-flex">
                            <#if 1 != 1>
                                <div class="avatar" style="background-image:url('${staticServePath}/images/tags/${item.tagIconPath}')"></div>
                            </#if>
                           <div class="fn-flex-1">
                               <h2>
                                   <#-- 标题 -->
                                   <a href="${servePath}/video/${item.oId}">${item.videoTitle}</a> •
                                   <#-- 修改 -->
                                   <a href="${servePath}/video/${item.oId}" class="fn-right tooltipped tooltipped-w ft-a-title" aria-label="${editLabel}"><span class="icon-edit"></span></a> &nbsp;
                                   <#if item.videoStatus == 0>
                                       <span class="ft-smaller ft-gray">${videoStatusTrue}</span>
                                   <#else >
                                       <span class="ft-smaller ft-red">${videoStatusFalse}</span>
                                   </#if>
                               </h2>
                               ${item.videoRemarks}
                               <div class="fn-clear">
                                    <span class="fn-right ft-gray">
                                        <span class="tooltipped tooltipped-n" aria-label="${videoCountLabel}"><span class="icon-video"></span></span>
                                    0&nbsp;
                                        <span class="tooltipped tooltipped-n" aria-label="${commentCountLabel}"><span class="icon-cmts"></span></span>
                                    0 &nbsp;
                                        <span class="tooltipped tooltipped-n" aria-label="${createTimeLabel}"><span class="icon-date"></span></span>
                                    ${item.videoCreateTime?string('yyyy-MM-dd HH:mm')}
                                    </span>
                               </div>
                           </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </#if>
    </div>
    <@pagination url="${servePath}/admin/videos"/>
</div>
</@admin>
