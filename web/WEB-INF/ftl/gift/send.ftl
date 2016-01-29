<@override name="title">新年送礼</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/gift/send.css">
</@override>

<@override name="body">
    <div class="header bg-white"><div class="back left"><img src="/img/back3x.png"></div>新年送礼</div>
    <div class="content top-border bg-white">
        <button id="btn_send" class="btn-lg-orange top-margin">点我送礼</button>
        <button id="btn_share" class="btn-lg-orange top-margin bottom-margin">分享给好友</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/gift/send.js"></script>
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
                    imgUrl: 'http://m.momia.cn/'
                });
            });
        }
    </script>
</@override>

<@extends name="../base.ftl"/>
