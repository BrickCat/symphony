<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "video">
<div class="content">
    <div class="module">
        <div class="module-header">
            <h2>${unmodifiableLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <label>Id</label>
            <input type="text" value="${video.oId}" readonly="readonly">
            <label>${videoURl}</label>
            <input type="text" value="${video.videoUrl}" readonly="readonly">
        </div>
    </div>

    <#if permissions["adminUpdateVideo"].permissionGrant>
    <div class="module">
        <div class="module-header">
            <h2>${modifiableLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <form class="fn-right form" action="${servePath}/video/${video.oId}" method="POST" >

                <label for="videoTitle">${videoTitle}</label>
                <input type="text" id="videoTitle" name="videoTitle"  value="${video.videoTitle}"/>

                <label for="videoTag">${videoTag}</label>
                <input id="videoTag" name="videoTag" type="text" value="${video.videoTag}"/>

                <label for="videoRemarks">${videoRemarks}</label>
                <input id="videoRemarks" name="videoRemarks" type="text" value="${video.videoRemarks}"/>

                <label for="videoType">${videoType}</label>
                <select id="videoType" name="videoType">
                    <option value="0" <#if 0== video.videoType>selected</#if>>${videoTypeTrue}</option>
                    <option value="1" <#if 1== video.videoType>selected</#if>>${videoTypeFalse}</option>
                </select>

                <label for="videoPoint">${videoPoint}</label>
                <input id="videoPoint" name="videoPoint" type="text" value="${video.videoPoint}"/>

                <label>${videoStatus}</label>
                <select id="videoStatus" name="videoStatus">
                    <option value="0" <#if 0== video.videoStatus>selected</#if>>${videoStatusTrue}</option>
                    <option value="1" <#if 0== video.videoStatus>selected</#if>>${videoStatusFalse}</option>
                </select>
                    <br/><br/><br/>
                    <button type="submit" class="green fn-right">${submitLabel}</button>
                </form>
            </div>
        </div>
    </#if>
</div>
</@admin>
