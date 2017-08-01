var trends = {
    comment:function (id) {
        alert(id);
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
        var $voteDown = $voteUp.next();

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
                        if ($voteDown.hasClass('ft-red')) {
                            $voteDown.html('<span class="icon-thumbs-down"></span> ' + (downCnt - 1)).removeClass('ft-red');
                        }
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
        var $voteUp = $voteDown.prev();

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
                        ;
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

};