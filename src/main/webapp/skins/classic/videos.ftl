<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${videoLabel} - ${symphonyLabel}">
        <meta name="description" content="${symphonyLabel} ${trendVideosLabel},${symphonyLabel} ${coldVideosLabel}"/>
        </@head>
        <link rel="stylesheet" href="${staticServePath}/css/index.css?${staticResourceVersion}" />
        <link rel="canonical" href="${servePath}/videos">
        <link rel="stylesheet" href="${staticServePath}/js/lib/waterfall/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="${staticServePath}/js/lib/waterfall/css/default.css">
            <style type="text/css">
                #gallery-wrapper {
                    position: relative;
                    max-width: 75%;
                    width: 75%;
                    margin: 50px auto;
                }

                img.thumb {
                    width: 100%;
                    max-width: 100%;
                    height: auto;
                }

                .white-panel {
                    position: absolute;
                    background: white;
                    border-radius: 5px;
                    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
                    padding: 10px;
                }

                .white-panel h1 {
                    font-size: 1em;
                }

                .white-panel h1 a {
                    color: #A92733;
                }

                .white-panel:hover {
                    box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
                    margin-top: -5px;
                    -webkit-transition: all 0.3s ease-in-out;
                    -moz-transition: all 0.3s ease-in-out;
                    -o-transition: all 0.3s ease-in-out;
                    transition: all 0.3s ease-in-out;
                }
            </style>
    </head>
    <body>
        <#include "header.ftl">
        <div class="main">
            <div class="wrapper">
                <div class="content">
                    <div class="module">
                        <div class="module-header">
                            <h2>
                                ${trendVideosLabel}
                            </h2>
                        </div>
                        <div class="module-panel list">
                            <section id="gallery-wrapper">


                            </section>
                               <#-- <#list videos as video>
                                <li class="fn-flex">
                                    <#if video.videoUrl!="">
                                    <div class="avatar" style="background-image:url('${staticServePath}/images/tags/${tag.tagIconPath}')" alt="${video.videoTitle}"></div>
                                    </#if>
                                    <div class="fn-flex-1">
                                        <div class="fn-clear">
                                            <h3 class="fn-left"><a rel="tag" class="ft-a-title" href="${servePath}/tag/${tag.tagURI}">${tag.tagTitle}</a></h3>
                                            <span class="ft-gray fn-right">
                                                ${referenceLabel} ${tag.tagReferenceCount?c} &nbsp;
                                                ${cmtLabel} ${tag.tagCommentCount?c}
                                            </span>
                                        </div>
                                        <div class="content-reset">${tag.tagDescription}</div>
                                    </div>
                                </li>
                                </#list>-->

                        </div>
                    </div>
                </div>
                <div class="side">
                    <#include 'common/person-info.ftl'/>
                    <div class="module">
                        <div class="module-header">
                            <h2>
                                ${coldVideosLabel}
                            </h2>
                        </div>
                        <div class="module-panel list">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <#include "footer.ftl">
        <script src="${staticServePath}/js/lib/waterfall/js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script>
            window.jQuery || document.write('<script src="${staticServePath}/js/lib/waterfall/js/jquery-1.11.0.min.js"><\/script>')
        </script>
        <script src="${staticServePath}/js/lib/waterfall/js/pinterest_grid.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#gallery-wrapper").pinterest_grid({
                    no_columns: 4,
                    padding_x: 10,
                    padding_y: 10,
                    margin_bottom: 50,
                    single_column_breakpoint: 700
                });

            });
            var isScroll = false;
            var p = 1;
            window.onload = function(){
                $.ajax({
                    type: "POST",
                    url: Label.servePath + '/video/front/videos?p=' + 1,
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    },
                    success: function (result, textStatus) {
                        var html = '';
                        for (var i = 0; i < result.videos.length; i++) {
                            html += '<article class="white-panel">'
                                    + '<img src="${staticServePath}/js/lib/waterfall/img/1.jpg" class="thumb">'
                                    + '<h1><a href="#">'+result.videos[i].videoTitle+'</a></h1>'
                                    + '<p>'+result.videos[i].videoRemarks+'</p>'
                                    + '</article>';
                        }
                        $("#gallery-wrapper").html(html);
                        p++;
                    }
                });
            }
            var waterFull = '';
            window.onscroll = function getMore(){
                //下面这句主要是获取网页的总高度，主要是考虑兼容性所以把Ie支持的documentElement也写了，这个方法至少支持IE8
                var htmlHeight=document.body.scrollHeight||document.documentElement.scrollHeight;
                //clientHeight是网页在浏览器中的可视高度，
                var clientHeight=document.body.clientHeight||document.documentElement.clientHeight;
                //scrollTop是浏览器滚动条的top位置，
                var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
                //通过判断滚动条的top位置与可视网页之和与整个网页的高度是否相等来决定是否加载内容；
                if((scrollTop+clientHeight)==htmlHeight) {
                    $.ajax({
                        type: "POST",
                        url: Label.servePath + '/video/front/videos?p=' + p,
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                        },
                        success: function (result, textStatus) {
                            var html = '';
                            for (var i = 0; i < result.videos.length; i++) {
                                html += '<article class="white-panel">'
                                        + '<img src="${staticServePath}/js/lib/waterfall/img/1.jpg" class="thumb">'
                                        + '<h1><a href="#">'+result.videos[i].videoTitle+'</a></h1>'
                                        + '<p>'+result.videos[i].videoRemarks+'</p>'
                                        + '</article>';
                            }
                            waterFull+= html;
                            $("#gallery-wrapper").html(waterFull);
                            p++;
                        }
                    });
                }
            }
        </script>
    </body>
</html>
