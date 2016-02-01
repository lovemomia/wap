$(function () {
    if (!sg.common.is_weixin()) {
        alert("送礼功能目前只支持微信哦~");
        window.location.href = "/";
    }

    $("#btn_receive").on("click", function () {
        if (!sg.common.is_login()) {
            alert("本新年礼包只有松果亲子的注册用户才能领取哦，您还没有登录，点击“确定”前往登录页面（未注册的用户需要先注册），登录后再来领取吧~")
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
                    window.location.href = "/user/bookable";
                } else {
                    alert("新年礼物领取失败，请与客服联系");
                }
            });
        }
    });
});