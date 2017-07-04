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
                    top: 46px;
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

            </div>
            <div style="background-color: #b2dba1;height: 100px;"></div>
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
                        <span class="mm-menu__link-text">&nbsp;&nbsp;<span class="icon-upload"></span>&nbsp;&nbsp;${exportJsonMind}</span>
                    </a>
                </li>
                <li class="mm-menu__item">
                    <a class="mm-menu__link export" href="#" data-type="md">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;<span class="icon-upload"></span>&nbsp;&nbsp;${exportMdMind}</span>
                    </a>
                </li>
                <li class="mm-menu__item">
                    <a class="mm-menu__link export" href="#" data-type="km">
                        <span class="mm-menu__link-text">&nbsp;&nbsp;<span class="icon-upload"></span>&nbsp;&nbsp;${exporpKmMind}</span>
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
    <script src="${staticServePath}/js/lib/kitymind/diy.js"></script>
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
    </script>
</html>
