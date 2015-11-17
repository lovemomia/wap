<@override name="title">邀请好友</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/user/share.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>邀请好友</div>
    <div class="content">
        <div><img src="/img/yaoqing.png"></div>
        <div class="top-margin bottom-margin"><button id="btn_share" class="btn-lg-orange">邀请好友</button></div>
        <div class="desc">
            <p>发红包邀请新用户好友，好友使用你的红包后，</p>
            <p>你可以获得50元返现哦~</p>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/jquery.sonar.min.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/user/share.js"></script>
    <script type="text/javascript">
        if (sg.common.is_weixin()) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: '${share.config.appId}', // 必填，公众号的唯一标识
                timestamp: ${share.config.timeStamp}, // 必填，生成签名的时间戳
                nonceStr: '${share.config.nonceStr}', // 必填，生成签名的随机串
                signature: '${share.config.sign}',// 必填，签名，见附录1
                jsApiList: ['onMenuShareAppMessage', 'onMenuShareTimeline'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });

            wx.ready(function() {
                wx.onMenuShareAppMessage({
                    title: '${share.title}',
                    desc: '${share.abstracts}',
                    link: '${share.url}',
                    imgUrl: 'http://s.sogokids.com/2015-11-17/4420a00e1af555d397888ffdf8101d4a.jpg'
                });

                wx.onMenuShareTimeline({
                    title: '${share.title}',
                    link: '${share.url}',
                    imgUrl: 'http://s.sogokids.com/2015-11-17/4420a00e1af555d397888ffdf8101d4a.jpg'
                });
            });
        }
    </script>
</@override>

<@extends name="../base.ftl"/>
