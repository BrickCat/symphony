<#include "macro-settings.ftl">
<@home "videoSize">

<div class="module">
    <div class="module-header">
        <h2>${sizeTransferTipLabel}</h2>
        <span class="fn-right">
            <a class="ft-green" href="${servePath}/charge/point">${rechargePointLabel}</a>
        </span>
    </div>
    <div class="module-panel form fn-clear">
        <form action="${servePath}/video/update/${user.oId}/exchange-size" method="POST">
            <label>${videoSizeLabel}</label>
            <select id="userMaxSize" name="userMaxSize">
                <option value="100">${videoSizeNum100M}</option>
                <option value="300">${videoSizeNum300M}</option>
                <option value="500">${videoSizeNum500M}</option>
                <option value="800">${videoSizeNum800M}</option>
                <option value="1000">${videoSizeNum1G}</option>
                <option value="3000">${videoSizeNum3G}</option>
                <option value="5000">${videoSizeNum5G}</option>
            </select>

            <br/><br/>
            <button type="submit" class="green fn-right">${submitLabel}</button>
        </form>
    </div>
</div>
</@home>