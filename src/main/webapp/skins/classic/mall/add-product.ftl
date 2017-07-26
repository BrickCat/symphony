<#include "macro-admin.ftl">
<@admin "addProduct">
<div class="content" xmlns="http://www.w3.org/1999/html">
    <link href="${staticServePath}/js/lib/webuploader/webuploader.css" type="text/css">
    <div class="module">
        <div class="module-header">
            <h2>${mallIamgeUtilLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <button type="button" class="green fn-left" onclick="corpper()">${mallIamgeUtil}</button>
        </div>
    </div>
    <div class="module">
        <style>
            #wrapper1 {
                width: 980px;
                margin: 0 auto;

                margin: 1em;
                width: auto;
            }

            #container1 {
                border: 1px solid #dadada;
                color: #838383;
                font-size: 12px;
                margin-top: 10px;
                background-color: #FFF;
            }

            #uploader1 .queueList1 {
                margin: 20px;
            }

            .element-invisible {
                position: absolute !important;
                clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
                clip: rect(1px,1px,1px,1px);
            }

            #uploader1 .placeholder1 {
                border: 3px dashed #e6e6e6;
                min-height: 100px;
                padding-top: 0px;
                text-align: center;
                color: #cccccc;
                font-size: 18px;
                position: relative;
            }

            #uploader1 .placeholder1 .webuploader-pick {
                font-size: 18px;
                background: #60B044;
                border-radius: 3px;
                line-height: 44px;
                padding: 0 30px;
                color: #fff;
                display: inline-block;
                margin: 20px auto;
                cursor: pointer;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            }

            #uploader1 .placeholder1 .webuploader-pick-hover {
                background: #7DB044;
            }

            #uploader1 .placeholder1 .flashTip {
                color: #666666;
                font-size: 12px;
                position: absolute;
                width: 100%;
                text-align: center;
                bottom: 20px;
            }
            #uploader1 .placeholder1 .flashTip a {
                color: #0785d1;
                text-decoration: none;
            }
            #uploader1 .placeholder1 .flashTip a:hover {
                text-decoration: underline;
            }

            #uploader1 .placeholder1.webuploader-dnd-over {
                border-color: #999999;
            }

            #uploader1 .placeholder1.webuploader-dnd-over.webuploader-dnd-denied {
                border-color: red;
            }

            #uploader1 .filelist1 {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            #uploader1 .filelist1:after {
                content: '';
                display: block;
                width: 0;
                height: 0;
                overflow: hidden;
                clear: both;
            }

            #uploader1 .filelist1 li {
                width: 110px;
                height: 110px;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/bg.png') no-repeat;
                text-align: center;
                margin: 0 8px 20px 0;
                position: relative;
                display: inline;
                float: left;
                overflow: hidden;
                font-size: 12px;
            }

            #uploader1 .filelist1 li p.log {
                position: relative;
                top: -45px;
            }

            #uploader1 .filelist1 li p.title1 {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                overflow: hidden;
                white-space: nowrap;
                text-overflow : ellipsis;
                top: 5px;
                text-indent: 5px;
                text-align: left;
            }

            #uploader1 .filelist1 li p.progress1 {
                position: absolute;
                width: 100%;
                bottom: 0;
                left: 0;
                height: 8px;
                overflow: hidden;
                z-index: 50;
            }
            #uploader1 .filelist1 li p.progress1 span {
                display: none;
                overflow: hidden;
                width: 0;
                height: 100%;
                background: #7DB044 url('${staticServePath}/js/lib/webuploader/image-upload/progress.png') repeat-x;

                -webit-transition: width 200ms linear;
                -moz-transition: width 200ms linear;
                -o-transition: width 200ms linear;
                -ms-transition: width 200ms linear;
                transition: width 200ms linear;

                -webkit-animation: progressmove 2s linear infinite;
                -moz-animation: progressmove 2s linear infinite;
                -o-animation: progressmove 2s linear infinite;
                -ms-animation: progressmove 2s linear infinite;
                animation: progressmove 2s linear infinite;

                -webkit-transform: translateZ(0);
            }
            #uploader1 .filelist1 li p.imgWrap1 {
                position: relative;
                z-index: 2;
                line-height: 110px;
                vertical-align: middle;
                overflow: hidden;
                width: 110px;
                height: 110px;

                -webkit-transform-origin: 50% 50%;
                -moz-transform-origin: 50% 50%;
                -o-transform-origin: 50% 50%;
                -ms-transform-origin: 50% 50%;
                transform-origin: 50% 50%;

                -webit-transition: 200ms ease-out;
                -moz-transition: 200ms ease-out;
                -o-transition: 200ms ease-out;
                -ms-transition: 200ms ease-out;
                transition: 200ms ease-out;
            }

            #uploader1 .filelist1 li img {
                width: 100%;
            }

            #uploader1 .filelist1 li p.error1 {
                background: #f43838;
                color: #fff;
                position: absolute;
                bottom: 0;
                left: 0;
                height: 28px;
                line-height: 28px;
                width: 100%;
                z-index: 100;
            }

            #uploader1 .filelist1 li .success1 {
                display: block;
                position: absolute;
                left: 0;
                bottom: 0;
                height: 40px;
                width: 100%;
                z-index: 200;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/success.png') no-repeat right bottom;
            }

            #uploader1 .filelist1 div.file-panel1 {
                position: absolute;
                height: 0;
                filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#80000000', endColorstr='#80000000')\0;
                background: rgba( 0, 0, 0, 0.5 );
                width: 100%;
                top: 0;
                left: 0;
                overflow: hidden;
                z-index: 300;
            }

            #uploader1 .filelist1 div.file-panel1 span {
                width: 24px;
                height: 24px;
                display: inline;
                float: right;
                text-indent: -9999px;
                overflow: hidden;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/icons.png') no-repeat;
                margin: 5px 1px 1px;
                cursor: pointer;
            }

            #uploader1 .filelist1 div.file-panel1 span.rotateLeft1 {
                background-position: 0 -24px;
            }
            #uploader1 .filelist1 div.file-panel1 span.rotateLeft1:hover {
                background-position: 0 0;
            }

            #uploader1 .filelist1 div.file-panel1 span.rotateRight1 {
                background-position: -24px -24px;
            }
            #uploader1 .filelist1 div.file-panel1 span.rotateRight1:hover {
                background-position: -24px 0;
            }

            #uploader1 .filelist1 div.file-panel1 span.cancel1 {
                background-position: -48px -24px;
            }
            #uploader1 .filelist1 div.file-panel1 span.cancel1:hover {
                background-position: -48px 0;
            }

            #uploader1 .statusBar1 {
                height: 63px;
                border-top: 1px solid #dadada;
                padding: 0 20px;
                line-height: 63px;
                vertical-align: middle;
                position: relative;
            }

            #uploader1 .statusBar1 .progress1 {
                border: 1px solid #1483d8;
                width: 198px;
                background: #fff;
                height: 18px;
                position: relative;
                display: inline-block;
                text-align: center;
                line-height: 20px;
                color: #6dbfff;
                position: relative;
                margin-right: 10px;
            }
            #uploader1 .statusBar1 .progress1 span.percentage1 {
                width: 0;
                height: 100%;
                left: 0;
                top: 0;
                background: #1483d8;
                position: absolute;
            }
            #uploader1 .statusBar1 .progress1 span.text1 {
                position: relative;
                z-index: 10;
            }

            #uploader1 .statusBar1 .info1 {
                display: inline-block;
                font-size: 14px;
                color: #666666;
            }

            #uploader1 .statusBar1 .btns1 {
                position: absolute;
                top: 10px;
                right: 20px;
                line-height: 40px;
            }

            #filePicker2 {
                display: inline-block;
                float: left;
            }

            #uploader1 .statusBar1 .btns1 .webuploader-pick,
            #uploader1 .statusBar1 .btns1 .uploadBtn1,
            #uploader1 .statusBar1 .btns1 .uploadBtn1.state-uploading,
            #uploader1 .statusBar1 .btns1 .uploadBtn1.state-paused {
                background: #ffffff;
                border: 1px solid #cfcfcf;
                color: #565656;
                padding: 0 18px;
                display: inline-block;
                border-radius: 3px;
                margin-left: 10px;
                cursor: pointer;
                font-size: 12px;
                float: left;
            }
            #uploader1 .statusBar1 .btns1 .webuploader-pick-hover,
            #uploader1 .statusBar1 .btns1 .uploadBtn1:hover,
            #uploader1 .statusBar1 .btns1 .uploadBtn1.state-uploading:hover,
            #uploader1 .statusBar1 .btns1 .uploadBtn1.state-paused:hover {
                background: #f0f0f0;
            }

            #uploader1 .statusBar1 .btns1 .uploadBtn1 {
                background: #60B044;
                color: #fff;
                border-color: transparent;
            }
            #uploader1 .statusBar1 .btns1 .uploadBtn1:hover {
                background: #7DB044;
            }

            #uploader1 .statusBar1 .btns1 .uploadBtn1.disabled {
                pointer-events: none;
                opacity: 0.6;
            }
        </style>
        <div class="module-header">
            <h2>${mallProductCoverLabel}</h2>
        </div>
        <div id="wrapper1">
            <div id="container1">
                <div id="uploader1">
                    <div class="queueList1">
                        <div id="dndArea1" class="placeholder1">
                            <div id="filePicker1"></div>
                            <p>或将照片拖到这里，单次最多可选1张</p>
                        </div>
                    </div>
                    <div class="statusBar1" style="display:none;">
                        <div class="progress1">
                            <span class="text1">0%</span>
                            <span class="percentage1"></span>
                        </div><div class="info1"></div>
                        <div class="btns1">
                            <div id="filePicker2"></div><div class="uploadBtn1">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="${staticServePath}/js/lib/webuploader/webuploader.nolog.min.js"></script>
    <#--<script src="${staticServePath}/js/lib/webuploader/image-upload/upload.js"></script>-->
        <script type="text/javascript">
            (function($) {
                // 当domReady的时候开始初始化
                $(function() {
                    var timestamp=new Date().getTime();
                    $('#trendId').val(timestamp);
                    var $wrap = $('#uploader1'),

                            // 图片容器
                            $queue = $('<ul class="filelist1"></ul>')
                                    .appendTo($wrap.find('.queueList1')),

                            // 状态栏，包括进度和控制按钮
                            $statusBar = $wrap.find('.statusBar1'),

                            // 文件总体选择信息。
                            $info = $statusBar.find('.info1'),

                            // 上传按钮
                            $upload = $wrap.find('.uploadBtn1'),

                            // 没选择文件之前的内容。
                            $placeHolder = $wrap.find('.placeholder1'),

                            $progress = $statusBar.find('.progress1').hide(),

                            // 添加的文件数量
                            fileCount = 0,

                            // 添加的文件总大小
                            fileSize = 0,

                            // 优化retina, 在retina下这个值是2
                            ratio = window.devicePixelRatio || 1,

                            // 缩略图大小
                            thumbnailWidth = 150 * ratio,
                            thumbnailHeight = 150 * ratio,

                            // 可能有pedding, ready, uploading, confirm, done.
                            state = 'pedding',

                            // 所有文件的进度信息，key为file id
                            percentages = {},
                            // 判断浏览器是否支持图片的base64
                            isSupportBase64 = (function() {
                                var data = new Image();
                                var support = true;
                                data.onload = data.onerror = function() {
                                    if (this.width != 1 || this.height != 1) {
                                        support = false;
                                    }
                                }
                                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                                return support;
                            })(),

                            // 检测是否已经安装flash，检测flash的版本
                            flashVersion = (function() {
                                var version;

                                try {
                                    version = navigator.plugins['Shockwave Flash'];
                                    version = version.description;
                                } catch (ex) {
                                    try {
                                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                                .GetVariable('$version');
                                    } catch (ex2) {
                                        version = '0.0';
                                    }
                                }
                                version = version.match(/\d+/g);
                                return parseFloat(version[0] + '.' + version[1], 10);
                            })(),

                            supportTransition = (function() {
                                var s = document.createElement('p').style,
                                        r = 'transition' in s ||
                                                'WebkitTransition' in s ||
                                                'MozTransition' in s ||
                                                'msTransition' in s ||
                                                'OTransition' in s;
                                s = null;
                                return r;
                            })(),

                            // WebUploader实例
                            uploader;

                    if (!WebUploader.Uploader.support('flash') && WebUploader.browser.ie) {

                        // flash 安装了但是版本过低。
                        if (flashVersion) {
                            (function(container) {
                                window['expressinstallcallback'] = function(state) {
                                    switch (state) {
                                        case 'Download.Cancelled':
                                            alert('您取消了更新！')
                                            break;

                                        case 'Download.Failed':
                                            alert('安装失败')
                                            break;

                                        default:
                                            alert('安装已成功，请刷新！');
                                            break;
                                    }
                                    delete window['expressinstallcallback'];
                                };

                                var swf = '${staticServePath}/js/lib/webuploader/image-upload/expressInstall.swf';
                                // insert flash object
                                var html = '<object type="application/' +
                                        'x-shockwave-flash" data="' + swf + '" ';

                                if (WebUploader.browser.ie) {
                                    html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                                }

                                html += 'width="100%" height="100%" style="outline:0">' +
                                        '<param name="movie1" value="' + swf + '" />' +
                                        '<param name="wmode1" value="transparent" />' +
                                        '<param name="allowscriptaccess1" value="always" />' +
                                        '</object>';

                                container.html(html);

                            })($wrap);

                            // 压根就没有安转。
                        } else {
                            $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
                        }

                        return;
                    } else if (!WebUploader.Uploader.support()) {
                        alert('Web Uploader 不支持您的浏览器！');
                        return;
                    }

                    // 实例化
                    uploader = WebUploader.create({
                        pick: {
                            id: '#filePicker1',
                            label: '点击选择图片'
                        },
                        formData: {
                            uid: timestamp
                        },
                        threads: 1,
                        dnd: '#dndArea1',
                        paste: '#uploader1',
                        swf: '${staticServePath}/js/lib/webuploader/Uploader.swf',
                        chunked: false,
                        chunkSize: 512 * 1024,
                        server: '${servePath}/uploadProduct?type=cover',

                        accept: {
                            title: 'Images',
                            extensions: 'gif,jpg,jpeg,bmp,png',
                            mimeTypes: 'image/*'
                        },

                        // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
                        disableGlobalDnd: true,
                        fileNumLimit: 1,
                        fileSizeLimit: 200 * 1024 * 1024, // 200 M
                        fileSingleSizeLimit: 50 * 1024 * 1024 // 50 M
                    });

                    // 拖拽时不接受 js, txt 文件。
                    uploader.on('dndAccept', function(items) {
                        var denied = false,
                                len = items.length,
                                i = 0,
                                // 修改js类型
                                unAllowed = 'text/plain;application/javascript ';

                        for (; i < len; i++) {
                            // 如果在列表里面
                            if (~unAllowed.indexOf(items[i].type)) {
                                denied = true;
                                break;
                            }
                        }

                        return !denied;
                    });

                    // uploader.on('filesQueued', function() {
                    //     uploader.sort(function( a, b ) {
                    //         if ( a.name < b.name )
                    //           return -1;
                    //         if ( a.name > b.name )
                    //           return 1;
                    //         return 0;
                    //     });
                    // });

                    // 添加“添加文件”的按钮，
                    uploader.addButton({
                        id: '#filePicker2',
                        label: '继续添加'
                    });

                    uploader.on('ready', function() {
                        window.uploader = uploader;
                    });

                    // 当有文件添加进来时执行，负责view的创建
                    function addFile(file) {
                        var $li = $('<li id="' + file.id + '">' +
                                        '<p class="title1">' + file.name + '</p>' +
                                        '<p class="imgWrap1"></p>' +
                                        '<p class="progress1"><span></span></p>' +
                                        '</li>'),

                                $btns = $('<div class="file-panel1">' +
                                        '<span class="cancel1">删除</span>' +
                                        '<span class="rotateRight1">向右旋转</span>' +
                                        '<span class="rotateLeft1">向左旋转</span></div>').appendTo($li),
                                $prgress = $li.find('p.progress1 span'),
                                $wrap = $li.find('p.imgWrap1'),
                                $info = $('<p class="error1"></p>'),

                                showError = function(code) {
                                    switch (code) {
                                        case 'exceed_size':
                                            text = '文件大小超出';
                                            break;

                                        case 'interrupt':
                                            text = '上传暂停';
                                            break;

                                        default:
                                            text = '上传失败，请重试';
                                            break;
                                    }

                                    $info.text(text).appendTo($li);
                                };

                        if (file.getStatus() === 'invalid') {
                            showError(file.statusText);
                        } else {
                            // @todo lazyload
                            $wrap.text('预览中');
                            uploader.makeThumb(file, function(error, src) {
                                var img;

                                if (error) {
                                    $wrap.text('不能预览');
                                    return;
                                }

                                if (isSupportBase64) {
                                    img = $('<img src="' + src + '">');
                                    $wrap.empty().append(img);
                                } else {
                                    $.ajax('../../server/preview.php', {
                                        method: 'POST',
                                        data: src,
                                        dataType: 'json'
                                    }).done(function(response) {
                                        if (response.result) {
                                            img = $('<img src="' + response.result + '">');
                                            $wrap.empty().append(img);
                                        } else {
                                            $wrap.text("预览出错");
                                        }
                                    });
                                }
                            }, thumbnailWidth, thumbnailHeight);

                            percentages[file.id] = [file.size, 0];
                            file.rotation = 0;
                        }

                        file.on('statuschange', function(cur, prev) {
                            if (prev === 'progress1') {
                                $prgress.hide().width(0);
                            } else if (prev === 'queued') {
                                $li.off('mouseenter mouseleave');
                                $btns.remove();
                            }

                            // 成功
                            if (cur === 'error' || cur === 'invalid') {
                                console.log(file.statusText);
                                showError(file.statusText);
                                percentages[file.id][1] = 1;
                            } else if (cur === 'interrupt') {
                                showError('interrupt');
                            } else if (cur === 'queued') {
                                percentages[file.id][1] = 0;
                            } else if (cur === 'progress') {
                                $info.remove();
                                $prgress.css('display', 'block');
                            } else if (cur === 'complete') {
                                $li.append('<span class="success1"></span>');
                            }

                            $li.removeClass('state-' + prev).addClass('state-' + cur);
                        });

                        $li.on('mouseenter', function() {
                            $btns.stop().animate({ height: 30 });
                        });

                        $li.on('mouseleave', function() {
                            $btns.stop().animate({ height: 0 });
                        });

                        $btns.on('click', 'span', function() {
                            var index = $(this).index(),
                                    deg;

                            switch (index) {
                                case 0:
                                    uploader.removeFile(file);
                                    return;

                                case 1:
                                    file.rotation += 90;
                                    break;

                                case 2:
                                    file.rotation -= 90;
                                    break;
                            }

                            if (supportTransition) {
                                deg = 'rotate(' + file.rotation + 'deg)';
                                $wrap.css({
                                    '-webkit-transform': deg,
                                    '-mos-transform': deg,
                                    '-o-transform': deg,
                                    'transform': deg
                                });
                            } else {
                                $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                                // use jquery animate to rotation
                                // $({
                                //     rotation: rotation
                                // }).animate({
                                //     rotation: file.rotation
                                // }, {
                                //     easing: 'linear',
                                //     step: function( now ) {
                                //         now = now * Math.PI / 180;

                                //         var cos = Math.cos( now ),
                                //             sin = Math.sin( now );

                                //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                                //     }
                                // });
                            }


                        });

                        $li.appendTo($queue);
                    }

                    // 负责view的销毁
                    function removeFile(file) {
                        var $li = $('#' + file.id);

                        delete percentages[file.id];
                        updateTotalProgress();
                        $li.off().find('.file-panel1').off().end().remove();
                    }

                    function updateTotalProgress() {
                        var loaded = 0,
                                total = 0,
                                spans = $progress.children(),
                                percent;

                        $.each(percentages, function(k, v) {
                            total += v[0];
                            loaded += v[0] * v[1];
                        });

                        percent = total ? loaded / total : 0;


                        spans.eq(0).text(Math.round(percent * 100) + '%');
                        spans.eq(1).css('width', Math.round(percent * 100) + '%');
                        updateStatus();
                    }

                    function updateStatus() {
                        var text = '',
                                stats;

                        if (state === 'ready') {
                            text = '选中' + fileCount + '张图片，共' +
                                    WebUploader.formatSize(fileSize) + '。';
                        } else if (state === 'confirm') {
                            stats = uploader.getStats();
                            if (stats.uploadFailNum) {
                                text = '已成功上传' + stats.successNum + '张照片，' +
                                        stats.uploadFailNum + '张照片上传失败，<a class="retry1" href="#">重新上传</a>失败图片'
                            }

                        } else {
                            stats = uploader.getStats();
                            text = '共' + fileCount + '张（' +
                                    WebUploader.formatSize(fileSize) +
                                    '），已上传' + stats.successNum + '张';

                            if (stats.uploadFailNum) {
                                text += '，失败' + stats.uploadFailNum + '张';
                            }
                        }

                        $info.html(text);
                    }

                    function setState(val) {
                        var file, stats;

                        if (val === state) {
                            return;
                        }

                        $upload.removeClass('state-' + state);
                        $upload.addClass('state-' + val);
                        state = val;

                        switch (state) {
                            case 'pedding':
                                $placeHolder.removeClass('element-invisible');
                                $queue.hide();
                                $statusBar.addClass('element-invisible');
                                uploader.refresh();
                                break;

                            case 'ready':
                                $placeHolder.addClass('element-invisible');
                                $('#filePicker2').removeClass('element-invisible');
                                $queue.show();
                                $statusBar.removeClass('element-invisible');
                                uploader.refresh();
                                break;

                            case 'uploading':
                                $('#filePicker2').addClass('element-invisible');
                                $progress.show();
                                $upload.text('暂停上传');
                                break;

                            case 'paused':
                                $progress.show();
                                $upload.text('继续上传');
                                break;

                            case 'confirm':
                                $progress.hide();
                                $('#filePicker2').removeClass('element-invisible');
                                $upload.text('开始上传');

                                stats = uploader.getStats();
                                if (stats.successNum && !stats.uploadFailNum) {
                                    setState('finish');
                                    return;
                                }
                                break;
                            case 'finish':
                                stats = uploader.getStats();
                                if (stats.successNum) {
                                } else {
                                    // 没有成功的图片，重设
                                    state = 'done';
                                    location.reload();
                                }
                                break;
                        }

                        updateStatus();
                    }

                    uploader.onUploadProgress = function(file, percentage) {
                        var $li = $('#' + file.id),
                                $percent = $li.find('.progress1 span');

                        $percent.css('width', percentage * 100 + '%');
                        percentages[file.id][1] = percentage;
                        updateTotalProgress();
                    };

                    uploader.onFileQueued = function(file) {
                        fileCount++;
                        fileSize += file.size;

                        if (fileCount === 1) {
                            $placeHolder.addClass('element-invisible');
                            $statusBar.show();
                        }

                        addFile(file);
                        setState('ready');
                        updateTotalProgress();
                    };

                    uploader.onFileDequeued = function(file) {
                        fileCount--;
                        fileSize -= file.size;

                        if (!fileCount) {
                            setState('pedding');
                        }

                        removeFile(file);
                        updateTotalProgress();

                    };

                    uploader.on('all', function(type) {
                        var stats;
                        switch (type) {
                            case 'uploadFinished':
                                setState('confirm');
                                break;

                            case 'startUpload':
                                setState('uploading');
                                break;

                            case 'stopUpload':
                                setState('paused');
                                break;

                        }
                    });

                    uploader.onError = function(code) {
                        //alert('Eroor: ' + code);
                    };

                    $upload.on('click', function() {
                        if ($(this).hasClass('disabled')) {
                            return false;
                        }

                        if (state === 'ready') {
                            uploader.upload();
                        } else if (state === 'paused') {
                            uploader.upload();
                        } else if (state === 'uploading') {
                            uploader.stop();
                        }
                    });

                    $info.on('click', '.retry1', function() {
                        uploader.retry();
                    });

                    $info.on('click', '.ignore2', function() {
                        //alert('todo');
                    });

                    $upload.addClass('state-' + state);
                    updateTotalProgress();
                });

            })(jQuery);
        </script>
    </div>
    <div class="module">
        <div class="module-header">
            <h2>${mallProductInfoLabel}</h2>
        </div>
        <style>
            #wrapper2 {
                width: 980px;
                margin: 0 auto;

                margin: 1em;
                width: auto;
            }

            #container2 {
                border: 1px solid #dadada;
                color: #838383;
                font-size: 12px;
                margin-top: 10px;
                background-color: #FFF;
            }

            #uploader2 .queueList2 {
                margin: 20px;
            }

            .element-invisible {
                position: absolute !important;
                clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
                clip: rect(1px,1px,1px,1px);
            }

            #uploader2 .placeholder2 {
                border: 3px dashed #e6e6e6;
                min-height: 238px;
                padding-top: 158px;
                text-align: center;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/image.png') center 93px no-repeat;
                color: #cccccc;
                font-size: 18px;
                position: relative;
            }

            #uploader2 .placeholder2 .webuploader-pick {
                font-size: 18px;
                background: #60B044;
                border-radius: 3px;
                line-height: 44px;
                padding: 0 30px;
                color: #fff;
                display: inline-block;
                margin: 20px auto;
                cursor: pointer;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            }

            #uploader2 .placeholder2 .webuploader-pick-hover {
                background: #7DB044;
            }

            #uploader2 .placeholder2 .flashTip {
                color: #666666;
                font-size: 12px;
                position: absolute;
                width: 100%;
                text-align: center;
                bottom: 20px;
            }
            #uploader2 .placeholder2 .flashTip a {
                color: #0785d1;
                text-decoration: none;
            }
            #uploader2 .placeholder2 .flashTip a:hover {
                text-decoration: underline;
            }

            #uploader2 .placeholder2.webuploader-dnd-over {
                border-color: #999999;
            }

            #uploader2 .placeholder2.webuploader-dnd-over.webuploader-dnd-denied {
                border-color: red;
            }

            #uploader2 .filelist2 {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            #uploader2 .filelist2:after {
                content: '';
                display: block;
                width: 0;
                height: 0;
                overflow: hidden;
                clear: both;
            }

            #uploader2 .filelist2 li {
                width: 110px;
                height: 110px;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/bg.png') no-repeat;
                text-align: center;
                margin: 0 8px 20px 0;
                position: relative;
                display: inline;
                float: left;
                overflow: hidden;
                font-size: 12px;
            }

            #uploader2 .filelist2 li p.log {
                position: relative;
                top: -45px;
            }

            #uploader2 .filelist2 li p.title2 {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                overflow: hidden;
                white-space: nowrap;
                text-overflow : ellipsis;
                top: 5px;
                text-indent: 5px;
                text-align: left;
            }

            #uploader2 .filelist2 li p.progress2 {
                position: absolute;
                width: 100%;
                bottom: 0;
                left: 0;
                height: 8px;
                overflow: hidden;
                z-index: 50;
            }
            #uploader2 .filelist2 li p.progress2 span {
                display: none;
                overflow: hidden;
                width: 0;
                height: 100%;
                background: #7DB044 url('${staticServePath}/js/lib/webuploader/image-upload/progress.png') repeat-x;

                -webit-transition: width 200ms linear;
                -moz-transition: width 200ms linear;
                -o-transition: width 200ms linear;
                -ms-transition: width 200ms linear;
                transition: width 200ms linear;

                -webkit-animation: progressmove 2s linear infinite;
                -moz-animation: progressmove 2s linear infinite;
                -o-animation: progressmove 2s linear infinite;
                -ms-animation: progressmove 2s linear infinite;
                animation: progressmove 2s linear infinite;

                -webkit-transform: translateZ(0);
            }
            #uploader2 .filelist2 li p.imgWrap2 {
                position: relative;
                z-index: 2;
                line-height: 110px;
                vertical-align: middle;
                overflow: hidden;
                width: 110px;
                height: 110px;

                -webkit-transform-origin: 50% 50%;
                -moz-transform-origin: 50% 50%;
                -o-transform-origin: 50% 50%;
                -ms-transform-origin: 50% 50%;
                transform-origin: 50% 50%;

                -webit-transition: 200ms ease-out;
                -moz-transition: 200ms ease-out;
                -o-transition: 200ms ease-out;
                -ms-transition: 200ms ease-out;
                transition: 200ms ease-out;
            }

            #uploader2 .filelist2 li img {
                width: 100%;
            }

            #uploader2 .filelist2 li p.error2 {
                background: #f43838;
                color: #fff;
                position: absolute;
                bottom: 0;
                left: 0;
                height: 28px;
                line-height: 28px;
                width: 100%;
                z-index: 100;
            }

            #uploader2 .filelist2 li .success2 {
                display: block;
                position: absolute;
                left: 0;
                bottom: 0;
                height: 40px;
                width: 100%;
                z-index: 200;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/success.png') no-repeat right bottom;
            }

            #uploader2 .filelist2 div.file-panel2 {
                position: absolute;
                height: 0;
                filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#80000000', endColorstr='#80000000')\0;
                background: rgba( 0, 0, 0, 0.5 );
                width: 100%;
                top: 0;
                left: 0;
                overflow: hidden;
                z-index: 300;
            }

            #uploader2 .filelist2 div.file-panel2 span {
                width: 24px;
                height: 24px;
                display: inline;
                float: right;
                text-indent: -9999px;
                overflow: hidden;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/icons.png') no-repeat;
                margin: 5px 1px 1px;
                cursor: pointer;
            }

            #uploader2 .filelist2 div.file-panel2 span.rotateLeft2 {
                background-position: 0 -24px;
            }
            #uploader2 .filelist2 div.file-panel2 span.rotateLeft2:hover {
                background-position: 0 0;
            }

            #uploader2 .filelist2 div.file-panel2 span.rotateRight2 {
                background-position: -24px -24px;
            }
            #uploader2 .filelist2 div.file-panel2 span.rotateRight2:hover {
                background-position: -24px 0;
            }

            #uploader2 .filelist2 div.file-panel2 span.cancel2 {
                background-position: -48px -24px;
            }
            #uploader2 .filelist2 div.file-panel2 span.cancel2:hover {
                background-position: -48px 0;
            }

            #uploader2 .statusBar2 {
                height: 63px;
                border-top: 1px solid #dadada;
                padding: 0 20px;
                line-height: 63px;
                vertical-align: middle;
                position: relative;
            }

            #uploader2 .statusBar2 .progress2 {
                border: 1px solid #1483d8;
                width: 198px;
                background: #fff;
                height: 18px;
                position: relative;
                display: inline-block;
                text-align: center;
                line-height: 20px;
                color: #6dbfff;
                position: relative;
                margin-right: 10px;
            }
            #uploader2 .statusBar2 .progress2 span.percentage2 {
                width: 0;
                height: 100%;
                left: 0;
                top: 0;
                background: #1483d8;
                position: absolute;
            }
            #uploader2 .statusBar2 .progress2 span.text2 {
                position: relative;
                z-index: 10;
            }

            #uploader2 .statusBar2 .info2 {
                display: inline-block;
                font-size: 14px;
                color: #666666;
            }

            #uploader2 .statusBar2 .btns2 {
                position: absolute;
                top: 10px;
                right: 20px;
                line-height: 40px;
            }

            #filePicker3 {
                display: inline-block;
                float: left;
            }

            #uploader2 .statusBar2 .btns2 .webuploader-pick,
            #uploader2 .statusBar2 .btns2 .uploadBtn2,
            #uploader2 .statusBar2 .btns2 .uploadBtn2.state-uploading,
            #uploader2 .statusBar2 .btns2 .uploadBtn2.state-paused {
                background: #ffffff;
                border: 1px solid #cfcfcf;
                color: #565656;
                padding: 0 18px;
                display: inline-block;
                border-radius: 3px;
                margin-left: 10px;
                cursor: pointer;
                font-size: 12px;
                float: left;
            }
            #uploader2 .statusBar2 .btns2 .webuploader-pick-hover,
            #uploader2 .statusBar2 .btns2 .uploadBtn2:hover,
            #uploader2 .statusBar2 .btns2 .uploadBtn2.state-uploading:hover,
            #uploader2 .statusBar2 .btns2 .uploadBtn2.state-paused:hover {
                background: #f0f0f0;
            }

            #uploader2 .statusBar2 .btns2 .uploadBtn2 {
                background: #60B044;
                color: #fff;
                border-color: transparent;
            }
            #uploader2 .statusBar2 .btns2 .uploadBtn2:hover {
                background: #7DB044;
            }

            #uploader2 .statusBar2 .btns2 .uploadBtn2.disabled {
                pointer-events: none;
                opacity: 0.6;
            }
        </style>


        <div id="wrapper2">
            <div id="container2">
                <div id="uploader2">
                    <div class="queueList2">
                        <div id="dndArea2" class="placeholder2">
                            <div id="filePicker4"></div>
                            <p>或将照片拖到这里，单次最多可选9张</p>
                        </div>
                    </div>
                    <div class="statusBar2" style="display:none;">
                        <div class="progress2">
                            <span class="text2">0%</span>
                            <span class="percentage2"></span>
                        </div><div class="info2"></div>
                        <div class="btns2">
                            <div id="filePicker3"></div><div class="uploadBtn2">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="${staticServePath}/js/lib/webuploader/webuploader.nolog.min.js"></script>
    <#--<script src="${staticServePath}/js/lib/webuploader/image-upload/upload.js"></script>-->
        <script type="text/javascript">
            (function($) {
                // 当domReady的时候开始初始化
                $(function() {
                    var timestamp=new Date().getTime();
                    $('#trendId').val(timestamp);
                    var $wrap = $('#uploader2'),

                            // 图片容器
                            $queue = $('<ul class="filelist2"></ul>')
                                    .appendTo($wrap.find('.queueList2')),

                            // 状态栏，包括进度和控制按钮
                            $statusBar = $wrap.find('.statusBar2'),

                            // 文件总体选择信息。
                            $info = $statusBar.find('.info2'),

                            // 上传按钮
                            $upload = $wrap.find('.uploadBtn2'),

                            // 没选择文件之前的内容。
                            $placeHolder = $wrap.find('.placeholder2'),

                            $progress = $statusBar.find('.progress2').hide(),

                            // 添加的文件数量
                            fileCount = 0,

                            // 添加的文件总大小
                            fileSize = 0,

                            // 优化retina, 在retina下这个值是2
                            ratio = window.devicePixelRatio || 1,

                            // 缩略图大小
                            thumbnailWidth = 110 * ratio,
                            thumbnailHeight = 110 * ratio,

                            // 可能有pedding, ready, uploading, confirm, done.
                            state = 'pedding',

                            // 所有文件的进度信息，key为file id
                            percentages = {},
                            // 判断浏览器是否支持图片的base64
                            isSupportBase64 = (function() {
                                var data = new Image();
                                var support = true;
                                data.onload = data.onerror = function() {
                                    if (this.width != 1 || this.height != 1) {
                                        support = false;
                                    }
                                }
                                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                                return support;
                            })(),

                            // 检测是否已经安装flash，检测flash的版本
                            flashVersion = (function() {
                                var version;

                                try {
                                    version = navigator.plugins['Shockwave Flash'];
                                    version = version.description;
                                } catch (ex) {
                                    try {
                                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                                .GetVariable('$version');
                                    } catch (ex2) {
                                        version = '0.0';
                                    }
                                }
                                version = version.match(/\d+/g);
                                return parseFloat(version[0] + '.' + version[1], 10);
                            })(),

                            supportTransition = (function() {
                                var s = document.createElement('p').style,
                                        r = 'transition' in s ||
                                                'WebkitTransition' in s ||
                                                'MozTransition' in s ||
                                                'msTransition' in s ||
                                                'OTransition' in s;
                                s = null;
                                return r;
                            })(),

                            // WebUploader实例
                            uploader;

                    if (!WebUploader.Uploader.support('flash') && WebUploader.browser.ie) {

                        // flash 安装了但是版本过低。
                        if (flashVersion) {
                            (function(container) {
                                window['expressinstallcallback'] = function(state) {
                                    switch (state) {
                                        case 'Download.Cancelled':
                                            alert('您取消了更新！')
                                            break;

                                        case 'Download.Failed':
                                            alert('安装失败')
                                            break;

                                        default:
                                            alert('安装已成功，请刷新！');
                                            break;
                                    }
                                    delete window['expressinstallcallback'];
                                };

                                var swf = '${staticServePath}/js/lib/webuploader/image-upload/expressInstall.swf';
                                // insert flash object
                                var html = '<object type="application/' +
                                        'x-shockwave-flash" data="' + swf + '" ';

                                if (WebUploader.browser.ie) {
                                    html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                                }

                                html += 'width="100%" height="100%" style="outline:0">' +
                                        '<param name="movie2" value="' + swf + '" />' +
                                        '<param name="wmode2" value="transparent" />' +
                                        '<param name="allowscriptaccess2" value="always" />' +
                                        '</object>';

                                container.html(html);

                            })($wrap);

                            // 压根就没有安转。
                        } else {
                            $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
                        }

                        return;
                    } else if (!WebUploader.Uploader.support()) {
                        alert('Web Uploader 不支持您的浏览器！');
                        return;
                    }

                    // 实例化
                    uploader = WebUploader.create({
                        pick: {
                            id: '#filePicker4',
                            label: '点击选择图片'
                        },
                        formData: {
                            uid: timestamp
                        },
                        threads: 1,
                        dnd: '#dndArea2',
                        paste: '#uploader2',
                        swf: '${staticServePath}/js/lib/webuploader/Uploader.swf',
                        chunked: false,
                        chunkSize: 512 * 1024,
                        server: '${servePath}/uploadProduct?type=info',

                        accept: {
                            title: 'Images',
                            extensions: 'gif,jpg,jpeg,bmp,png',
                            mimeTypes: 'image/*'
                        },

                        // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
                        disableGlobalDnd: true,
                        fileNumLimit: 9,
                        fileSizeLimit: 200 * 1024 * 1024, // 200 M
                        fileSingleSizeLimit: 50 * 1024 * 1024 // 50 M
                    });

                    // 拖拽时不接受 js, txt 文件。
                    uploader.on('dndAccept', function(items) {
                        var denied = false,
                                len = items.length,
                                i = 0,
                                // 修改js类型
                                unAllowed = 'text/plain;application/javascript ';

                        for (; i < len; i++) {
                            // 如果在列表里面
                            if (~unAllowed.indexOf(items[i].type)) {
                                denied = true;
                                break;
                            }
                        }

                        return !denied;
                    });

                    // uploader.on('filesQueued', function() {
                    //     uploader.sort(function( a, b ) {
                    //         if ( a.name < b.name )
                    //           return -1;
                    //         if ( a.name > b.name )
                    //           return 1;
                    //         return 0;
                    //     });
                    // });

                    // 添加“添加文件”的按钮，
                    uploader.addButton({
                        id: '#filePicker3',
                        label: '继续添加'
                    });

                    uploader.on('ready', function() {
                        window.uploader = uploader;
                    });

                    // 当有文件添加进来时执行，负责view的创建
                    function addFile(file) {
                        var $li = $('<li id="' + file.id + '">' +
                                        '<p class="title2">' + file.name + '</p>' +
                                        '<p class="imgWrap2"></p>' +
                                        '<p class="progress2"><span></span></p>' +
                                        '</li>'),

                                $btns = $('<div class="file-panel2">' +
                                        '<span class="cancel2">删除</span>' +
                                        '<span class="rotateRight2">向右旋转</span>' +
                                        '<span class="rotateLeft2">向左旋转</span></div>').appendTo($li),
                                $prgress = $li.find('p.progress2 span'),
                                $wrap = $li.find('p.imgWrap2'),
                                $info = $('<p class="error2"></p>'),

                                showError = function(code) {
                                    switch (code) {
                                        case 'exceed_size':
                                            text = '文件大小超出';
                                            break;

                                        case 'interrupt':
                                            text = '上传暂停';
                                            break;

                                        default:
                                            text = '上传失败，请重试';
                                            break;
                                    }

                                    $info.text(text).appendTo($li);
                                };

                        if (file.getStatus() === 'invalid') {
                            showError(file.statusText);
                        } else {
                            // @todo lazyload
                            $wrap.text('预览中');
                            uploader.makeThumb(file, function(error, src) {
                                var img;

                                if (error) {
                                    $wrap.text('不能预览');
                                    return;
                                }

                                if (isSupportBase64) {
                                    img = $('<img src="' + src + '">');
                                    $wrap.empty().append(img);
                                } else {
                                    $.ajax('../../server/preview.php', {
                                        method: 'POST',
                                        data: src,
                                        dataType: 'json'
                                    }).done(function(response) {
                                        if (response.result) {
                                            img = $('<img src="' + response.result + '">');
                                            $wrap.empty().append(img);
                                        } else {
                                            $wrap.text("预览出错");
                                        }
                                    });
                                }
                            }, thumbnailWidth, thumbnailHeight);

                            percentages[file.id] = [file.size, 0];
                            file.rotation = 0;
                        }

                        file.on('statuschange', function(cur, prev) {
                            if (prev === 'progress') {
                                $prgress.hide().width(0);
                            } else if (prev === 'queued') {
                                $li.off('mouseenter mouseleave');
                                $btns.remove();
                            }

                            // 成功
                            if (cur === 'error' || cur === 'invalid') {
                                console.log(file.statusText);
                                showError(file.statusText);
                                percentages[file.id][1] = 1;
                            } else if (cur === 'interrupt') {
                                showError('interrupt');
                            } else if (cur === 'queued') {
                                percentages[file.id][1] = 0;
                            } else if (cur === 'progress') {
                                $info.remove();
                                $prgress.css('display', 'block');
                            } else if (cur === 'complete') {
                                $li.append('<span class="success2"></span>');
                            }

                            $li.removeClass('state-' + prev).addClass('state-' + cur);
                        });

                        $li.on('mouseenter', function() {
                            $btns.stop().animate({ height: 30 });
                        });

                        $li.on('mouseleave', function() {
                            $btns.stop().animate({ height: 0 });
                        });

                        $btns.on('click', 'span', function() {
                            var index = $(this).index(),
                                    deg;

                            switch (index) {
                                case 0:
                                    uploader.removeFile(file);
                                    return;

                                case 1:
                                    file.rotation += 90;
                                    break;

                                case 2:
                                    file.rotation -= 90;
                                    break;
                            }

                            if (supportTransition) {
                                deg = 'rotate(' + file.rotation + 'deg)';
                                $wrap.css({
                                    '-webkit-transform': deg,
                                    '-mos-transform': deg,
                                    '-o-transform': deg,
                                    'transform': deg
                                });
                            } else {
                                $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                                // use jquery animate to rotation
                                // $({
                                //     rotation: rotation
                                // }).animate({
                                //     rotation: file.rotation
                                // }, {
                                //     easing: 'linear',
                                //     step: function( now ) {
                                //         now = now * Math.PI / 180;

                                //         var cos = Math.cos( now ),
                                //             sin = Math.sin( now );

                                //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                                //     }
                                // });
                            }


                        });

                        $li.appendTo($queue);
                    }

                    // 负责view的销毁
                    function removeFile(file) {
                        var $li = $('#' + file.id);

                        delete percentages[file.id];
                        updateTotalProgress();
                        $li.off().find('.file-panel2').off().end().remove();
                    }

                    function updateTotalProgress() {
                        var loaded = 0,
                                total = 0,
                                spans = $progress.children(),
                                percent;

                        $.each(percentages, function(k, v) {
                            total += v[0];
                            loaded += v[0] * v[1];
                        });

                        percent = total ? loaded / total : 0;


                        spans.eq(0).text(Math.round(percent * 100) + '%');
                        spans.eq(1).css('width', Math.round(percent * 100) + '%');
                        updateStatus();
                    }

                    function updateStatus() {
                        var text = '',
                                stats;

                        if (state === 'ready') {
                            text = '选中' + fileCount + '张图片，共' +
                                    WebUploader.formatSize(fileSize) + '。';
                        } else if (state === 'confirm') {
                            stats = uploader.getStats();
                            if (stats.uploadFailNum) {
                                text = '已成功上传' + stats.successNum + '张照片，' +
                                        stats.uploadFailNum + '张照片上传失败，<a class="retry2" href="#">重新上传</a>失败图片'
                            }

                        } else {
                            stats = uploader.getStats();
                            text = '共' + fileCount + '张（' +
                                    WebUploader.formatSize(fileSize) +
                                    '），已上传' + stats.successNum + '张';

                            if (stats.uploadFailNum) {
                                text += '，失败' + stats.uploadFailNum + '张';
                            }
                        }

                        $info.html(text);
                    }

                    function setState(val) {
                        var file, stats;

                        if (val === state) {
                            return;
                        }

                        $upload.removeClass('state-' + state);
                        $upload.addClass('state-' + val);
                        state = val;

                        switch (state) {
                            case 'pedding':
                                $placeHolder.removeClass('element-invisible');
                                $queue.hide();
                                $statusBar.addClass('element-invisible');
                                uploader.refresh();
                                break;

                            case 'ready':
                                $placeHolder.addClass('element-invisible');
                                $('#filePicker3').removeClass('element-invisible');
                                $queue.show();
                                $statusBar.removeClass('element-invisible');
                                uploader.refresh();
                                break;

                            case 'uploading':
                                $('#filePicker3').addClass('element-invisible');
                                $progress.show();
                                $upload.text('暂停上传');
                                break;

                            case 'paused':
                                $progress.show();
                                $upload.text('继续上传');
                                break;

                            case 'confirm':
                                $progress.hide();
                                $('#filePicker3').removeClass('element-invisible');
                                $upload.text('开始上传');

                                stats = uploader.getStats();
                                if (stats.successNum && !stats.uploadFailNum) {
                                    setState('finish');
                                    return;
                                }
                                break;
                            case 'finish':
                                stats = uploader.getStats();
                                if (stats.successNum) {
                                } else {
                                    // 没有成功的图片，重设
                                    state = 'done';
                                    location.reload();
                                }
                                break;
                        }

                        updateStatus();
                    }

                    uploader.onUploadProgress = function(file, percentage) {
                        var $li = $('#' + file.id),
                                $percent = $li.find('.progress2 span');

                        $percent.css('width', percentage * 100 + '%');
                        percentages[file.id][1] = percentage;
                        updateTotalProgress();
                    };

                    uploader.onFileQueued = function(file) {
                        fileCount++;
                        fileSize += file.size;

                        if (fileCount === 1) {
                            $placeHolder.addClass('element-invisible');
                            $statusBar.show();
                        }

                        addFile(file);
                        setState('ready');
                        updateTotalProgress();
                    };

                    uploader.onFileDequeued = function(file) {
                        fileCount--;
                        fileSize -= file.size;

                        if (!fileCount) {
                            setState('pedding');
                        }

                        removeFile(file);
                        updateTotalProgress();

                    };

                    uploader.on('all', function(type) {
                        var stats;
                        switch (type) {
                            case 'uploadFinished':
                                setState('confirm');
                                break;

                            case 'startUpload':
                                setState('uploading');
                                break;

                            case 'stopUpload':
                                setState('paused');
                                break;

                        }
                    });

                    uploader.onError = function(code) {
                        //alert('Eroor: ' + code);
                    };

                    $upload.on('click', function() {
                        if ($(this).hasClass('disabled')) {
                            return false;
                        }

                        if (state === 'ready') {
                            uploader.upload();
                        } else if (state === 'paused') {
                            uploader.upload();
                        } else if (state === 'uploading') {
                            uploader.stop();
                        }
                    });

                    $info.on('click', '.retry2', function() {
                        uploader.retry();
                    });

                    $info.on('click', '.ignore2', function() {
                        //alert('todo');
                    });

                    $upload.addClass('state-' + state);
                    updateTotalProgress();
                });

            })(jQuery);
        </script>
    </div>
    <div class="module">
        <div class="module-header">
            <h2>${mallProductIntroLabel}</h2>
        </div>
        <style>
            #wrapper {
                width: 980px;
                margin: 0 auto;

                margin: 1em;
                width: auto;
            }

            #container {
                border: 1px solid #dadada;
                color: #838383;
                font-size: 12px;
                margin-top: 10px;
                background-color: #FFF;
            }

            #uploader .queueList {
                margin: 20px;
            }

            .element-invisible {
                position: absolute !important;
                clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
                clip: rect(1px,1px,1px,1px);
            }

            #uploader .placeholder {
                border: 3px dashed #e6e6e6;
                min-height: 238px;
                padding-top: 158px;
                text-align: center;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/image.png') center 93px no-repeat;
                color: #cccccc;
                font-size: 18px;
                position: relative;
            }

            #uploader .placeholder .webuploader-pick {
                font-size: 18px;
                background: #60B044;
                border-radius: 3px;
                line-height: 44px;
                padding: 0 30px;
                color: #fff;
                display: inline-block;
                margin: 20px auto;
                cursor: pointer;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            }

            #uploader .placeholder .webuploader-pick-hover {
                background: #7DB044;
            }

            #uploader .placeholder .flashTip {
                color: #666666;
                font-size: 12px;
                position: absolute;
                width: 100%;
                text-align: center;
                bottom: 20px;
            }
            #uploader .placeholder .flashTip a {
                color: #0785d1;
                text-decoration: none;
            }
            #uploader .placeholder .flashTip a:hover {
                text-decoration: underline;
            }

            #uploader .placeholder.webuploader-dnd-over {
                border-color: #999999;
            }

            #uploader .placeholder.webuploader-dnd-over.webuploader-dnd-denied {
                border-color: red;
            }

            #uploader .filelist {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            #uploader .filelist:after {
                content: '';
                display: block;
                width: 0;
                height: 0;
                overflow: hidden;
                clear: both;
            }

            #uploader .filelist li {
                width: 110px;
                height: 110px;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/bg.png') no-repeat;
                text-align: center;
                margin: 0 8px 20px 0;
                position: relative;
                display: inline;
                float: left;
                overflow: hidden;
                font-size: 12px;
            }

            #uploader .filelist li p.log {
                position: relative;
                top: -45px;
            }

            #uploader .filelist li p.title {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                overflow: hidden;
                white-space: nowrap;
                text-overflow : ellipsis;
                top: 5px;
                text-indent: 5px;
                text-align: left;
            }

            #uploader .filelist li p.progress {
                position: absolute;
                width: 100%;
                bottom: 0;
                left: 0;
                height: 8px;
                overflow: hidden;
                z-index: 50;
            }
            #uploader .filelist li p.progress span {
                display: none;
                overflow: hidden;
                width: 0;
                height: 100%;
                background: #7DB044 url('${staticServePath}/js/lib/webuploader/image-upload/progress.png') repeat-x;

                -webit-transition: width 200ms linear;
                -moz-transition: width 200ms linear;
                -o-transition: width 200ms linear;
                -ms-transition: width 200ms linear;
                transition: width 200ms linear;

                -webkit-animation: progressmove 2s linear infinite;
                -moz-animation: progressmove 2s linear infinite;
                -o-animation: progressmove 2s linear infinite;
                -ms-animation: progressmove 2s linear infinite;
                animation: progressmove 2s linear infinite;

                -webkit-transform: translateZ(0);
            }
            #uploader .filelist li p.imgWrap {
                position: relative;
                z-index: 2;
                line-height: 110px;
                vertical-align: middle;
                overflow: hidden;
                width: 110px;
                height: 110px;

                -webkit-transform-origin: 50% 50%;
                -moz-transform-origin: 50% 50%;
                -o-transform-origin: 50% 50%;
                -ms-transform-origin: 50% 50%;
                transform-origin: 50% 50%;

                -webit-transition: 200ms ease-out;
                -moz-transition: 200ms ease-out;
                -o-transition: 200ms ease-out;
                -ms-transition: 200ms ease-out;
                transition: 200ms ease-out;
            }

            #uploader .filelist li img {
                width: 100%;
            }

            #uploader .filelist li p.error {
                background: #f43838;
                color: #fff;
                position: absolute;
                bottom: 0;
                left: 0;
                height: 28px;
                line-height: 28px;
                width: 100%;
                z-index: 100;
            }

            #uploader .filelist li .success {
                display: block;
                position: absolute;
                left: 0;
                bottom: 0;
                height: 40px;
                width: 100%;
                z-index: 200;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/success.png') no-repeat right bottom;
            }

            #uploader .filelist div.file-panel {
                position: absolute;
                height: 0;
                filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#80000000', endColorstr='#80000000')\0;
                background: rgba( 0, 0, 0, 0.5 );
                width: 100%;
                top: 0;
                left: 0;
                overflow: hidden;
                z-index: 300;
            }

            #uploader .filelist div.file-panel span {
                width: 24px;
                height: 24px;
                display: inline;
                float: right;
                text-indent: -9999px;
                overflow: hidden;
                background: url('${staticServePath}/js/lib/webuploader/image-upload/icons.png') no-repeat;
                margin: 5px 1px 1px;
                cursor: pointer;
            }

            #uploader .filelist div.file-panel span.rotateLeft {
                background-position: 0 -24px;
            }
            #uploader .filelist div.file-panel span.rotateLeft:hover {
                background-position: 0 0;
            }

            #uploader .filelist div.file-panel span.rotateRight {
                background-position: -24px -24px;
            }
            #uploader .filelist div.file-panel span.rotateRight:hover {
                background-position: -24px 0;
            }

            #uploader .filelist div.file-panel span.cancel {
                background-position: -48px -24px;
            }
            #uploader .filelist div.file-panel span.cancel:hover {
                background-position: -48px 0;
            }

            #uploader .statusBar {
                height: 63px;
                border-top: 1px solid #dadada;
                padding: 0 20px;
                line-height: 63px;
                vertical-align: middle;
                position: relative;
            }

            #uploader .statusBar .progress {
                border: 1px solid #1483d8;
                width: 198px;
                background: #fff;
                height: 18px;
                position: relative;
                display: inline-block;
                text-align: center;
                line-height: 20px;
                color: #6dbfff;
                position: relative;
                margin-right: 10px;
            }
            #uploader .statusBar .progress span.percentage {
                width: 0;
                height: 100%;
                left: 0;
                top: 0;
                background: #1483d8;
                position: absolute;
            }
            #uploader .statusBar .progress span.text {
                position: relative;
                z-index: 10;
            }

            #uploader .statusBar .info {
                display: inline-block;
                font-size: 14px;
                color: #666666;
            }

            #uploader .statusBar .btns {
                position: absolute;
                top: 10px;
                right: 20px;
                line-height: 40px;
            }

            #filePicker2 {
                display: inline-block;
                float: left;
            }

            #uploader .statusBar .btns .webuploader-pick,
            #uploader .statusBar .btns .uploadBtn,
            #uploader .statusBar .btns .uploadBtn.state-uploading,
            #uploader .statusBar .btns .uploadBtn.state-paused {
                background: #ffffff;
                border: 1px solid #cfcfcf;
                color: #565656;
                padding: 0 18px;
                display: inline-block;
                border-radius: 3px;
                margin-left: 10px;
                cursor: pointer;
                font-size: 12px;
                float: left;
            }
            #uploader .statusBar .btns .webuploader-pick-hover,
            #uploader .statusBar .btns .uploadBtn:hover,
            #uploader .statusBar .btns .uploadBtn.state-uploading:hover,
            #uploader .statusBar .btns .uploadBtn.state-paused:hover {
                background: #f0f0f0;
            }

            #uploader .statusBar .btns .uploadBtn {
                background: #60B044;
                color: #fff;
                border-color: transparent;
            }
            #uploader .statusBar .btns .uploadBtn:hover {
                background: #7DB044;
            }

            #uploader .statusBar .btns .uploadBtn.disabled {
                pointer-events: none;
                opacity: 0.6;
            }
        </style>


        <div id="wrapper">
            <div id="container">
                <div id="uploader">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder">
                            <div id="filePicker"></div>
                            <p>或将照片拖到这里，单次最多可选9张</p>
                        </div>
                    </div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress">
                            <span class="text">0%</span>
                            <span class="percentage"></span>
                        </div><div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="${staticServePath}/js/lib/webuploader/webuploader.nolog.min.js"></script>
    <#--<script src="${staticServePath}/js/lib/webuploader/image-upload/upload.js"></script>-->
        <script type="text/javascript">
            (function($) {
                // 当domReady的时候开始初始化
                $(function() {
                    var timestamp=new Date().getTime();
                    $('#trendId').val(timestamp);
                    var $wrap = $('#uploader'),

                            // 图片容器
                            $queue = $('<ul class="filelist"></ul>')
                                    .appendTo($wrap.find('.queueList')),

                            // 状态栏，包括进度和控制按钮
                            $statusBar = $wrap.find('.statusBar'),

                            // 文件总体选择信息。
                            $info = $statusBar.find('.info'),

                            // 上传按钮
                            $upload = $wrap.find('.uploadBtn'),

                            // 没选择文件之前的内容。
                            $placeHolder = $wrap.find('.placeholder'),

                            $progress = $statusBar.find('.progress').hide(),

                            // 添加的文件数量
                            fileCount = 0,

                            // 添加的文件总大小
                            fileSize = 0,

                            // 优化retina, 在retina下这个值是2
                            ratio = window.devicePixelRatio || 1,

                            // 缩略图大小
                            thumbnailWidth = 110 * ratio,
                            thumbnailHeight = 110 * ratio,

                            // 可能有pedding, ready, uploading, confirm, done.
                            state = 'pedding',

                            // 所有文件的进度信息，key为file id
                            percentages = {},
                            // 判断浏览器是否支持图片的base64
                            isSupportBase64 = (function() {
                                var data = new Image();
                                var support = true;
                                data.onload = data.onerror = function() {
                                    if (this.width != 1 || this.height != 1) {
                                        support = false;
                                    }
                                }
                                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                                return support;
                            })(),

                            // 检测是否已经安装flash，检测flash的版本
                            flashVersion = (function() {
                                var version;

                                try {
                                    version = navigator.plugins['Shockwave Flash'];
                                    version = version.description;
                                } catch (ex) {
                                    try {
                                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                                .GetVariable('$version');
                                    } catch (ex2) {
                                        version = '0.0';
                                    }
                                }
                                version = version.match(/\d+/g);
                                return parseFloat(version[0] + '.' + version[1], 10);
                            })(),

                            supportTransition = (function() {
                                var s = document.createElement('p').style,
                                        r = 'transition' in s ||
                                                'WebkitTransition' in s ||
                                                'MozTransition' in s ||
                                                'msTransition' in s ||
                                                'OTransition' in s;
                                s = null;
                                return r;
                            })(),

                            // WebUploader实例
                            uploader;

                    if (!WebUploader.Uploader.support('flash') && WebUploader.browser.ie) {

                        // flash 安装了但是版本过低。
                        if (flashVersion) {
                            (function(container) {
                                window['expressinstallcallback'] = function(state) {
                                    switch (state) {
                                        case 'Download.Cancelled':
                                            alert('您取消了更新！')
                                            break;

                                        case 'Download.Failed':
                                            alert('安装失败')
                                            break;

                                        default:
                                            alert('安装已成功，请刷新！');
                                            break;
                                    }
                                    delete window['expressinstallcallback'];
                                };

                                var swf = '${staticServePath}/js/lib/webuploader/image-upload/expressInstall.swf';
                                // insert flash object
                                var html = '<object type="application/' +
                                        'x-shockwave-flash" data="' + swf + '" ';

                                if (WebUploader.browser.ie) {
                                    html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                                }

                                html += 'width="100%" height="100%" style="outline:0">' +
                                        '<param name="movie" value="' + swf + '" />' +
                                        '<param name="wmode" value="transparent" />' +
                                        '<param name="allowscriptaccess" value="always" />' +
                                        '</object>';

                                container.html(html);

                            })($wrap);

                            // 压根就没有安转。
                        } else {
                            $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
                        }

                        return;
                    } else if (!WebUploader.Uploader.support()) {
                        alert('Web Uploader 不支持您的浏览器！');
                        return;
                    }

                    // 实例化
                    uploader = WebUploader.create({
                        pick: {
                            id: '#filePicker',
                            label: '点击选择图片'
                        },
                        formData: {
                            uid: timestamp
                        },
                        threads: 1,
                        dnd: '#dndArea',
                        paste: '#uploader',
                        swf: '${staticServePath}/js/lib/webuploader/Uploader.swf',
                        chunked: false,
                        chunkSize: 512 * 1024,
                        server: '${servePath}/uploadProduct?type=intro',

                        accept: {
                            title: 'Images',
                            extensions: 'gif,jpg,jpeg,bmp,png',
                            mimeTypes: 'image/*'
                        },

                        // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
                        disableGlobalDnd: true,
                        fileNumLimit: 9,
                        fileSizeLimit: 200 * 1024 * 1024, // 200 M
                        fileSingleSizeLimit: 50 * 1024 * 1024 // 50 M
                    });

                    // 拖拽时不接受 js, txt 文件。
                    uploader.on('dndAccept', function(items) {
                        var denied = false,
                                len = items.length,
                                i = 0,
                                // 修改js类型
                                unAllowed = 'text/plain;application/javascript ';

                        for (; i < len; i++) {
                            // 如果在列表里面
                            if (~unAllowed.indexOf(items[i].type)) {
                                denied = true;
                                break;
                            }
                        }

                        return !denied;
                    });

                    // uploader.on('filesQueued', function() {
                    //     uploader.sort(function( a, b ) {
                    //         if ( a.name < b.name )
                    //           return -1;
                    //         if ( a.name > b.name )
                    //           return 1;
                    //         return 0;
                    //     });
                    // });

                    // 添加“添加文件”的按钮，
                    uploader.addButton({
                        id: '#filePicker2',
                        label: '继续添加'
                    });

                    uploader.on('ready', function() {
                        window.uploader = uploader;
                    });

                    // 当有文件添加进来时执行，负责view的创建
                    function addFile(file) {
                        var $li = $('<li id="' + file.id + '">' +
                                        '<p class="title">' + file.name + '</p>' +
                                        '<p class="imgWrap"></p>' +
                                        '<p class="progress"><span></span></p>' +
                                        '</li>'),

                                $btns = $('<div class="file-panel">' +
                                        '<span class="cancel">删除</span>' +
                                        '<span class="rotateRight">向右旋转</span>' +
                                        '<span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                                $prgress = $li.find('p.progress span'),
                                $wrap = $li.find('p.imgWrap'),
                                $info = $('<p class="error"></p>'),

                                showError = function(code) {
                                    switch (code) {
                                        case 'exceed_size':
                                            text = '文件大小超出';
                                            break;

                                        case 'interrupt':
                                            text = '上传暂停';
                                            break;

                                        default:
                                            text = '上传失败，请重试';
                                            break;
                                    }

                                    $info.text(text).appendTo($li);
                                };

                        if (file.getStatus() === 'invalid') {
                            showError(file.statusText);
                        } else {
                            // @todo lazyload
                            $wrap.text('预览中');
                            uploader.makeThumb(file, function(error, src) {
                                var img;

                                if (error) {
                                    $wrap.text('不能预览');
                                    return;
                                }

                                if (isSupportBase64) {
                                    img = $('<img src="' + src + '">');
                                    $wrap.empty().append(img);
                                } else {
                                    $.ajax('../../server/preview.php', {
                                        method: 'POST',
                                        data: src,
                                        dataType: 'json'
                                    }).done(function(response) {
                                        if (response.result) {
                                            img = $('<img src="' + response.result + '">');
                                            $wrap.empty().append(img);
                                        } else {
                                            $wrap.text("预览出错");
                                        }
                                    });
                                }
                            }, thumbnailWidth, thumbnailHeight);

                            percentages[file.id] = [file.size, 0];
                            file.rotation = 0;
                        }

                        file.on('statuschange', function(cur, prev) {
                            if (prev === 'progress') {
                                $prgress.hide().width(0);
                            } else if (prev === 'queued') {
                                $li.off('mouseenter mouseleave');
                                $btns.remove();
                            }

                            // 成功
                            if (cur === 'error' || cur === 'invalid') {
                                console.log(file.statusText);
                                showError(file.statusText);
                                percentages[file.id][1] = 1;
                            } else if (cur === 'interrupt') {
                                showError('interrupt');
                            } else if (cur === 'queued') {
                                percentages[file.id][1] = 0;
                            } else if (cur === 'progress') {
                                $info.remove();
                                $prgress.css('display', 'block');
                            } else if (cur === 'complete') {
                                $li.append('<span class="success"></span>');
                                $("#submit").removeAttr("disabled");
                                $("#submit").removeClass("red fn-right")
                                $("#submit").attr("class", "green fn-right");
                            }

                            $li.removeClass('state-' + prev).addClass('state-' + cur);
                        });

                        $li.on('mouseenter', function() {
                            $btns.stop().animate({ height: 30 });
                        });

                        $li.on('mouseleave', function() {
                            $btns.stop().animate({ height: 0 });
                        });

                        $btns.on('click', 'span', function() {
                            var index = $(this).index(),
                                    deg;

                            switch (index) {
                                case 0:
                                    uploader.removeFile(file);
                                    return;

                                case 1:
                                    file.rotation += 90;
                                    break;

                                case 2:
                                    file.rotation -= 90;
                                    break;
                            }

                            if (supportTransition) {
                                deg = 'rotate(' + file.rotation + 'deg)';
                                $wrap.css({
                                    '-webkit-transform': deg,
                                    '-mos-transform': deg,
                                    '-o-transform': deg,
                                    'transform': deg
                                });
                            } else {
                                $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                                // use jquery animate to rotation
                                // $({
                                //     rotation: rotation
                                // }).animate({
                                //     rotation: file.rotation
                                // }, {
                                //     easing: 'linear',
                                //     step: function( now ) {
                                //         now = now * Math.PI / 180;

                                //         var cos = Math.cos( now ),
                                //             sin = Math.sin( now );

                                //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                                //     }
                                // });
                            }


                        });

                        $li.appendTo($queue);
                    }

                    // 负责view的销毁
                    function removeFile(file) {
                        var $li = $('#' + file.id);

                        delete percentages[file.id];
                        updateTotalProgress();
                        $li.off().find('.file-panel').off().end().remove();
                    }

                    function updateTotalProgress() {
                        var loaded = 0,
                                total = 0,
                                spans = $progress.children(),
                                percent;

                        $.each(percentages, function(k, v) {
                            total += v[0];
                            loaded += v[0] * v[1];
                        });

                        percent = total ? loaded / total : 0;


                        spans.eq(0).text(Math.round(percent * 100) + '%');
                        spans.eq(1).css('width', Math.round(percent * 100) + '%');
                        updateStatus();
                    }

                    function updateStatus() {
                        var text = '',
                                stats;

                        if (state === 'ready') {
                            text = '选中' + fileCount + '张图片，共' +
                                    WebUploader.formatSize(fileSize) + '。';
                        } else if (state === 'confirm') {
                            stats = uploader.getStats();
                            if (stats.uploadFailNum) {
                                text = '已成功上传' + stats.successNum + '张照片，' +
                                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片'
                            }

                        } else {
                            stats = uploader.getStats();
                            text = '共' + fileCount + '张（' +
                                    WebUploader.formatSize(fileSize) +
                                    '），已上传' + stats.successNum + '张';

                            if (stats.uploadFailNum) {
                                text += '，失败' + stats.uploadFailNum + '张';
                            }
                        }

                        $info.html(text);
                    }

                    function setState(val) {
                        var file, stats;

                        if (val === state) {
                            return;
                        }

                        $upload.removeClass('state-' + state);
                        $upload.addClass('state-' + val);
                        state = val;

                        switch (state) {
                            case 'pedding':
                                $placeHolder.removeClass('element-invisible');
                                $queue.hide();
                                $statusBar.addClass('element-invisible');
                                uploader.refresh();
                                break;

                            case 'ready':
                                $placeHolder.addClass('element-invisible');
                                $('#filePicker2').removeClass('element-invisible');
                                $queue.show();
                                $statusBar.removeClass('element-invisible');
                                uploader.refresh();
                                break;

                            case 'uploading':
                                $('#filePicker2').addClass('element-invisible');
                                $progress.show();
                                $upload.text('暂停上传');
                                break;

                            case 'paused':
                                $progress.show();
                                $upload.text('继续上传');
                                break;

                            case 'confirm':
                                $progress.hide();
                                $('#filePicker2').removeClass('element-invisible');
                                $upload.text('开始上传');

                                stats = uploader.getStats();
                                if (stats.successNum && !stats.uploadFailNum) {
                                    setState('finish');
                                    return;
                                }
                                break;
                            case 'finish':
                                stats = uploader.getStats();
                                if (stats.successNum) {
                                } else {
                                    // 没有成功的图片，重设
                                    state = 'done';
                                    location.reload();
                                }
                                break;
                        }

                        updateStatus();
                    }

                    uploader.onUploadProgress = function(file, percentage) {
                        var $li = $('#' + file.id),
                                $percent = $li.find('.progress span');

                        $percent.css('width', percentage * 100 + '%');
                        percentages[file.id][1] = percentage;
                        updateTotalProgress();
                    };

                    uploader.onFileQueued = function(file) {
                        fileCount++;
                        fileSize += file.size;

                        if (fileCount === 1) {
                            $placeHolder.addClass('element-invisible');
                            $statusBar.show();
                        }

                        addFile(file);
                        setState('ready');
                        updateTotalProgress();
                    };

                    uploader.onFileDequeued = function(file) {
                        fileCount--;
                        fileSize -= file.size;

                        if (!fileCount) {
                            setState('pedding');
                        }

                        removeFile(file);
                        updateTotalProgress();

                    };

                    uploader.on('all', function(type) {
                        var stats;
                        switch (type) {
                            case 'uploadFinished':
                                setState('confirm');
                                break;

                            case 'startUpload':
                                setState('uploading');
                                break;

                            case 'stopUpload':
                                setState('paused');
                                break;

                        }
                    });

                    uploader.onError = function(code) {
                        //alert('Eroor: ' + code);
                    };

                    $upload.on('click', function() {
                        if ($(this).hasClass('disabled')) {
                            return false;
                        }

                        if (state === 'ready') {
                            uploader.upload();
                        } else if (state === 'paused') {
                            uploader.upload();
                        } else if (state === 'uploading') {
                            uploader.stop();
                        }
                    });

                    $info.on('click', '.retry', function() {
                        uploader.retry();
                    });

                    $info.on('click', '.ignore', function() {
                        //alert('todo');
                    });

                    $upload.addClass('state-' + state);
                    updateTotalProgress();
                });

            })(jQuery);
        </script>
    </div>

</div>
<script src="${staticServePath}/js/lib/jquery/jquery.min.js"></script>
<script src="${staticServePath}/js/lib/layer/layer/layer.js"></script>
<script type="text/javascript">
    function corpper() {
        //页面一打开就执行，放入ready是为了layer所需配件（css、扩展模块）加载完毕
        layer.ready(function() {
            layer.open({
                type: 2,
                title: '修图小工具',
                maxmin: true,
                area: ['100%', '100%'],
                content: '${nginxHost}:${nginxProt}/photo-editor/'
            });
        });
    }
</script>
</@admin>
