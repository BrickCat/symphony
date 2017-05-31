<#include "macro-admin.ftl">
<@admin "video">
<div class="content">
    <div class="module">
        <div class="module-header">
            <h2>${modifiableLabel}</h2>
        </div>

        <div class="module-panel form fn-clear">
            <form class="fn-right form" action="${servePath}/upload?type=1" method="POST" enctype="multipart/form-data">
                <label for="videoTitle">${videoTitle}</label>
                <input name="videoTitle" type="text"/>

                <label for="videoTag">${videoTag}</label>
                <input name="videoTag" type="text"/>

                <label for="videoRemarks">${videoRemarks}</label>
                <input name="videoRemarks" type="text"/>

                <label for="videoType">${videoType}</label>
                <input name="videoType" type="text"/>

                <label>${videoStatus}</label>
                <div style="margin-left: 10%">
                    <label><input name="videoStatus" type="radio" value="0" checked="checked" />${videoStatusTrue}&nbsp;&nbsp;</label>
                    <label><input name="videoStatus" type="radio" value="1" />${videoStatusFalse}</label>
                </div>
                <br/><br/><br/>
                <label class="btn red">
                    ${videoURl}<input type="file" name="file">
                </label>
                <br/><br/><br/>
                <button type="submit" class="green fn-right">${submitLabel}</button>
            </form>
        </div>
    </div>
</div>
</@admin>
