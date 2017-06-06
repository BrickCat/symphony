<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "videos">
<div class="content admin">
    <div class="module list">
        <form method="GET" action="${servePath}/admin/videos" class="form">
            <input name="videoTitileOrVideoTag" type="text" placeholder="${videoURl}/${videoTag}"/>
            <button type="submit" class="green">${searchLabel}</button> &nbsp;
            <#if permissions["adminAddVideo"].permissionGrant>
                <button type="button" class="btn red" onclick="window.location = '${servePath}/admin/add-video'">${adminAddVideoPermissionLabel}</button>
            </#if>
        </form>
    </div>
</div>
</@admin>
