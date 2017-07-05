<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${mindLabel} - ${symphonyLabel}">
        <meta http-equiv="Access-Control-Allow-Origin" content="*">
        </@head>
            <!-- bower:css -->
            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/bootstrap/dist/css/bootstrap.css" />
            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/codemirror/lib/codemirror.css" />
            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/hotbox/hotbox.css" />
            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/kityminder-core/dist/kityminder.core.css" />
            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/color-picker/dist/color-picker.min.css" />
            <!-- endbower -->

            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/kityminder.editor.min.css">

            <style>


                h1.editor-title {
                    background: #dd5044;
                    color: white;
                    margin: 0;
                    margin-left: 4%;
                    height: 48px;
                    font-size: 14px;
                    line-height: 38px;
                    font-weight: normal;
                }

                div.minder-editor-container {
                    position: absolute;
                    top: 48px;
                    bottom: 0;
                    left: 0;
                    right: 0;
                }
            </style>
            <link rel="stylesheet" type="text/css" href="${staticServePath}/js/lib/kitymind/bower_components/jquery-nav/css/default.css">
            <link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/jquery-nav/css/style.min.css">
    </head>
    <body>
        <div id="wrapper" class="wrappermind" style="background: #dd5044;">
            <div ng-app="kityminderDemo" ng-controller="MainController">
                <h1 class="editor-title" >
                    <#include "header.ftl">
                </h1>
                <kityminder-editor on-init="initEditor(editor, minder)" data-theme="fresh-green"></kityminder-editor>
                <div style="width: auto;height: 35px;background-color: #ffffff">
                    <input id="mindId" value="" hidden="hidden"/>
                </div>
            </div>
        </div>
        <button id="mm-menu-toggle" class="mm-menu-toggle"></button>
        <nav id="mm-menu" class="mm-menu">
            <div class="mm-menu__header">
                <h2 class="mm-menu__title">${operationMindLabel}</h2>
            </div>
            <ul class="mm-menu__items">
                <li class="mm-menu__item">
                    <a class="mm-menu__link input" href="#">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;<span class="icon-upload"></span>&nbsp;&nbsp;${uoloadMind}<input type="file" id="fileInput"></span>
                    </a>
                </li>
                <li class="mm-menu__item">
                    <a class="mm-menu__link export" href="#" data-type="json">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;${mindJsonExportIcon}&nbsp;&nbsp;${exportJsonMind}</span>
                    </a>
                </li>
                <li class="mm-menu__item">
                    <a class="mm-menu__link export" href="#" data-type="md">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;${mindMdExportIcon}&nbsp;&nbsp;${exportMdMind}</span>
                    </a>
                </li>
                <li class="mm-menu__item">
                    <a class="mm-menu__link export" href="#" data-type="km">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;${mindKmEXportIcon}&nbsp;&nbsp;${exporpKmMind}</span>
                    </a>
                </li>
                <li class="mm-menu__item">
                    <a class="mm-menu__link export" href="#javascript:getmind('1499254275899')" data-type="km">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;${mindKmEXportIcon}&nbsp;&nbsp;${exporpKmMind}</span>
                    </a>
                </li>
            </ul>
        </nav>
    </body>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/jquery-nav/js/production/materialMenu.min.js"></script>
    <!-- bower:js -->
    <script src="${staticServePath}/js/lib/kitymind/bower_components/jquery/dist/jquery.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/angular/angular.min.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/lib/codemirror.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/mode/xml/xml.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/mode/javascript/javascript.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/mode/css/css.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/mode/htmlmixed/htmlmixed.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/mode/markdown/markdown.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/addon/mode/overlay.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/codemirror/mode/gfm/gfm.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/angular-ui-codemirror/ui-codemirror.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/marked/lib/marked.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/kity/dist/kity.min.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/hotbox/hotbox.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/json-diff/json-diff.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/kityminder-core/dist/kityminder.core.min.js"></script>
    <script src="${staticServePath}/js/lib/kitymind/bower_components/color-picker/dist/color-picker.min.js"></script>
    <!-- endbower -->
    <script src="${staticServePath}/js/lib/compress/libs.min.js?${staticResourceVersion}"></script>
    <script src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}"></script>
    <script src="${staticServePath}/js/lib/kitymind/kityminder.editor.min.js"></script>
    <#--<script src="${staticServePath}/js/lib/kitymind/diy.js"></script>-->
    <script>
        var Label = {
            invalidPasswordLabel: "${invalidPasswordLabel}",
            loginNameErrorLabel: "${loginNameErrorLabel}",
            followLabel: "${followLabel}",
            unfollowLabel: "${unfollowLabel}",
            symphonyLabel: "${symphonyLabel}",
            visionLabel: "${visionLabel}",
            cmtLabel: "${cmtLabel}",
            collectLabel: "${collectLabel}",
            uncollectLabel: "${uncollectLabel}",
            desktopNotificationTemplateLabel: "${desktopNotificationTemplateLabel}",
            servePath: "${servePath}",
            staticServePath: "${staticServePath}",
            isLoggedIn: ${isLoggedIn?c},
            funNeedLoginLabel: '${funNeedLoginLabel}',
            notificationCommentedLabel: '${notificationCommentedLabel}',
            notificationReplyLabel: '${notificationReplyLabel}',
            notificationAtLabel: '${notificationAtLabel}',
            notificationFollowingLabel: '${notificationFollowingLabel}',
            pointLabel: '${pointLabel}',
            sameCityLabel: '${sameCityLabel}',
            systemLabel: '${systemLabel}',
            newFollowerLabel: '${newFollowerLabel}',
            makeAsReadLabel: '${makeAsReadLabel}',
            checkIcon: '${checkIcon}'<#if isLoggedIn>,
            currentUserName: '${currentUser.userName}'</#if>
        };

        <#if isLoggedIn>
        Label.userKeyboardShortcutsStatus = '${currentUser.userKeyboardShortcutsStatus}';
        </#if>

        Util.init(${isLoggedIn?c});

        <#if isLoggedIn>
        // Init [User] channel
        Util.initUserChannel("${wsScheme}://${serverHost}:${serverPort}${contextPath}/user-channel");
        </#if>

        <#if mouseEffects>
        Util.mouseClickEffects();
        </#if>
    </script>
    <#if algoliaEnabled>
    <script src="${staticServePath}/js/lib/algolia/algolia.min.js"></script>
    <script>
        Util.initSearch('${algoliaAppId}', '${algoliaSearchKey}', '${algoliaIndex}');
    </script>
    </#if>
    <script>
        var menu = new Menu;
        angular.module('kityminderDemo', ['kityminderEditor'])
                .controller('MainController', function($scope) {
                    $scope.initEditor = function(editor, minder) {
                        window.editor = editor;
                        window.minder = minder;
                    };
                });

        (function() {
            var oldData;
            $('.input').css({
                'overflow': 'hidden',
                'position': 'relative',
            }).find('input').css({
                cursor: 'pointer',
                position: 'absolute',
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                display: 'inline-block',
                opacity: 0
            });
            //$('.export').css('cursor', 'not-allowed');

            $(document).on('mouseover', '.export', function(event) {
                // 链接在hover的时候生成对应数据到链接中
                event.preventDefault();
                var $this = $(this),
                        type = $this.data('type'),
                        exportType;
                switch (type) {
                    case 'km':
                        exportType = 'json';
                        break;
                    case 'md':
                        exportType = 'markdown';
                        break;
                    default:
                        exportType = type;
                        break;
                }
                if (JSON.stringify(oldData) == JSON.stringify(editor.minder.exportJson())) {
                    return;
                } else {
                    oldData = editor.minder.exportJson();
                }

                editor.minder.exportData(exportType).then(function(content) {
                    switch (exportType) {
                        case 'json':
                            console.log($.parseJSON(content));
                            break;
                        default:
                            console.log(content);
                            break;
                    }
                    $this.css('cursor', 'pointer');
                    var blob = new Blob([content]),
                            url = URL.createObjectURL(blob);
                    var aLink = $this[0];
                    aLink.href = url;
                    aLink.download = $('#node_text1').text() + '.' + type;
                });
            }).on('mouseout', '.export', function(event) {
                // 鼠标移开是设置禁止点击状态，下次鼠标移入时需重新计算需要生成的文件
                event.preventDefault();
               /* $(this).css('cursor', 'not-allowed');*/
            }).on('click', '.export', function(event) {
                // 禁止点击状态下取消跳转
                var $this = $(this);
                if ($this.css('cursor') == 'not-allowed') {
                    event.preventDefault();
                }
            });

            // 导入
            window.onload = function() {
                var fileInput = document.getElementById('fileInput');

                fileInput.addEventListener('change', function(e) {
                    var file = fileInput.files[0],
                            // textType = /(md|km)/,
                            fileType = file.name.substr(file.name.lastIndexOf('.') + 1);
                    switch (fileType) {
                        case 'md':
                            fileType = 'markdown';
                            break;
                        case 'km':
                        case 'json':
                            fileType = 'json';
                            break;
                        default:
                            console.log("File not supported!");
                            alert('只支持.km、.md、.json文件');
                            return;
                    }
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var content = reader.result;
                        editor.minder.importData(fileType, content).then(function(data) {
                            $(fileInput).val('');
                        });
                    }
                    reader.readAsText(file);
                });
            }
            $(window).keydown(function (event) {
                if(!(event.which == 83 && event.ctrlKey))return true;
                addOrUpdate(editor.minder.exportJson(),event);
                event.preventDefault();
                return false;
            });
        })();
        function addOrUpdate(mindJson,event) {
            var mindId = $('#mindId').val();
            var url = "${servePath}" + "/mind/add-mind";
            if(mindId){
                url =  Label.servePath + "/mind/update-mind?mindId="+mindId;
            }

            $.ajax({
                url: url,
                type: "POST",
                cache: false,
                data: {"mindContent":JSON.stringify(mindJson)},
                success: function (result, textStatus) {
                    if (result.mindId != null || result.mindId != undefined || result.mindId != '') {
                        $('#mindId').val(result.mindId);
                        alert(result.mindId);
                        alert(result.mindContent1);
                    }
                },
                error: function (result) {

                },
                complete: function () {

                }
            });
            event.preventDefault();
        }
    </script>
</html>
