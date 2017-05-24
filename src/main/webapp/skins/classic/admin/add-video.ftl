<#include "macro-admin.ftl">
<@admin "video">
<div class="content">
    <div class="module">
        <div class="module-header">
            <h2>${videoDesc}</h2>
        </div>
        <div class="module-panel form">
            <div class="fn-clear">
                <#if permissions["adminAddVideo"].permissionGrant>
                    <a class="btn red" onclick="viewIframe('${servePath}/admin/add-video-file')">${adminAddVideoPermissionLabel}</a>
                </#if>
            </div>
        </div>
        <div class="module-header">
            <h2>${modifiableLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <form action="${servePath}/video/add-video" method="POST">
                <label for="videoTitle">${videoTitle}</label>
                <input name="videoTitle" type="text" value="${video.videoTitle}"/>

                <label for="videoTag">${videoTag}</label>
                <input name="videoTag" type="text" value="${video.vidoeTag}"/>

                <label for="videoRemarks">${videoRemarks}</label>
                <input name="videoRemarks" type="text" value="${video.videoRemarks}"/>

                <label for="videoType">${videoType}</label>
                <input name="videoType" type="text" value="${video.videoType}"/>

                <label>${videoStatus}</label>
                <select id="videoStatus" name="videoStatus">
                    <option value="0"<#if 0 == video.videoStatus> selected</#if>>${noLabel}</option>
                    <option value="1"<#if 1 == video.videoStatus> selected</#if>>${yesLabel}</option>
                </select>

                <br/><br/>
                <button type="submit" class="green fn-right">${submitLabel}</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function viewIframe(href){
        layer.open({
            type: 2,
            title: '上传视频',
            maxmin: true,
            area: ['800px', '500px'],
            shadeClose: true,
            content: href
        });
    }
</script>
<script src="${staticServePath}/js/lib/jquery/jquery-3.1.0.min.js"></script>
<script src="${staticServePath}/js/lib/layer/layer/layer.js"></script>
</@admin>
