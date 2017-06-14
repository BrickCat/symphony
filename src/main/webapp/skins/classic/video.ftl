<#include "macro-head.ftl">
<#include "macro-pagination-query.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${video.videoTitle} - ${symphonyLabel}">
        <meta name="keywords" content="${video.videoTag}" />
        <meta name="description" content="${video.videoRemarks}"/>
        </@head>
        <link rel="stylesheet" href="${staticServePath}/js/lib/highlight.js-9.6.0/styles/github.css">
        <link rel="stylesheet" href="${staticServePath}/css/index.css?${staticResourceVersion}" />
        <link rel="stylesheet" href="${staticServePath}/js/lib/editor/codemirror.min.css?${staticResourceVersion}">

        <!-- Open Graph -->
        <meta property="og:locale" content="zh_CN" />
        <meta property="og:type" content="article" />
        <meta property="og:title" content="${video.videoTitle} - ${symphonyLabel}" />
        <meta property="og:description" content="${video.videoRemarks}" />
        <meta property="og:image" content="${video.videoImgPath}" />
        <meta property="og:url" content="${servePath}${video.videoUrl}" />
        <meta property="og:site_name" content="BrickCat" />
        <!-- Twitter Card -->
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:description" content="${video.videoRemarks}" />
        <meta name="twitter:title" content="${video.videoTitle} - ${symphonyLabel}" />
    </head>
    <body itemscope itemtype="http://schema.org/Product" class="article">

        <#include "header.ftl">


    </body>
</html>
