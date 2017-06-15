<#include "macro-head.ftl">
<#include "macro-pagination-query.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${video.videoTitle} - ${symphonyLabel}">
        <meta name="keywords" content="${video.videoTag}" />
        <meta name="description" content="${video.videoRemarks}"/>
        </@head>

        <link href="${staticServePath}/js/lib/video.js/css/video-js.css" rel="stylesheet">
            <!-- If you'd like to support IE8 --><script src="${staticServePath}/js/lib/video.js/js/videojs-ie8.min.js"></script>
        <link rel="stylesheet" href="${staticServePath}/js/lib/highlight.js-9.6.0/styles/github.css">
        <link rel="stylesheet" href="${staticServePath}/css/index.css?${staticResourceVersion}" />
        <link rel="stylesheet" href="${staticServePath}/js/lib/editor/codemirror.min.css?${staticResourceVersion}">

        <!-- Open Graph -->
        <meta property="og:locale" content="zh_CN" />
        <meta property="og:type" content="article" />
        <meta property="og:title" content="${video.videoTitle} - ${symphonyLabel}" />
        <meta property="og:description" content="${video.videoRemarks}" />
        <meta property="og:image" content="${video.videoImgPath}" />
        <meta property="og:url" content="${servePath}${video.videoUrl}" />
        <meta property="og:site_name" content="BrickCat" />
        <!-- Twitter Card -->
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:description" content="${video.videoRemarks}" />
        <meta name="twitter:title" content="${video.videoTitle} - ${symphonyLabel}" />
    </head>
    <body itemscope itemtype="http://schema.org/Product" class="article" oncontextmenu=self.event.returnValue=false onselectstart="return false">

        <#include "header.ftl">
        <div class="article-body">
            <div class="wrapper">
                <div class="article-info fn-flex">
                <a rel="author" href="${servePath}/member/<#--用户名-->"><div
                        class="avatar-mid tooltipped tooltipped-se" aria-label="admin<#--用户名-->" style="background-image:url('/*图片URL*/')"></div></a>
                    <div class="fn-flex-1 fn-ellipsis">
                    <a rel="author" href="${servePath}/member/<#--发布人姓名-->" class="ft-gray"><strong class="ft-gray"><#--发布人NAME-->admin</strong></a>

                        <br/>

                        <span class="ft-gray">${symphonyLabel} 2<#--几号会员--> ${numVIPLabel}</span>

                        <br/>
                        <span class="ft-gray">
                                &nbsp;
                                <a rel="nofollow" class="ft-gray" href="#comments">
                                    <b class="article-level<#--<#if article.articleCommentCount lt 40>${(article.articleCommentCount/10)?int}<#else>评论级数-->3">5<#--评论数--></b> ${cmtLabel}</a>
                                &nbsp;•&nbsp;
                                <span class="article-level<#--<#if article.articleViewCount lt 400>${(article.articleViewCount/100)?int}<#else> 查看级数-->3">
                                <#--<#if article.articleViewCount < 1000>
                                ${article.articleViewCount}
                                <#else>
                                ${article.articleViewCntDisplayFormat}
                                </#if>-->
                                <#--大于1000后格式化输出-->
                                    10
                                </span>
                        ${viewLabel}
                                &nbsp;•&nbsp;
                        <#--${article.timeAgo}多久前--> 1小时前
                            </span>
                    </div>
                    <#-- 点赞踩编辑 -->
                    <div class="article-actions action-btns">
                        <span class="tooltipped tooltipped-n<#--<#if isLoggedIn && 0 == article.articleVote> ft-red</#if>--> 是否点赞" aria-label="${upLabel}"
                        <#if permissions["commonGoodArticle"].permissionGrant>
                              onclick="Article.voteUp('<#--${article.oId}-->', 'article', this)"
                        <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-up"></span> <#--点赞数-->1</span> &nbsp;

                        <span  class="tooltipped tooltipped-n<#--<#if isLoggedIn && 1 == article.articleVote> ft-red</#if>-->" aria-label="${downLabel}"
                        <#if permissions["commonBadArticle"].permissionGrant>
                               onclick="Article.voteDown('<#--${article.oId}-->', 'article', this)"
                        <#else>
                               onclick="Article.permissionTip(Label.noPermissionLabel)"
                        </#if>><span class="icon-thumbs-down"></span> <#--反对数-->1</span> &nbsp;

                    <#--<#if isLoggedIn && isFollowing>-->
                    <#--取消收藏-->
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${uncollectLabel}"
                           <#-- <#if permissions["commonFollowArticle"].permissionGrant>
                              onclick="Util.unfollow(this, '&lt;#&ndash;${article.oId}&ndash;&gt;', 'article', &lt;#&ndash;${article.articleCollectCnt}收藏数&ndash;&gt;)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span>&lt;#&ndash; ${article.articleCollectCnt}&ndash;&gt;1</span>-->
                    <#--<#else>-->
                    <#--收藏-->
                        <span class="tooltipped tooltipped-n" aria-label="${collectLabel}"
                            <#if permissions["commonFollowArticle"].permissionGrant>
                              onclick="Util.follow(this, '<#--${article.oId}-->', 'article', <#--${article.articleCollectCnt}-->)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-star"></span> <#--${article.articleCollectCnt}-->1</span>
                    <#--</#if>--> &nbsp;

                   <#-- <#if isLoggedIn && isWatching>-->
                    <#--取消关注-->
                        <span class="tooltipped tooltipped-n ft-red" aria-label="${unfollowLabel}"
                            <#if permissions["commonWatchArticle"].permissionGrant>
                              onclick="Util.unfollow(this, '<#--${article.oId}'-->, 'article-watch', <#--${article.articleWatchCnt}-->)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-view"></span> <#--${article.articleWatchCnt}-->0</span>
                    <#--<#else>-->
                    <#--关注-->
                        <#--<span class="tooltipped tooltipped-n" aria-label="${followLabel}"
                            <#if permissions["commonWatchArticle"].permissionGrant>
                              onclick="Util.follow(this, '&lt;#&ndash;${article.oId}&ndash;&gt;', 'article-watch', &lt;#&ndash;${article.articleWatchCnt}&ndash;&gt;)"
                            <#else>
                              onclick="Article.permissionTip(Label.noPermissionLabel)"
                            </#if>><span class="icon-view"></span> &lt;#&ndash;${article.articleWatchCnt}&ndash;&gt;1</span>-->
                    <#--</#if>--> &nbsp;
                    <#--置顶-->
                    <#if <#--article.isMyArticle && -->permissions["commonStickArticle"].permissionGrant>
                        <a class="tooltipped tooltipped-n" aria-label="${stickLabel}"
                           href="javascript:Article.stick('<#--${article.oId}-->')"><span class="icon-chevron-up"></span></a> &nbsp;
                    </#if>
                    <#--编辑-->
                    <#if <#--article.isMyArticle && 3 != article.articleType &&--> permissions["commonUpdateArticle"].permissionGrant>
                        <a href="${servePath}/update?id=<#--${article.oId}-->" aria-label="${editLabel}"
                           class="tooltipped tooltipped-n"><span class="icon-edit"></span></a> &nbsp;
                    </#if>
                    <#--管理-->
                    <#if permissions["articleUpdateArticleBasic"].permissionGrant>
                        <a class="tooltipped tooltipped-n" href="${servePath}/admin/article/<#--${article.oId}-->" aria-label="${adminLabel}"><span class="icon-setting"></span></a> &nbsp;
                    </#if>
                    </div>
                </div>
                <#--标题-->
                <h1 class="article-title">
                    ${video.videoTitle}
                </h1>
                <div  class="aplayer">
                    <video id="my-video" class="video-js vjs-default-skin" controls preload="auto" width="840" height="384" poster="${servePath}${video.videoImgPath}" data-setup='{ "aspectRatio":"840:384", "playbackRates": [1, 1.5, 2] }'>
                        <source src="${servePath}${video.videoUrl}" type="video/mp4">
                    </video>
                    <script src="${staticServePath}/js/lib/video.js/js/video.min.js"></script>
                    <script type="text/javascript">
                        var myPlayer = videojs('my-video');
                        videojs("my-video").ready(function() {
                            var myPlayer = this;
                            myPlayer.play();
                            myPlayer.volume(0.5);
                        });
                    </script>
                </div>
            </div>
        </div>
        <#include "footer.ftl">
    </body>
</html>
