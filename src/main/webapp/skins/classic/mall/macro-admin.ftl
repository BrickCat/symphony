<#macro admin type>
<#include "../macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <#if type == "index">
        <@head title="${mallAdminIndexLabel} - ${symphonyLabel}"></@head>
        </#if>
        <#if type == "product">
        <@head title="${mallAdminProductLabel} - ${symphonyLabel}"></@head>
        </#if>
        <#if type == "addProduct">
        <@head title="${mallAddProductLabel} - ${symphonyLabel}"></@head>
        </#if>

        <link rel="stylesheet" href="${staticServePath}/css/home.css?${staticResourceVersion}" />
    </head>
    <body>
        <#include "../header.ftl">
        <div class="main">
            <div class="wrapper">
                <#nested>
                <div class="side">
                    <div class="module">
                        <div class="module-panel fn-oh">
                            <nav class="home-menu">
                                <#if permissions["menuAdmin"].permissionGrant>
                                <a href="${servePath}/admin/mall"<#if type == "index"> class="current"</#if>>${mallAdminIndexLabel}</a>
                                </#if>
                                <#if permissions["menuAdminProduct"].permissionGrant>
                                <a href="${servePath}/admin/mall/products"<#if type == "product" || type == "addProduct"> class="current"</#if>>${mallAdminProductLabel}</a>
                                </#if>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <#include "../footer.ftl">
        <#if type == "comments">
        <script src="${staticServePath}/js/settings${miniPostfix}.js?${staticResourceVersion}"></script>
        <script>
            Settings.initHljs();
        </script>
        </#if>
    </body>
</html>
</#macro>
