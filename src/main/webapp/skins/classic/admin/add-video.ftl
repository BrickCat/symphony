<#include "macro-admin.ftl">
<@admin "video">
<div class="content">
    <div class="module">
        <div class="module-header">
            <h2>${videoAdd}</h2>
        </div>

        <div class="module-panel form fn-clear">
            <form class="fn-right form" action="${servePath}/upload?type=1" method="POST" enctype="multipart/form-data">
                <label for="videoTitle">${videoTitle}</label>
                <input name="videoTitle" type="text"/>

                <label for="videoTag">${videoTag}</label>
                <input name="videoTag" type="text"/>

                <label for="videoRemarks">${videoRemarks}</label>
                <textarea name="videoRemarks" rows="5"></textarea>

                <label for="videoType">${videoType}</label>
                <select id="videoType" name="videoType">
                    <option value="0" >${videoTypeTrue}</option>
                    <option value="1" >${videoTypeFalse}</option>
                </select>

                <label for="videoPoint">${videoPoint}</label>
                <input name="videoPoint" type="number" value="0"/>

                <label>${videoStatus}</label>
                <select id="videoStatus" name="videoStatus">
                    <option value="0" >${videoStatusTrue}</option>
                    <option value="1" >${videoStatusFalse}</option>
                </select>
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
