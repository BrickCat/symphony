/*
 * Symphony - A modern community (forum/SNS/blog) platform written in Java.
 * Copyright (C) 2012-2017,  b3log.org & hacpai.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
 * @fileoverview article page and add comment.
 *
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @version 1.38.54.34, May 7, 2017
 */

/**
 * @description Add comment function.
 * @static
 */
var Comment = {
    trendetail:function (trendId) {
        if (!Label.isLoggedIn) {
            Util.needLogin();
            return false;
        }
        window.location.href=Label.servePath+'/trend/'+trendId+"/info";

    },
    trendGIft:function (trendId) {
        if (!Label.isLoggedIn) {
            Util.needLogin();
            return false;
        }
    }

};

var Trend = {
    /**
     * @description 没有权限的提示
     * @param {String} tip 提示内容
     */
    permissionTip: function (tip) {
        if (Label.isLoggedIn) {
            Util.alert(tip);
        } else {
            Util.needLogin();
        }
    },
    /**
     * @description 赞同
     * @param {String} id 赞同的实体数据 id
     * @param {String} type 赞同的实体类型
     */
    voteUp: function (id, type, it) {
        if (!Label.isLoggedIn) {
            Util.needLogin();
            return false;
        }

        var $voteUp = $(it);
        var $voteDown = $('#down');

        if ($voteUp.hasClass("disabled")) {
            return false;
        }

        var requestJSONObject = {
            dataId: id
        };

        $voteUp.addClass("disabled");

        $.ajax({
            url: Label.servePath + "/vote/up/" + type,
            type: "POST",
            cache: false,
            data: JSON.stringify(requestJSONObject),
            success: function (result, textStatus) {
                $voteUp.removeClass("disabled");
                var upCnt = parseInt($voteUp.text()),
                    downCnt = parseInt($voteDown.text());
                if (result.sc) {
                    if (0 === result.type) { // cancel up
                        $voteUp.html('<span class="icon-thumbs-up"></span> ' + (upCnt - 1)).removeClass('ft-red');
                    } else {
                        $voteUp.html('<span class="icon-thumbs-up"></span> ' + (upCnt + 1)).addClass('ft-red');
                        /*if ($voteDown.hasClass('ft-red')) {
                            $voteDown.html('<span class="icon-thumbs-down"></span> ' + (downCnt - 1)).removeClass('ft-red');
                        }*/
                    }

                    return;
                }

                alert(result.msg);
            }
        });
    },
    /**
     * @description 反对
     * @param {String} id 反对的实体数据 id
     * @param {String} type 反对的实体类型
     */
    voteDown: function (id, type, it) {
        if (!Label.isLoggedIn) {
            Util.needLogin();
            return false;
        }
        var $voteDown = $(it);
        var $voteUp = $('#up');

        if ($voteDown.hasClass("disabled")) {
            return false;
        }

        var requestJSONObject = {
            dataId: id
        };

        $voteDown.addClass("disabled");

        $.ajax({
            url: Label.servePath + "/vote/down/" + type,
            type: "POST",
            cache: false,
            data: JSON.stringify(requestJSONObject),
            success: function (result, textStatus) {
                $voteDown.removeClass("disabled");
                var upCnt = parseInt($voteUp.text()),
                    downCnt = parseInt($voteDown.text());
                if (result.sc) {
                    if (1 === result.type) { // cancel down
                        $voteDown.html('<span class="icon-thumbs-down"></span> ' + (downCnt - 1)).removeClass('ft-red');
                    } else {
                        $voteDown.html('<span class="icon-thumbs-down"></span> ' + (downCnt + 1)).addClass('ft-red');
                        alert($voteUp.hasClass('ft-red'));
                        if ($voteUp.hasClass('ft-red')) {
                            $voteUp.html('<span class="icon-thumbs-up"></span> ' + (upCnt - 1)).removeClass('ft-red');
                        }
                    }

                    return false;
                }

                alert(result.msg);
            }
        });
    },

    /**
     * @description 置顶
     */
    stick: function (trendId) {
        var r = confirm(Label.stickVideoConfirmLabel);

        if (r) {
            $.ajax({
                url: Label.servePath + "/video/stick?videoId=" + trendId,
                type: "POST",
                cache: false,
                success: function (result, textStatus) {
                    alert(result.msg);

                    window.location.href = Label.servePath + "/recent";
                }
            });
        }
    }, /**
     * @description 感谢文章
     */
    thank: function (trendId,userId,it) {
        if (!Label.isLoggedIn) {
            Util.needLogin();
            return false;
        }

        if(userId == Label.currentUserId){
            alert(Label.thankSelfLabel);
            return false;
        }

        var $thank = $(it);

        if ($thank.hasClass("disabled")) {
            return false;
        }

        if ($thank.hasClass("ft-red")) {
            alert(Label.trendAlreadyThankLabel);
            return false;
        }

        // 匿名贴不需要 confirm
        if (!confirm(Label.thankArticleConfirmLabel)) {
            return false;
        }

        $thank.addClass("disabled");

        $.ajax({
            url: Label.servePath + "/trend/thank?trendId=" + trendId,
            type: "POST",
            cache: false,
            success: function (result, textStatus) {
                $thank.removeClass("disabled");
                var thxCnt = parseInt($thank.text())
                if (result.sc) {
                    $thank.removeAttr("onclick").html('<span class="icon-goods"></span>&nbsp;' + (thxCnt + 1))
                        .addClass('ft-red');

                    return false;
                }
                alert(result.msg);
            }
        });
    }
};
