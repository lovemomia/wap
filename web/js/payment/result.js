$(function () {
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
});

sg.result = {
    success: function (data) {
        if (data.payed == true) {
            $(".content .title").html("购买成功");
            $(".content .desc").html("您已购买成功，请提前选课，并预约");
            var html = "";
            html += "<div class='btn'>";
            html += "<div class='left'><button id='btn_booking' class='btn-orange'>预约上课</button></div>";
            html += "<div class='right'><button id='btn_order' class='btn-main'>查看订单</button></div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";

            $(".content").append(html);

            $("#btn_booking").on("click", function () {
                var oid = sg.common.param("oid");
                window.location.href = "/user/bookable?oid=" + oid;
            });

            $("#btn_order").on("click", function () {
                window.location.href = "/user/order?status=3";
            });
        } else {
            $(".content .title").html("付款失败");
            $(".content .desc").html("如果支付系统已扣款，请与客服联系");
        }
    }
};