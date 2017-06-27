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
 * @fileoverview Message channel via WebSocket.
 *
 * @author <a href="http://88250.b3log.org">Liang Ding</a>
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @author <a href="http://zephyr.b3log.org">Zephyr</a>
 * @version 1.13.16.19, May 4, 2017
 */

/**
 * @description Article channel.
 * @static
 */
var VideoChannel = {
    /**
     * WebSocket instance.
     * 
     * @type WebSocket
     */
    ws: undefined,
    /**
     * @description Initializes message channel
     */
    init: function (channelServer) {
        VideoChannel.ws = new ReconnectingWebSocket(channelServer);
        VideoChannel.ws.reconnectInterval = 10000;

        VideoChannel.ws.onopen = function () {
            setInterval(function () {
                VideoChannel.ws.send('-hb-');
            }, 1000 * 60 * 3);
        };

        VideoChannel.ws.onmessage = function (evt) {
            var data = JSON.parse(evt.data);
            if (Label.videoOId !== data.articleId) { // It's not the current article
                return;
            }

            switch (data.type) {
                case "comment":
                    var cmtCount = parseInt($(".comments-header .article-cmt-cnt").text()) + 1;
                    // 总帖数更新
                    $(".comments-header .article-cmt-cnt").text(cmtCount + ' ' + Label.cmtLabel);

                    // 新增第一条评论时到底部的锚点
                    if ($('#comments .list > ul > li').length === 0) {
                        $('.comment-header > .fn-none').show();
                        // 显示预览模式 & 回到底部
                        $('.comments-header > .fn-none').show();
                        // 显示评论
                        $("#articleCommentsPanel").parent().show();
                    }

                    if (0 === Label.userCommentViewMode) { // tranditional view mode
                        $("#comments > .list > ul").append(data.cmtTpl);
                    } else {
                        $("#comments > .list > ul").prepend(data.cmtTpl);
                    }

                    // ua
                    $("#" + data.commentId + ' .cmt-via').text(Util.getDeviceByUa(data.commentUA));

                    // 回帖高亮，他人回帖不定位，只有自己回帖才定位
                    if (Label.currentUserName === data.commentAuthorName) {
                        Comment._bgFade($("#" + data.commentId));
                    }

                    // 代码高亮
                    hljs.initHighlighting.called = false;
                    hljs.initHighlighting();

                    // 更新回复的帖子
                    if (data.commentOriginalCommentId !== '') {
                        var $originalComment = $('#' + data.commentOriginalCommentId),
                                $replyBtn = $originalComment.find('.comment-action > .ft-fade > .fn-pointer');
                        if ($replyBtn.length === 1) {
                            $replyBtn.html(' ' + (parseInt($.trim($replyBtn.text())) + 1)
                                    + ' ' + Label.replyLabel + ' <span class="'
                                    + $replyBtn.find('span').attr('class') + '"></span>');

                            if ($replyBtn.find('span').attr('class') === "icon-chevron-up") {
                                $replyBtn.find('span').removeClass('icon-chevron-up').addClass('icon-chevron-down');
                                $replyBtn.click();
                            }
                        } else {
                            $originalComment.find('.comment-action > .ft-fade').prepend('<span class="fn-pointer ft-smaller fn-left" onclick="Comment.showReply(\''
                                    + data.commentOriginalCommentId + '\', this, \'comment-replies\')" style="opacity: 1;"> 1 '
                                    + Label.replyLabel + ' <span class="icon-chevron-down"></span>');
                        }
                    }
                    break;
                default:
                    console.error("Wrong data [type=" + data.type + "]");
            }


        };

        VideoChannel.ws.onclose = function () {
        };

        VideoChannel.ws.onerror = function (err) {
            console.log(err);
        };
    }
};
