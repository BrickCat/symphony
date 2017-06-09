<#include "macro-admin.ftl">
<@admin "articles">
<#if video ??>
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
                <form action="${servePath}/video/update/${video.oId}" method="POST">
                    <label for="videoTitle">${videoTitle}</label>
                    <input type="text" id="videoTitle" name="videoTitle"  value="${video.videoTitle}"/>

                    <label for="videoTag">${videoTag}</label>
                    <input id="videoTag" name="videoTag" type="text" value="${video.videoTag}"/>

                    <label for="videoRemarks">${videoRemarks}</label>
                    <textarea name="videoRemarks" rows="5">${video.videoRemarks}</textarea>

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

                    <br/><br/>
                    <button type="submit" class="green fn-right" >${submitLabel}</button>
                </form>
            </div>
        </div>
        </#if>

        <#if permissions["adminDeleteVideo"].permissionGrant>
        <div class="module">
            <div class="module-header">
                <h2 class="ft-red">${removeDataLabel}</h2>
            </div>
            <div class="module-panel form fn-clear">
                <form action="${servePath}/video/remove-video" method="POST" onsubmit="return window.confirm('${confirmRemoveLabel}')">
                    <label>Id</label>
                    <input type="text" name="videoId" value="${video.oId}" readonly="readonly">

                    <br/><br/>
                    <button type="submit" class="green fn-right" >${submitLabel}</button>
                </form>
            </div>
        </div>
        </#if>
    </div>
</#if>
</@admin>