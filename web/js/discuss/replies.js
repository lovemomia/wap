$(function () {
    var topicid = sg.common.param("topicid", 0);
    sg.replies.more(topicid, 0);

    $("#btn_join").on("click", click_join);

    function click_join () {
        if (!sg.common.is_login()) {
            if (confirm("需要登录后才能发表看法，快去登录吧")) sg.common.redirect_login();
        } else {
            var html = "";
            html += "<div>";
            html += "<textarea id='reply_content' placeholder='说说你的看法吧（200字以内）' />";
            html += "<button id='btn_reply' class='btn-main'>发表</button>";
            html += "<button id='btn_cancel' class='btn-main'>取消</button>";
            html += "</div>";

            $(".content").addClass("has-textarea");
            $(".footer").addClass("has-textarea");
            $(".footer").html(html);

            $("#btn_reply").on("click", click_reply);
            $("#btn_cancel").on("click", click_cancel);
        }
    }

    function click_reply () {
        var content = $("#reply_content").val();
        if (!content || content == "") {
            alert("内容不能为空");
        } else if (content.length > 200) {
            alert("字数超出限制");
        } else {
            sg.common.post(sg.config.api + "/discuss/reply", {
                utoken: sg.common.cookie.get("utoken"),
                topicid: sg.common.param("topicid"),
                content: content,
            }, function () {
                alert("发表成功");
                $(".new-reply").append("<p>新发表：" + content + "</p>");
                click_cancel();
            });
        }
    }

    function click_cancel () {
        $(".footer").html("<button id='btn_join' class='btn-orange'>参与讨论</button>");
        $(".content").removeClass("has-textarea");
        $(".footer").removeClass("has-textarea");

        $("#btn_join").on("click", click_join);
    }
});

sg.replies = {
    more: function (topicid, start) {
        sg.common.get(sg.config.api + "/discuss/topic", {
            utoken: sg.common.cookie.get("utoken"),
            id: topicid,
            start: start
        }, sg.replies.success);
    },

    success: function (data) {
        var replies = data.replies;
        var totalCount = replies.totalCount;
        if (totalCount > 0) {
            $("#totalCount").html(totalCount);
            var list = replies.list;
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_replie_html(list[i]);
                if (i < list.length - 1) html += "<hr class='left-margin' />";
            }
            html += "</div>";

            $(".content").append(html);

            if (replies.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.replies.more(sg.common.param("topicid"), replies.nextIndex);
            });
        } else {
            var html = "";
            html += "<div class='logo'><img src='/img/logo3x.png'></div>";
            html += "<div class='tips'>";
            html += "<p>目前还没有人参与讨论，快来发表下你的观点吧~</p>";
            html += "</div>";

            $(".content").html(html);
        }

        function generate_replie_html(reply) {
            var html = "";

            html += "<div class='reply scrollable'>";
            html += "<div class='reply-avatar left'>";
            if (reply.avatar.length> 0) html += "<img src='" + reply.avatar + "' />";
            else html += "<img src='/img/avatar02.png' />";
            html += "</div>";
            html += "<div class='reply-info right top-margin bottom-margin'>";
            html += "<div>";
            html += "<div class='nickname left'>" + reply.nickName + "</div>";
            html += "<div class='addtime right'>" + reply.addTime + "</div>";
            html += "<div style='clear:both'></div>";
            html += "</div>";
            html += "<div>";
            if (reply.children.length > 0) html += "<div class='children left'>" + reply.children[0] + "</div>";
            html += "<div style='clear:both'></div>";
            html += "</div>";
            html += "<div class='reply-content'>" + reply.content + "</div>";
            html += "<div class='reply-star'>";
            if (reply.stared) html += "<img class='left star' src='/img/zan_active3x.png' reply-id='" + reply.id + "' stared='1' star-count='" + reply.staredCount + "' />";
            else html += "<img class='left star' src='/img/zan3x.png' reply-id='" + reply.id + "' stared='0' star-count='" + reply.staredCount + "' />";
            html += "<span>" + reply.staredCount + "</span>";
            html += "</div>";
            html += "</div>";
            html += "<div style='clear:both'></div>";
            html += "</div>";

            return html;
        }

        $(".star").on("click", function () {
            if (!sg.common.is_login()) {
                if (confirm("需要登录后才能操作，快去登录吧")) sg.common.redirect_login();
            } else {
                var reply_id = $(this).attr("reply-id");
                var stared = $(this).attr("stared");
                var star_count = $(this).attr("star-count");
                var star = $(this);
                if (stared == 1) {
                    sg.common.post(sg.config.api + "/discuss/reply/unstar", {
                        utoken: sg.common.cookie.get("utoken"),
                        replyid: reply_id
                    }, function () {
                        star.attr("src", "/img/zan3x.png");
                        star.attr("stared", 0);
                        star.attr("star-count", Math.max(0, star_count - 1));
                        star.next().html(Math.max(0, star_count - 1));
                    });
                } else {
                    sg.common.post(sg.config.api + "/discuss/reply/star", {
                        utoken: sg.common.cookie.get("utoken"),
                        replyid: reply_id
                    }, function () {
                        star.attr("src", "/img/zan_active3x.png");
                        star.attr("stared", 1);
                        star.attr("star-count", Math.max(0, star_count + 1));
                        star.next().html(Math.max(0, star_count + 1));
                    });
                }
            }
        });
    }
};