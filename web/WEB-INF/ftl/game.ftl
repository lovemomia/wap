<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>你在西游记里可以打败谁?</title>
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="msapplication-tap-highlight" content="no">

	<link rel="stylesheet" href="/css/game.css">
</head>
<body class="wap-box">
<audio src="/" autoplay="autoplay" id="myaudio" name="myaudio" hidden="hidden"></audio>
<div id="audioPlay"></div>
<div class="wap-contain" id="warper">
	<div class="div_loading"><img id="home_load" src="/images/loading.gif" width="100%"></div>

</div>
<div class="div_footer">
	<p><img src="/images/d.png" width="100%" alt=""></p>
</div>
<script type="text/javascript" src="/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/js/config_v2.js"></script>
<script type="text/javascript" src="/js/main_v2.js"></script>
<script type="text/javascript" src="/js/game.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
    if (sg.common.is_weixin()) {
        wx.config({
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: '${share.config.appId}', // 必填，公众号的唯一标识
            timestamp: ${share.config.timeStamp}, // 必填，生成签名的时间戳
            nonceStr: '${share.config.nonceStr}', // 必填，生成签名的随机串
            signature: '${share.config.sign}',// 必填，签名，见附录1
            jsApiList: ['onMenuShareAppMessage','onMenuShareTimeline','hideMenuItems'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        });

        wx.ready(function() {

            wx.onMenuShareAppMessage({
                title: '西游记第八十二难',
                desc: '师父被妖怪抓走啦,快来答题救师父吧!',
                link: 'http://m.sogokids.com/game',
                imgUrl: 'http://s.sogokids.com/2016-02-04/20ea1d23080245c97ed4388324427dd9.jpg',
                success: function () {

                }
            });

            wx.onMenuShareTimeline({
                title: '西游记第八十二难',
                desc: '师父被妖怪抓走啦,快来答题救师父吧!',
                link: 'http://m.sogokids.com/game',
                imgUrl: 'http://s.sogokids.com/2016-02-04/20ea1d23080245c97ed4388324427dd9.jpg'
            });

            wx.hideMenuItems({
                menuList: [
                    'menuItem:share:qq',
                    'menuItem:share:weiboApp',
                    'menuItem:favorite',
                    'menuItem:share:facebook',
                    'menuItem:share:QZone',
                    'menuItem:editTag',
                    'menuItem:delete',
                    'menuItem:copyUrl',
                    'menuItem:originPage',
                    'menuItem:readMode',
                    'menuItem:openWithQQBrowser',
                    'menuItem:openWithSafari',
                    'menuItem:share:email',
                    'menuItem:share:brand'
                ] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
            });
        });
    }
</script>
</body>
</html>