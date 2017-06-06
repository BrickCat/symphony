<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "video">
<link href="${staticServePath}/js/lib/video.js/css/video-js.css" rel="stylesheet">
<!-- If you'd like to support IE8 -->
<script src="${staticServePath}/js/lib/video.js/js/video.min.js"></script>
<div class="content admin">
    <div class="wrapper">
        <h1 class="article-title" itemprop="name">
            ${video.videoTitle}
        </h1>
    </div>
    <video id="my-video" class="video-js" controls preload="auto" width="640" height="264" poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
        <source src="${video.videoUrl}" type="video/mp4">
        <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
        </p>
    </video>
</div>
<script type="text/javascript">
    var myPlayer = videojs('my-video');
    videojs("my-video").ready(function() {
        var myPlayer = this;
        myPlayer.play();
        myPlayer.volume(5);
    });
</script>
</@admin>
