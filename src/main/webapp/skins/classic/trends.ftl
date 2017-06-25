<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${videoLabel} - ${symphonyLabel}">
        <meta name="description" content="${symphonyLabel} ${trendVideosLabel},${symphonyLabel} ${coldVideosLabel}"/>
        </@head>
        <link rel="canonical" href="${servePath}/videos">
        <link type="text/css" href="${staticServePath}/js/lib/trends/slideshow.css" rel="stylesheet" />
            <style type="text/css">
                .mySlideWrap{ height: 300px; width: 500px; margin-left: auto; margin-right: auto; margin-top: 100px; }
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
                            <div  class="mySlideWrap"><div id='mysite-slideshow'></div></div>

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
        <script src="${staticServePath}/js/lib/trends/jquery.min.js" type="text/javascript"></script>
        <script src="${staticServePath}/js/lib/trends/slideshow-jq.js" type="text/javascript"></script>
        <script type="text/javascript">
            (function($){
                function init(){
                    wSlideshow.render({
                        elementID:"mysite",//Dom 渲染的容器
                        nav:"double_thumbnails",//看你是否需要有导航功能如果参数配置参数:[none,double_thumbnails] 则会显示图片导航条
                        navLocation:"left", //自定标题的位置参数:[top,bottomm,left,right]
                        captionLocation:"bottom",//自定标题的位置参数:[top,bottom]
                        transition:"fade",//自定效果参数:[top,bottom]slide fade]
                        autoplay:"1",//自定义auto play 的次数
                        speed:"5",
                        aspectRatio:"auto",
                        showControls:"true",
                        randomStart:"false",
                        images:[
                            {"url":"${staticServePath}/js/lib/trends/images/5568730.jpg","width":"332","height":"250","caption":"Foreign staff, Chinese Imperial Maritime Customs, Tientsin, 1877 or 1878 Photographed by William Francis Stevenson Collected by Peter Hodge"},
                            {"url":"${staticServePath}/js/lib/trends/images/1676626.jpg","width":"332","height":"250","caption":"The Bund, Shanghai, 1890s Photographed by William Francis Stevenson Collected by Peter Hodge"},
                            {"url":"${staticServePath}/js/lib/trends/images/6765636.jpg","width":"332","height":"250","caption":"Chinese farmers collected by http://www.jq22.com"},
                            {"url":"${staticServePath}/js/lib/trends/images/4735676.jpg","width":"332","height":"250","caption":"Chinese coolie collected by http://www.jq22.com"},
                            {"url":"${staticServePath}/js/lib/trends/images/474001.jpg","width":"332","height":"250","caption":"The Bund, Shanghai, 1890s Photographed by William Francis Stevenson Collected by Peter Hodge"},
                            {"url":"${staticServePath}/js/lib/trends/images/5145203.jpg","width":"332","height":"250","caption":"Chinese empress in Qing Dynasty collected by http://www.jq22.com"},
                            {"url":"${staticServePath}/js/lib/trends/images/1363237.jpg","width":"332","height":"250","caption":"Nanking Road, Shanghai, looking towards the Bund, 1890s Photographed by William Francis Stevenson Collected by Peter Hodge"},
                            {"url":"${staticServePath}/js/lib/trends/images/652076.jpg","width":"332","height":"250","caption":"Chinese emperor in Qing Dynasty collected by http://www.jq22.com"},
                            {"url":"${staticServePath}/js/lib/trends/images/7168681.jpg","width":"332","height":"250","caption":"Chinese women raising cocoons collected by http://www.jq22.com"}
                        ]//定义图片url caption widh height
                    })
                }
                $ ? $(init) : document.observe('dom:loaded', init)
            })(window._W && _W.$)
        </script>
    </body>
</html>
