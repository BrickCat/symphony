<#include "macro-admin.ftl">
<@admin "addProduct">
<div class="content" xmlns="http://www.w3.org/1999/html">
    <link href="${staticServePath}/js/lib/webuploader/webuploader.css" type="text/css">
    <div class="module">
        <div class="module-header">
            <h2>${mallIamgeUtilLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <button type="button" class="green fn-left" onclick="corpper()">${mallIamgeUtil}</button>
        </div>
    </div>
    <div class="module">
        <div class="module-header">
            <h2>${mallProductCoverLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">

        </div>
    </div>
</div>
<script src="${staticServePath}/js/lib/jquery/jquery.min.js"></script>
<script src="${staticServePath}/js/lib/layer/layer/layer.js"></script>
<script type="text/javascript">
    function corpper() {
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
        layer.ready(function() {
            layer.open({
                type: 2,
                title: '修图小工具',
                maxmin: true,
                area: ['100%', '100%'],
                content: '${nginxHost}:${nginxProt}/photo-editor/'
            });
        });
    }
</script>
</@admin>
