<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
    <link rel="stylesheet" href="${staticServePath}/js/lib/typeahead/bootstrap.min.css" />
    <link href="${staticServePath}/js/lib/typeahead/jquery.typeahead.css">
    <div style="width: 100%;">
        <div class="js-result-container"></div>
        <form class="bs-example bs-example-form" target="_top">
            <div class="typeahead__container" style="width: 60%;margin-left: 20%; border-radius: 3px;margin-top: 10%;">
                <div class="typeahead__field">
                    <span class="typeahead__query">
                    <input class="js-typeahead form-control"
                           name="key"
                           type="search"
                           autofocus
                           autocomplete="off" id="search" placeholder="Search BrickCat">

                </div>
            </div>
        </form>
    </div>
    <script src="${staticServePath}/js/lib/jquery/jquery.min.js"></script>
    <script src="${staticServePath}/js/lib/typeahead/jquery.typeahead.js"></script>
    <script type="text/javascript">
        //文章
        var dataA;
        //视频
        var dataV;
        //圈子
        var dataT;
        $.ajax({
                url: "${servePath}/search/all",
                type: "GET",
                async:false,
                data: "",
                success: function (result, textStatus) {
                    dataA = result.data.articles;
                    dataV = result.data.videos;
                    dataT = result.data.trends;
                },
                error: function (result) {
                },
                complete: function () {
                }
            });
            typeof $.typeahead === 'function' && $.typeahead({
                input: '.js-typeahead',
                minLength: 0,
                maxItem: 10,
                order: "asc",
                dynamic: true,
                delay: 500,
                backdrop: {
                    "background-color": "#fff"
                },
                template: function (query, item) {

                    return '<div class="row" style="border-bottom:1px dashed #CFCFCF;border-left:1px dashed #CFCFCF;border-right:1px dashed #CFCFCF;border-radius:3px;">' +
                            '<img style="width: 40px;height: 40px;" src="{{articleAuthorThumbnailURL48}}">' +
                            '<span style="margin-left:10px;font-size:14px;color:#000;font-weight: bold;">{{articleTitle}}</span>' +
                            "</div>"
                },
                emptyTemplate: "找不到【{{query}}】的匹配项~",
                source: {
                    article: {
                        display: "articleTitle",
                        data:dataA
                    },
                    video:{
                        display: "articleTitle",
                        data:dataV
                    }
                },
                callback: {
                    onClick: function (node, a, item, event) {
                        if(item.type == 0){
                            top.location.href = '${servePath}/article/' + item.oId;
                        }else {
                            top.location.href = '${servePath}/video/front/'+item.oId+'/show-video';
                        }

                        $('#search').val('');
                    }
                },
                debug: true
            });
        document.onkeydown = function (event) {
            var target,code,tag;
            if(!event){
                event = window.event;
                target = event.srcElement;
                code = event.keyCode;
                if(code == 13){
                    tag = target.tagName;
                    if(tag == "TEXTAREA"){return true;}
                    else {return false;}
                }
            }else {
                target = event.target;
                code = event.keyCode;
                if(code == 13){
                    tag = target.tagName;
                    if(tag == "INPUT"){return false;}
                    else {return true;}
                }
            }
        }
    </script>
    </body>
</html>
