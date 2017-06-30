<#include "macro-admin.ftl">
<@admin "trends">
<#if trend ??>
    <div class="content">
        <#if permissions["userUpdateTrends"].permissionGrant>
        <div class="module">
            <div class="module-header">
                <h2>${modifiableLabel}</h2>
            </div>
            <div class="module-panel form fn-clear">
                <form action="${servePath}/trends/${trend.oId}/update-trend" method="POST">
                    <label for="trendTitle">${trendTitleLabel}</label>
                    <input type="text" id="trendTitle" name="trendTitle"  value="${trend.trendTitle}"/>

                    <label for="trendContent">${trendContentLabel}</label>
                    <textarea name="trendContent" rows="3">${trend.trendContent}</textarea>

                    <br/><br/>
                    <button type="submit" class="green fn-right" >${submitLabel}</button>
                </form>
            </div>
        </div>
        </#if>

        <#if permissions["userDeleteTrends"].permissionGrant>
        <div class="module">
            <div class="module-header">
                <h2 class="ft-red">${removeDataLabel}</h2>
            </div>
            <div class="module-panel form fn-clear">
                <form action="${servePath}/trends/remove-trend" method="POST" onsubmit="return window.confirm('${confirmRemoveLabel}')">
                    <label>Id</label>
                    <input type="text" name="trendId" value="${trend.oId}" readonly="readonly">

                    <br/><br/>
                    <button type="submit" class="green fn-right" >${submitLabel}</button>
                </form>
            </div>
        </div>
        </#if>
    </div>
</#if>
</@admin>