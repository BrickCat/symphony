<#include "macro-admin.ftl">
<@admin "addVideo">
<div class="content" xmlns="http://www.w3.org/1999/html">
    <link href="${staticServePath}/js/lib/webuploader/webuploader.css" type="text/css">
    <div class="module">
        <div class="module-header">
            <h2>${videoURl}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <div id="uploader" class="wu-example">
                <!--用来存放文件信息-->
                <div id="thelist" class="uploader-list"></div>
                <div class="btns">
                    <div id="picker">选择文件</div>
                    <button id="ctlBtn" class="btn btn-default">开始上传</button>
                </div>
            </div>
        </div>
        <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="${staticServePath}/js/lib/webuploader/webuploader.min.js"></script>
        <script type="text/javascript">
            function uploads() {
                alert(1);
            }
            var uploader = WebUploader.create({

                //swf路径
                swf:'${staticServePath}/js/lib/webuploader/Uplaoder.swf',

                //文件服务器路径
                server:'${servePath}/upload?type=1',

                pick:'#picker',

                threads:2,

                // 开起分片上传。
                chunked: true,

                //每片大小
                chunkSize:10*1024*1024,

                //是否压缩
                resize:false
            });

            uploader.on( 'fileQueued', function( file ) {
                alert(1);
            });

            uploader.on( 'uploadProgress', function( file, percentage ) {
                var $li = $( '#'+file.id ),
                        $percent = $li.find('.progress .progress-bar');

                // 避免重复创建
                if ( !$percent.length ) {
                    $percent = $('<div class="progress progress-striped active">' +
                            '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                            '</div>' +
                            '</div>').appendTo( $li ).find('.progress-bar');
                }

                $li.find('p.state').text('上传中');

                $percent.css( 'width', percentage * 100 + '%' );
            });


            uploader.on( 'uploadSuccess', function( file ) {
                $( '#'+file.id ).find('p.state').text('已上传');
            });

            uploader.on( 'uploadError', function( file ) {
                $( '#'+file.id ).find('p.state').text('上传出错');
            });

            uploader.on( 'uploadComplete', function( file ) {
                $( '#'+file.id ).find('.progress').fadeOut();
            });

            $('#ctlBtn').on('click',function () {
                uploader.upload();
            })
        </script>
    </div>
    <div class="module">
        <div class="module-header">
            <h2>${videoAddLabel}</h2>
        </div>
        <div class="module-panel form fn-clear">
            <form class="fn-right form" action="${servePath}/upload?type=1" method="POST" enctype="multipart/form-data">
                <label for="videoTitle">${videoTitle}</label>
                <input name="videoTitle" type="text"/>

                <label for="videoTag">${videoTag}</label>
                <input name="videoTag" type="text"/>

                <label for="videoRemarks">${videoRemarks}</label>
                <textarea name="videoRemarks" rows="5"></textarea>

                <label for="videoType">${videoType}</label>
                <select id="videoType" name="videoType">
                    <option value="0" >${videoTypeTrue}</option>
                    <option value="1" >${videoTypeFalse}</option>
                </select>

                <label for="videoPoint">${videoPoint}</label>
                <input name="videoPoint" type="number" value="0"/>

                <label>${videoStatus}</label>
                <select id="videoStatus" name="videoStatus">
                    <option value="0" >${videoStatusTrue}</option>
                    <option value="1" >${videoStatusFalse}</option>
                </select>
                <label>${videoImage}</label>
                <select id="videoImage" name="videoImage">
                    <option value="0" >${videoImageTrue}</option>
                    <option value="1" >${videoImageFalse}</option>
                </select>
                <label class="btn red">
                    ${videoURl}<input type="file" name="file">
                </label>
                <label >
                    <p class="ft-red" style="margin-top: 5px; margin-left: 10px">目前只支持MP4格式的视频</p>
                </label>

                <br/><br/><br/>
                <button type="submit" class="green fn-right">${submitLabel}</button>
            </form>
        </div>
    </div>
</div>
</@admin>
