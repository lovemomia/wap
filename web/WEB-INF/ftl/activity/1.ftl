<@override name="title">邀请函</@override>

<@override name="css">
    <style type="text/css">
        body {
            background-color: #fff7e7;
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
            margin: 0;
            width: 4rem;
            height: 21.26rem;
            background-image: url("http://s.sogokids.com/2016-03-31/0d19e433e58dca006193a8ba644046ee.jpg");
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

        .ybe {
            margin: 0;
            width: 4rem;
            height: 0.66rem;
            background-image: url("/img/ybe.png");
            background-repeat: no-repeat;
            background-size: 100% 100%;
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
    <div class="ybe"></div>
</@override>

<@override name="js">
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        if (sg.common.is_weixin()) {
            wx.config({
                debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
                appId: '${activity.config.appId}', // 必填，公众号的唯一标识
                timestamp: ${activity.config.timeStamp}, // 必填，生成签名的时间戳
                nonceStr: '${activity.config.nonceStr}', // 必填，生成签名的随机串
                signature: '${activity.config.sign}',// 必填，签名，见附录1
                jsApiList: ['onMenuShareAppMessage', 'onMenuShareTimeline', 'hideMenuItems'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });

            wx.ready(function() {
                wx.onMenuShareAppMessage({
                    title: '${activity.title}',
                    desc: '${activity.desc}',
                    link: 'http://m.sogokids.com/activity/1',
                    imgUrl: '${activity.cover}'
                });

                wx.onMenuShareTimeline({
                    title: '${activity.title}',
                    link: 'http://m.sogokids.com/activity/1',
                    imgUrl: '${activity.cover}'
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
                    sg.common.post(sg.config.api + "/activity/join", {
                        aid: 1,
                        cname: childName,
                        mobile: mobile
                    }, function (data) {
                        var entryId = new Number(data);
                        if (entryId > 0) {
                            window.location.href = "/activity/pay?aid=" + 1 + "&eid=" + entryId;
                        } else {
                            alert("报名成功");
                        }
                    });
                }
            });
        });
    </script>
</@override>

<@extends name="../base.ftl"/>
