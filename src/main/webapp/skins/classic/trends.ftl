<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${trendsLabel} - ${symphonyLabel}">
        <meta name="description" content="${symphonyLabel} ${trendVideosLabel},${symphonyLabel} ${coldVideosLabel}"/>
        </@head>
        <link rel="canonical" href="${servePath}/trends">
            <link href="${staticServePath}/js/lib/trends/baguetteBox/css/bootstrap.css" rel="stylesheet">
            <link rel="stylesheet" href="${staticServePath}/js/lib/trends/baguetteBox/css/baguetteBox.min.css">
            <link rel="stylesheet" href="${staticServePath}/js/lib/trends/baguetteBox/css/gallery-grid.css">
    </head>
    <body>
        <#include "header.ftl">
        <div class="main">
            <div class="wrapper">
                <div class="content">
                    <div class="module">
                        <div class="module-header">
                            <h2>
                                ${trendsHotLabel}
                            </h2>
                        </div>
                        <div class="module-panel list">
                            <div class="container gallery-container" style="width: 80%;margin-left: 10%;margin-top: 3%;">
                                <div class="article-info fn-flex" style="margin-left: 2%;margin-top: 2%">
                                    <a rel="author" href="${servePath}/trends/">
                                        <div class="avatar-mid tooltipped tooltipped-se" aria-label="秦仪真" style="background-image:url('${staticServePath}/js/lib/trends/baguetteBox/images/park.jpg')">

                                        </div>
                                    </a>
                                    <div class="fn-flex-1 fn-ellipsis" style="margin-top: -2%;">
                                        <a rel="author" href="${servePath}/trends/" class="ft-gray"><strong class="ft-gray">秦仪真</strong></a>

                                        <br/>

                                        <span class="ft-gray">${symphonyLabel} 1 ${numVIPLabel}</span>

                                        <br/>
                                        <span class="ft-gray">
                                            <a rel="nofollow" class="ft-gray" href="#comments">
                                                <b class="article-level<#if 10 lt 40>${(10/10)?int}<#else>4</#if>">10</b> ${cmtLabel}</a>
                                            &nbsp;•&nbsp;
                                            <span class="article-level<#if 10 lt 400>${(10/100)?int}<#else>4</#if>">
                                            <#if 10 < 1000>
                                            10
                                             <#else>
                                            10
                                            </#if>
                                            </span>
                                                    ${viewLabel}
                                            &nbsp;•&nbsp;
                                                    2天前
                                        </span>
                                    </div>
                                </div>
                                <div class="content-reset article-content" style="margin-left: 13%;margin-right: 3%;margin-bottom: 0%;margin-top: 2%;">
                                    哈哈哈嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或
                                    嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或对对对
                                    嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或哈哈哈
                                </div>
                                <div class="tz-gallery" style="margin-left: 10%;">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/park.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/park.jpg" alt="Park">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/bridge.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/bridge.jpg" alt="Bridge">
                                            </a>
                                        </div>
                                        <div class="col-sm-12 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/tunnel.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/tunnel.jpg" alt="Tunnel">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/coast.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/coast.jpg" alt="Coast">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/rails.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/rails.jpg" alt="Rails">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/traffic.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/traffic.jpg" alt="Traffic">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/rocks.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/rocks.jpg" alt="Rocks">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="${staticServePath}/js/lib/trends/baguetteBox/lightbox" href="images/benches.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/benches.jpg" alt="Benches">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/sky.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/sky.jpg" alt="Sky">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="container gallery-container" style="width: 80%;margin-left: 10%;margin-top: 3%;">
                                <div class="article-info fn-flex" style="margin-left: 2%;margin-top: 2%">
                                    <a rel="author" href="${servePath}/trends/">
                                        <div class="avatar-mid tooltipped tooltipped-se" aria-label="秦仪真" style="background-image:url('${staticServePath}/js/lib/trends/baguetteBox/images/park.jpg')">

                                        </div>
                                    </a>
                                    <div class="fn-flex-1 fn-ellipsis" style="margin-top: -2%;">
                                        <a rel="author" href="${servePath}/trends/" class="ft-gray"><strong class="ft-gray">秦仪真</strong></a>

                                        <br/>

                                        <span class="ft-gray">${symphonyLabel} 1 ${numVIPLabel}</span>

                                        <br/>
                                        <span class="ft-gray">
                                            <a rel="nofollow" class="ft-gray" href="#comments">
                                                <b class="article-level<#if 10 lt 40>${(10/10)?int}<#else>4</#if>">10</b> ${cmtLabel}</a>
                                            &nbsp;•&nbsp;
                                            <span class="article-level<#if 10 lt 400>${(10/100)?int}<#else>4</#if>">
                                            <#if 10 < 1000>
                                                10
                                            <#else>
                                                10
                                            </#if>
                                            </span>
                                        ${viewLabel}
                                            &nbsp;•&nbsp;
                                                    2天前
                                        </span>
                                    </div>
                                </div>
                                <div class="content-reset article-content" style="margin-left: 13%;margin-right: 3%;margin-bottom: 0%;margin-top: 2%;">
                                    哈哈哈嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或
                                    嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或对对对
                                    嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或哈哈哈
                                </div>
                                <div class="tz-gallery" style="margin-left: 10%;">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/park.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/park.jpg" alt="Park">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/bridge.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/bridge.jpg" alt="Bridge">
                                            </a>
                                        </div>
                                        <div class="col-sm-12 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/tunnel.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/tunnel.jpg" alt="Tunnel">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/coast.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/coast.jpg" alt="Coast">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/rails.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/rails.jpg" alt="Rails">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/traffic.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/traffic.jpg" alt="Traffic">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/rocks.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/rocks.jpg" alt="Rocks">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="${staticServePath}/js/lib/trends/baguetteBox/lightbox" href="images/benches.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/benches.jpg" alt="Benches">
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <a class="lightbox" href="${staticServePath}/js/lib/trends/baguetteBox/images/sky.jpg">
                                                <img src="${staticServePath}/js/lib/trends/baguetteBox/images/sky.jpg" alt="Sky">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>
                    </div>
                </div>
                <div class="side">
                <#include 'common/person-info.ftl'/>
                    <div class="module">
                        <div class="module-header">
                            <h2>
                            ${trendsColdLabel}
                            </h2>
                        </div>
                        <div class="module-panel list">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <#include "footer.ftl">
        <script type="text/javascript" src="${staticServePath}/js/lib/trends/baguetteBox/js/baguetteBox.min.js"></script>
        <script type="text/javascript">
            baguetteBox.run('.tz-gallery');
        </script>
    </body>
</html>
