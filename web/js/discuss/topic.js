$(function () {
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
                topicid: sg.common.param("id"),
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