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
<body>
<div id="mc_id" class="div_mc"><img style="width:60%;margin-top: 5%;margin-left: 30%;" src="/images/mc_pic.png"></div>
<div id="warper">
        <div class='integral'><p class='tc mtb20 frr divcss4'>${share.res.key}分</p></div>
            <div class='warper'><div class='warper_c'>
                <p class='fbb'>${share.res.start}<br><span class='ft18'>${share.res.name}</span></p>
                <p class='tc mtb20'><img src='${share.res.img}' width='100%' ></p>
                <p class='fbb'><span class='ft18'>${share.res.end}</span><br>${share.res.x_end}</p>
            </div>
                <p class='tc mtb20'></p>
            <p class='mtb20'><a class='postrlt' href='javascript:void(0)' onclick='hb()'>领取技能包</a></p>
            <p class='mtb20'><a class='postrlt' href='javascript:void(0)' onclick='fx()'>快去炫耀战果吧</a></p>
        </div>
</div>
<div style="background-color:#00bbd7">
	<p><img src="/images/d.png" width="100%"></p>
</div>
<script type="text/javascript" src="/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/js/config_v2.js"></script>
<script type="text/javascript" src="/js/main_v2.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
    (function(){
        $('#mc_id').click(function(){
            $('#mc_id').hide();
        });
    })();

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
                title: '${share.res.f_d_text}',
                desc: '${share.res.f_x_text}',
                link: 'http://m.sogokids.com/game',
                imgUrl: 'http://s.sogokids.com/2016-02-04/20ea1d23080245c97ed4388324427dd9.jpg',
                success: function () {

                }
            });

            wx.onMenuShareTimeline({
                title: '${share.res.f_d_text}',
                desc: '${share.res.f_x_text}',
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

    function hb(){
//        window.location.href = "http://m.sogokids.com/hongbao?invite=35fd54fe186314b33b87b21929be4c7e";
        window.location.href = "http://m.sogokids.com/gift/send";
    }

    function fx(){
        $('#mc_id').show();

    }
</script>
</body>
</html>