<#include "macro-admin.ftl">
<@admin "video">
<div class="content">
    <div class="module">
        <div class="module-header">
            <h2>${videoDesc}</h2>
        </div>
        <div class="module-panel form">
            <div class="fn-clear">
                <form class="fn-left" method="POST" enctype="multipart/form-data">
                    <label class="btn green">
                    ${videoURl}<input type="file" name="file">
                    </label>
                </form>
            </div>
        </div>
        <div class="module-header">
            <h2>${modifiableLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <form action="${servePath}/admin/ad/side" method="POST">
                <label for="videoTitle">${videoTitle}</label>
                <input name="videoTitle" type="text"/>

                <label for="videoTag">${videoTag}</label>
                <input name="videoTag" type="text"/>

                <label for="videoRemarks">${videoRemarks}</label>
                <input name="videoRemarks" type="text"/>

                <label for="videoType">${videoType}</label>
                <input name="videoType" type="text"/>

                <label for="videoStatus">${videoStatus}</label>
                <input name="videoTitle" type="text"/>

                <br/><br/>
                <button type="submit" class="green fn-right">${submitLabel}</button>
            </form>
        </div>
    </div>
</div>
</@admin>
