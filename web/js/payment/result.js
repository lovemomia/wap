$(function () {
    if (!sg.common.is_login()) {
        window.location.href = "/auth/login";
    } else {
        var oid = sg.common.param("oid");
        sg.common.post(sg.config.api_ssl + "/payment/check", {
            utoken: sg.common.cookie.get("utoken"),
            oid: oid
        }, sg.result.success, sg.result.error);
    }
});

sg.result = {
    success: function (resp) {
        if (resp.errno != 0) {
            $(".header").append("查询失败");
            $(".content .title").html("查询失败");
            $(".content .desc").html(resp.errmsg);
        } else {
            var data = resp.data;
            if (data.payed == true) {
                $(".header").append("购买成功");
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
                $(".header").append("付款失败");
                $(".content .title").html("付款失败");
                $(".content .desc").html("如果支付系统已扣款，请与客服联系");
            }
        }
    },

    error: function (resp) {
        $(".header").append("网络异常");
    }
};