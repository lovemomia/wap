<@override name="title">支付结果</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/payment/result.css">
    <style type="text/css">
        .btn #btn_send {
            margin-top: 0.3rem;
        }

        .share_tips {
            position: fixed;
            z-index: 20;
            top: 0;
            left: 0;
            padding: 0 0.1rem;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
        }

        .share_tips img {
            width: 3.8rem;
            height: 0.9rem;
        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>支付结果</div>
    <div class="content">
        <div class="logo"><img src="/img/logo3x.png"></div>
        <div class="title"></div>
        <div class="desc"></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/gift/result.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        if (sg.common.is_weixin()) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: '${share.config.appId}', // 必填，公众号的唯一标识
                timestamp: ${share.config.timeStamp}, // 必填，生成签名的时间戳
                nonceStr: '${share.config.nonceStr}', // 必填，生成签名的随机串
                signature: '${share.config.sign}',// 必填，签名，见附录1
                jsApiList: ['onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });

            wx.ready(function() {
                wx.onMenuShareAppMessage({
                    title: '新年送礼',
                    desc: '新年送礼',
                    link: '${share.url}',
                    imgUrl: 'http://m.momia.cn/',
                    success: function () {
                        sg.common.post(sg.config.api + "/subject/order/gift/send", {
                            utoken: sg.common.cookie.get("utoken"),
                            oid: sg.common.param("oid")
                        }, function (data) {
                            if (data == true) alert("新年礼物已经发送给朋友了哦~");
                            else alert("新年礼物赠送失败，请与客服联系");
                        });
                    }
                });
            });
        }
    </script>
</@override>

<@extends name="../base.ftl"/>
