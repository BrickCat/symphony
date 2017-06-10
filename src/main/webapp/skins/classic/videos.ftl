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
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/1.jpg" class="thumb">
                                    <h1><a href="#">Title 1</a></h1>
                                    <p>Description 1</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/2.jpg" class="thumb">
                                    <h1><a href="#">Title 2</a></h1>
                                    <p>Description 2</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/3.jpg" class="thumb">
                                    <h1><a href="#">Title 3</a></h1>
                                    <p>Description 3</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/4.jpg" class="thumb">
                                    <h1><a href="#">Title 4</a></h1>
                                    <p>Description 4</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/5.jpg" class="thumb">
                                    <h1><a href="#">Title 5</a></h1>
                                    <p>Description 5</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/6.jpg" class="thumb">
                                    <h1><a href="#">Title 6</a></h1>
                                    <p>Description 6</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/7.jpg" class="thumb">
                                    <h1><a href="#">Title 7</a></h1>
                                    <p>Description 7</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/8.jpg" class="thumb">
                                    <h1><a href="#">Title 8</a></h1>
                                    <p>Description 8</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/9.jpg" class="thumb">
                                    <h1><a href="#">Title 9</a></h1>
                                    <p>Description 9</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/10.jpg" class="thumb">
                                    <h1><a href="#">Title 10</a></h1>
                                    <p>Description 10</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/11.jpg" class="thumb">
                                    <h1><a href="#">Title 11</a></h1>
                                    <p>Description 11</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/12.jpg" class="thumb">
                                    <h1><a href="#">Title 12</a></h1>
                                    <p>Description 12</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/13.jpg" class="thumb">
                                    <h1><a href="#">Title 13</a></h1>
                                    <p>Description 13</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/14.jpg" class="thumb">
                                    <h1><a href="#">Title 14</a></h1>
                                    <p>Description 14</p>
                                </article>
                                <article class="white-panel">
                                    <img src="${staticServePath}/js/lib/waterfall/img/15.jpg" class="thumb">
                                    <h1><a href="#">Title 15</a></h1>
                                    <p>Description 15</p>
                                </article>
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
                            </ul>
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
                        <div class="module-panel">
                            <ul class="module-list">
                                <#--<#list coldTags as tag>
                                <li>
                                    <#if tag.tagIconPath!="">
                                    <div class="avatar-small" style="background-image: url('${staticServePath}/images/tags/${tag.tagIconPath}')" alt="${tag.tagTitle}"></div>
                                    </#if>
                                    <a class="ft-a-title" rel="tag" href="${servePath}/tag/${tag.tagURI}">${tag.tagTitle}</a>
                                    <div class="content-reset">${tag.tagDescription}</div>
                                </li>
                                </#list>-->
                            </ul>
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
        </script>
    </body>
</html>
