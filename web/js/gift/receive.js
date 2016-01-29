$(function () {
    if (!sg.common.is_weixin()) {
        alert("送礼功能目前只支持微信哦~");
        window.location.href = "/";
    }

    $(".back").on("click", function () {
        window.location.href = "/";
    });

    $("#btn_receive").on("click", function () {
        if (!sg.common.is_login()) {
            sg.common.redirect_login();
        } else {
            var oid = sg.common.param("oid");
            var expired = sg.common.param("expired");
            var giftsign = sg.common.param("giftsign");
            sg.common.post(sg.config.api + "/subject/order/gift/receive", {
                utoken: sg.common.cookie.get("utoken"),
                oid: oid,
                expired: expired,
                giftsign: giftsign
            }, function (data) {
                if (data == true) {
                    alert("新年礼物领取成功，快去选课吧~");
                    sg.common.remove_histories();
                    window.location.href = "/user/bookable";
                } else {
                    alert("新年礼物领取失败，请与客服联系");
                }
            });
        }
    });
});