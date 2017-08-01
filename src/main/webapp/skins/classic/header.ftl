<div class="nav">
    <h1 style="line-height: 100%;">
       ${logoIcon}
          <#-- <a href="${servePath}" aria-label="搬砖猫" style="line-height: 100%;color: white;font-size: 16;margin-top: 15px;font-family: Courier;text-decoration:none">
                brickcat.club
           </a>-->
    </h1>
    <div class="nav-tabs">
        <a pjax-title="${latestLabel} - ${symphonyLabel}" href="${servePath}/recent"<#if selected?? && 'recent' == selected> class="current"</#if>>
           <svg height="16" viewBox="0 0 14 16" width="14">${timeIcon}</svg> ${latestLabel}</a>
        <a href="${servePath}/perfect"<#if selected?? && 'perfect' == selected> class="current"</#if>>
           <svg height="16" viewBox="3 2 11 12" width="14">${perfectIcon}</svg> ${perfectLabel}</a>
        <#if isLoggedIn && "" != currentUser.userCity>
        <a href="${servePath}/city/my"<#if selected?? && 'city' == selected> class="current"</#if>>
           <svg height="16" viewBox="0 0 12 16" width="12">${localIcon}</svg> ${currentUser.userCity}</a>
        </#if>
        <a href="${servePath}/timeline"<#if selected?? && 'timeline' == selected> class="current"</#if>>
           <svg height="14" viewBox="0 0 16 14" width="16">${timelineIcon}</svg> ${timelineLabel}</a>
        <#--<a href="https://hacpai.com/tag/book_share"<#if selected?? && 'book' == selected> class="current"</#if>>
           <svg height="16" viewBox="0 -1 17 14" width="16">${bookIcon}</svg> ${bookShareLabel}</a>-->
        <a href="${servePath}/video/front/videos">
           <svg height="16" viewBox="0 -1 17 14" width="16">${videoIcon}</svg> ${videoLabel}</a>
        <a href="${servePath}/trends">
            <svg height="16" viewBox="0 -1 17 14" width="16">${trendsIcon}</svg> ${trendsLabel}</a>
        <a href="${servePath}/mall">
            <svg height="16" viewBox="0 -1 17 14" width="16">${mallIcon}</svg> ${mallLabel}</a>
        <#list domains as domain>
            <a pjax-title="${domain.domainTitle} - ${domainLabel} - ${symphonyLabel}" href="${servePath}/domain/${domain.domainURI}"<#if selected?? && selected == domain.domainURI> class="current"</#if>>${domain.domainIconPath} ${domain.domainTitle}</a>
        </#list>
    </div>
    <#--<#if esEnabled || algoliaEnabled>
    <form class="responsive-hide fn-left" target="_blank" >
        <input class="search" placeholder="Search BrickCat" type="text" name="key" id="typeahead" autoComplete='off'/>
    </form>
    </#if>-->
    <div class="user-nav">
        <a href="javascript:typeaheader();" class="tooltipped tooltipped-w" aria-label="${searchLabel}"><svg height="22" viewBox="0 -1 17 14" width="24">${searchIcon}</svg></a>
        <#if isLoggedIn>
            <a href="${servePath}/pre-post" class="tooltipped tooltipped-w" aria-label="${postArticleLabel}"><span class="icon-addfile"></span></a>
            <#if permissions["menuAdmin"].permissionGrant>
            <a href="${servePath}/admin" aria-label="${adminLabel}" class="tooltipped tooltipped-w"><span class="icon-userrole"></span></a>
            </#if>
            <#if permissions["menuAdmin"].permissionGrant>
            <a href="${servePath}/admin/mall" aria-label="${adminLabel}" class="tooltipped tooltipped-w"><span class="icon-star"></a>
            </#if>
            <a id="aNotifications" class="tooltipped tooltipped-w <#if unreadNotificationCount == 0>no-msg<#else>msg</#if>" href="${servePath}/notifications" aria-label="${messageLabel}">${unreadNotificationCount}</a>
            <a href="${servePath}/activities" aria-label="${activityLabel}" class="tooltipped tooltipped-w"><span class="icon-flag"></span></a>
            <a href="javascript:void(0)" id="aPersonListPanel" class="tooltipped tooltipped-w" aria-label="${viewHomeAndProfileLabel}"
               data-url="${servePath}/member/${currentUser.userName}">
                <span class="avatar-small" style="background-image:url('${currentUser.userAvatarURL20}')"></span>
            </a>
            <div class="module person-list" id="personListPanel">
                <ul>
                    <li>
                        <a href="${servePath}/member/${currentUser.userName}">${goHomeLabel}</a>
                    </li>
                    <li>
                        <a href="${servePath}/settings">${settingsLabel}</a>
                    </li>
                    <#if permissions["menuAdminMind"].permissionGrant>
                    <li>
                        <a href="${servePath}/member/mind">${mindLabel}</a>
                    </li>
                    </#if>
                    <li>
                        <a href="${servePath}/settings/help">${helpLabel}</a>
                    </li>
                    <li>
                        <a href="javascript:Util.logout()">${logoutLabel}</a>
                    </li>
                </ul>
            </div>
        <#else>
            <a href="javascript: Util.goLogin();" class="unlogin">${loginLabel}</a>
            <a href="javascript:Util.goRegister()" class="unlogin">${registerLabel}</a>
        </#if>
    </div>
</div>
<script src="${staticServePath}/js/lib/jquery/jquery.min.js"></script>
<script src="${staticServePath}/js/lib/layer/layer/layer.js"></script>
<script type="text/javascript">
    layer.config({
        extend: 'myskin/style.css', //加载您的扩展样式
        skin: 'layer-class'
    });
    function typeaheader() {
        layer.ready(function() {
            layer.open({
                skin: 'layer-class',
                type: 2,
                zIndex:9999,
                title: '搜索',
                scrollbar:false,
                area: ['800px', '600px'],
                content: '${servePath}/search/typeahead'
            });
        });
    }
</script>