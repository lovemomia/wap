$(function () {
    //if (!sg.common.is_weixin()) {
    //    alert("送礼功能目前只支持微信哦~");
    //    window.location.href = "/";
    //}

    if (!sg.common.is_login()) {
        sg.common.redirect_login();
    } else {
        var oid = sg.common.param("oid");
        sg.common.post(sg.config.api_ssl + "/payment/check", {
            utoken: sg.common.cookie.get("utoken"),
            oid: oid
        }, sg.result.success);
    }

    $(".back").on("click", function () {
        window.location.href = "/";
    });

    $("#btn_send").on("click", function () {
        var html = "";
        html += "<div class='share_tips' onclick='$(this).remove()'>";
        html += "<img src='/img/share.png' />";
        html += "</div>";
        $(document.body).append(html);
    });
});

sg.result = {
    success: function (data) {
        if (data.payed == true) {
            $(".content .title").html("购买成功");
            $(".content .desc").html("您已购买成功，快去送给好友吧~");
            var html = "";
            html += "<div class='btn'>";
            html += "<button id='btn_send' class='btn-orange'>送给好友</button></div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";

            $(".content").append(html);

            $("#btn_send").on("click", function () {
                alert("ok");
            });
        } else {
            $(".content .title").html("付款失败");
            $(".content .desc").html("如果支付系统已扣款，请与客服联系");
        }
    }
};