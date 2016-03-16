<@override name="title">邀请函</@override>

<@override name="css">
    <style type="text/css">
        body {
            background-color: #00c49d;
        }

        input {
            margin: 0.1rem 0;
            padding: 0 0.125rem;
            width: 3.2rem;
            height: 0.4rem;
            border-color: #e1e1e1;
            font-size: 0.16rem;
            border: none;
            border-radius: 0.05rem;
        }

        .content {
            padding-bottom: 0.5rem;
            text-align: center;
        }

        .btn {
            margin-top: 0.25rem
        }

        .invite {
            margin: 0.1rem auto;
            width: 3.8rem;
            height: 10.45rem;
            background-image: url("http://s.sogokids.com/2016-03-15/02b15033e83048d9ecb181b18fd6b747.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        #btn_submit {
            display: inline-block;
            padding: 0.1rem 0.2rem;
            width: 3.2rem;
            height: 0.51rem;
            font-size: 0.19rem;
            color: #ffffff;
            background-color: transparent;
            background-image: url("/img/invite_btn.png");
            background-repeat: no-repeat;
            background-size: 100% 100%;
            border: none;
        }
    </style>
</@override>

<@override name="body">
    <div class="content">
        <div class="invite"></div>
        <div class="top-padding"><input type="text" id="childname" placeholder="输入孩子姓名" /></div>
        <div><input type="tel" id="mobile" placeholder="输入手机号码" /></div>
        <div class="btn">
            <button id="btn_submit"></button>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        if (sg.common.is_weixin()) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: '${share.config.appId}', // 必填，公众号的唯一标识
                timestamp: ${share.config.timeStamp}, // 必填，生成签名的时间戳
                nonceStr: '${share.config.nonceStr}', // 必填，生成签名的随机串
                signature: '${share.config.sign}',// 必填，签名，见附录1
                jsApiList: ['onMenuShareAppMessage', 'onMenuShareTimeline', 'hideMenuItems'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });

            wx.ready(function() {
                wx.onMenuShareAppMessage({
                    title: '星光幼儿园小小牙医邀请函',
                    desc: '【松果亲子】牙医公益活动进校园，预防蛀牙，从科学护牙开始，现场更有精美礼品等你拿！',
                    link: 'http://m.sogokids.com/invite',
                    imgUrl: 'http://s.sogokids.com/2016-03-15/d936eeb891f9cce382f7de0fa04da31d.jpg'
                });

                wx.onMenuShareTimeline({
                    title: '星光幼儿园小小牙医邀请函',
                    link: 'http://m.sogokids.com/invite',
                    imgUrl: 'http://s.sogokids.com/2016-03-15/d936eeb891f9cce382f7de0fa04da31d.jpg'
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

        $(function () {
            $("#btn_submit").on("click", function () {
                var childName = $("#childname").val();
                var mobile = $("#mobile").val();
                if (!childName || childName == "") {
                    alert("孩子姓名不能为空");
                } else if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
                    alert("无效的手机号吗");
                } else {
                    sg.common.post("/entryform/submit", {
                        childname: childName,
                        mobile: mobile
                    }, function (data) {
                        alert("您已报名成功，\n我们将把详细信息发送至您的手机，\n请注意查收。");
                    });
                }
            });
        });
    </script>
</@override>

<@extends name="base.ftl"/>
