<div class="footer">
    <div class="wrapper">
        <div class="slogan">
            ${indexIntroLabel} &nbsp; &nbsp;
            <a href="https://github.com/b3log/symphony" target="_blank" class="tooltipped tooltipped-n" aria-label="${siteCodeLabel}">
                <i class="icon-github"></i></a> &nbsp;
            <a href="http://weibo.com/u/2778228501" target="_blank" class="tooltipped tooltipped-n" aria-label="${followWeiboLabel}">
                <i class="icon-weibo"></i></a>   &nbsp;
            <a target="_blank" class="tooltipped tooltipped-n" aria-label="${joinQQGroupLabel}"
               href="http://shang.qq.com/wpa/qunwpa?idkey=981d9282616274abb1752336e21b8036828f715a1c4d0628adcf208f2fd54f3a">
                <i class="icon-qq"></i></a>
        </div>
        <div class="fn-flex-1">
            <div class="footer-nav fn-clear">
                <a rel="help" href="${servePath}/about">${aboutLabel}</a>
                <a href="https://hacpai.com/article/1457158841475">API</a>
                <a href="${servePath}/tag/announcement">${symAnnouncementLabel}</a>
                <a href="${servePath}/domains">${domainLabel}</a>
                <a href="${servePath}/tags">${tagLabel}</a>
                <a href="${servePath}/forge/link">${forgeLabel}</a>
                <a href="${servePath}/statistic">${dataStatLabel}</a>
                <div class="fn-right">&COPY; ${year}
                    <a rel="copyright" href="http://brickcat.club" target="_blank">brickcat.club</a>
                    ${visionLabel}</div>
                </div>
                <div class="fn-clear ft-smaller">
                       ${sloganLabel}
                    <div class="fn-right">
                      感谢 B3log 开源 Powered by <a href="http://b3log.org" target="_blank">B3log 开源</a> •
                            <a href="https://github.com/b3log/symphony" target="_blank">Sym</a>
                            ${version} • ${elapsed?c}ms
                    </div>
                </div>
                <div class="fn-clear ft-smaller">
                    <div class="fn-right">
                        <img src="${staticServePath}/images/pol.png">&nbsp;&nbsp;鲁公网安备 37078602370868号
                    </div>
                </div>
                <div class="fn-clear ft-smaller">
                    <div class="fn-right">
                        鲁 ICP 备 16017582号-2
                    </div>
                </div>

        </div>
    </div>
</div>

<script src="${staticServePath}/js/lib/compress/libs.min.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}"></script>
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
