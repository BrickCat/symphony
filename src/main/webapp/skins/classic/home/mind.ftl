<#include "macro-home.ftl">
<@home "${type}">
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
        background: #393F4F;
        color: white;
        margin: 0;
        height: 40px;
        font-size: 14px;
        line-height: 40px;
        font-family: 'Hiragino Sans GB', 'Arial', 'Microsoft Yahei';
        font-weight: normal;
        padding: 0 20px;
    }

    div.minder-editor-container {
        position: absolute;
        top: 40px;
        bottom: 0;
        left: 0;
        right: 0;
    }
</style>
<link rel="stylesheet" type="text/css" href="${staticServePath}/js/lib/kitymind/bower_components/jquery-nav/css/default.css">
<link rel="stylesheet" href="${staticServePath}/js/lib/kitymind/bower_components/jquery-nav/css/style.min.css">
<div ng-app="kityminderDemo" ng-controller="MainController">
<div id="wrapper" class="wrapper">
    <h1 class="editor-title">

    </h1>
    <kityminder-editor on-init="initEditor(editor, minder)" data-theme="fresh-green"></kityminder-editor>
    <iframe name="frameFile" style="display:none;"></iframe>
</div>
<button id="mm-menu-toggle" class="mm-menu-toggle">Toggle Menu</button>
<nav id="mm-menu" class="mm-menu">
    <div class="mm-menu__header">
        <h2 class="mm-menu__title">Nick Salloum</h2>
    </div>
    <ul class="mm-menu__items">
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="#">
                <span class="mm-menu__link-text"><i class="md md-home"></i> Home</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="#">
                <span class="mm-menu__link-text"><i class="md md-person"></i> Profile</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="#">
                <span class="mm-menu__link-text"><i class="md md-inbox"></i> Inbox</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="#">
                <span class="mm-menu__link-text"><i class="md md-favorite"></i> Favourites</span>
            </a>
        </li>
        <li class="mm-menu__item">
            <a class="mm-menu__link" href="#">
                <span class="mm-menu__link-text"><i class="md md-settings"></i> Settings</span>
            </a>
        </li>
    </ul>
</nav>
</div>
<script src="${staticServePath}/js/lib/kitymind/bower_components/jquery-nav/js/production/materialMenu.min.js"></script>
<!-- bower:js -->
<script src="${staticServePath}/js/lib/kitymind/bower_components/jquery/dist/jquery.js"></script>
<script src="${staticServePath}/js/lib/kitymind/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="${staticServePath}/js/lib/kitymind/bower_components/angular/angular.js"></script>
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

<script src="${staticServePath}/js/lib/kitymind/kityminder.editor.min.js"></script>
<script src="${staticServePath}/js/lib/kitymind/diy.js"></script>

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
</@home>