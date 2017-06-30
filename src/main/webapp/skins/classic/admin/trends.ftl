<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "trends">
<div class="list content admin">
    <div class="module list">
        <form method="GET" action="${servePath}/admin/trends" class="form">
            <input name="trendId" type="text" placeholder="${trendIdLabel}"/>
            <button type="submit" class="green">${searchLabel}</button> &nbsp;
            <#if permissions["userAddTrends"].permissionGrant>
                <button type="button" class="btn red" onclick="window.location = '${servePath}/admin/add-trend'">${trendsAddLabel}</button>
            </#if>
        </form>
        <#if trends ??>
            <ul>
                <#list trends as item>
                        <li>
                            <div class="fn-flex">
                                <#if 1 != 1>
                                    <div class="avatar" style="background-image:url('${staticServePath}/images/tags/${item.tagIconPath}')"></div>
                                </#if>
                               <div class="fn-flex-1">
                                   <h2>

                                       <a href="${servePath}/trends">${item.trendTitle}</a>

                                       <a href="${servePath}/trends/${item.oId}" class="fn-right tooltipped tooltipped-w ft-a-title" aria-label="${editLabel}"><span class="icon-edit"></span></a> &nbsp;
                                   </h2>
                                    ${item.trendContent}
                                   <div class="fn-clear">
                                        <span class="fn-right ft-gray">
                                            <span class="tooltipped tooltipped-n" aria-label="${trendCommentLabel}"><span class="icon-cmts"></span></span>
                                        ${item.trendCommentCount}&nbsp;
                                            <span class="tooltipped tooltipped-n" aria-label="${trendGoodLabel}"><span class="icon-goods"></span></span>
                                        ${item.trendGoodCnt}&nbsp;
                                            <span class="tooltipped tooltipped-n" aria-label="${createTimeLabel}"><span class="icon-date"></span></span>
                                        ${item.trendCreateTime?string('yyyy-MM-dd HH:mm')}
                                        </span>
                                   </div>
                               </div>
                            </div>
                        </li>
                </#list>
            </ul>
        </#if>
    </div>
    <@pagination url="${servePath}/admin/trends"/>
</div>
</@admin>
