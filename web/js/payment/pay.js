$(function () {
    sessionStorage.removeItem("payment");

    var html = "";
    if (sg.common.is_weixin()) {
        html += "<div pay_type='weixin' class='line large payment'>";
        html += "<div class='left img'><img src='/img/weixin.png' /></div>";
        html += "<div class='left desc'>";
        html += "<div class='name'>微信支付</div>";
        html += "<div class='tip'>推荐已安装微信的用户使用</div></div>";
        html += "<div class='right sel'><img src='/img/sel2x.png' /></div></div>";
        sessionStorage.setItem("payment", "weixin");
    } else {
        html += "<div pay_type='ali' class='line large payment'>";
        html += "<div class='left img'><img src='/img/ali.png' /></div>";
        html += "<div class='left desc'>";
        html += "<div class='name'>支付宝支付</div>";
        html += "<div class='tip'>推荐支付宝用户使用</div></div>";
        html += "<div class='right sel'><img src='/img/sel2x.png' /></div></div>";
        sessionStorage.setItem("payment", "ali");
    }
    $("#pay_types").html(html);

    $(".payment").on("click", function () {
        $(".payment.on .sel img").attr("src", "/img/notsel2x.png");
        $(".payment.on").removeClass("on");

        $(this).addClass("on");
        $(this).children(".sel").children("img").attr("src", "/img/sel2x.png");

        sessionStorage.setItem("payment", $(this).attr("pay_type"));
    });

    $("#btn_pay").on("click", function() {
        var payment = sessionStorage.getItem("payment");
        if (payment == null || (payment != "ali" && payment != "weixin")) {
            alert("请选择一个支付方式");
        } else {
            if (payment == "ali") {
                sg.payment.ali_pay();
            } else {
                sg.payment.weixin_pay();
            }
        }
    });

    if (sg.common.is_weixin()) {
        // 微信支付跳转过来的页面
        var code = sg.common.param("code");
        if (code != null && code != "") {
            sg.payment.do_weixin_pay(code);
        }
    }
});

sg.payment = {
    ali_pay: function () {
        sg.common.post(sg.config.api_ssl + "/payment/prepay/alipay", {
            utoken: sg.common.cookie.get("utoken"),
            oid: sg.common.param("oid"),
            type: "wap"
        }, sg.payment.ali_pre_success, sg.payment.error);
    },

    ali_pre_success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            data = resp.data;
            var param = "_input_charset=" + data.input_charset + "&body=" + data.body + "&it_b_pay=" + data.it_b_pay + "&notify_url=" + encodeURIComponent(data.notify_url) + "&out_trade_no=" + data.out_trade_no + "&partner=" + data.partner + "&payment_type=" + data.payment_type + "&seller_id=" + data.seller_id + "&service=" + data.service + "&sign=" + data.sign + "&sign_type=" + data.sign_type + "&subject=" + data.subject + "&total_fee=" + data.total_fee + "&show_url=" + encodeURIComponent(data.show_url) + "&return_url=" + encodeURIComponent(data.return_url) + "";
            var url = "https://mapi.alipay.com/gateway.do?" + param;
            window.location.href = url;
        }
    },

    weixin_pay: function () {
        var code = sg.common.param("code");
        if (code == null || code == "") {
            var encoded_url = encodeURIComponent(window.location.href);
            window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + sg.config.appid + "&redirect_uri=" + encoded_url + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
        } else {
            sg.payment.do_weixin_pay(code);
        }
    },

    do_weixin_pay: function (code) {
        sg.common.post(sg.config.api_ssl + "/payment/prepay/weixin", {
            utoken: sg.common.cookie.get("utoken"),
            oid: sg.common.param("oid"),
            code: code,
            type: "JSAPI"
        }, sg.payment.weixin_pre_success, sg.payment.error);
    },

    weixin_pre_success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            //判断是否有内置对象
            if (typeof WeixinJSBridge == "undefined") {
                if (document.addEventListener) {
                    document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                } else if (document.attachEvent) {
                    document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                    document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                }
            } else {
                onBridgeReady();
            }

            function onBridgeReady() {
                WeixinJSBridge.invoke(
                    'getBrandWCPayRequest', {
                        "appId": resp.data.appId,
                        "timeStamp": resp.data.timeStamp,
                        "nonceStr": resp.data.nonceStr,
                        "package": resp.data.prepayId,
                        "signType": resp.data.signType,
                        "paySign": resp.data.paySign
                    }, function(res) {
                        if (res.err_msg != "get_brand_wcpay_request:ok") {
                            alert("支付失败: " + res.err_msg);
                        }
                    }
                );

            }
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    }
};