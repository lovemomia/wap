<@override name="title">新年送礼</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/gift/send.css">
</@override>

<@override name="body">
    <div class="content">
        <div id="header">
            <div class="title"><img src="/img/gift_header_title.png" /></div>
        </div>
        <div id="cover">
            <img src="/img/gift_cover.png" />
        </div>
        <div id="desc">
            <div style="margin-bottom: 0.3rem;"><img src="/img/gift_desc.png" /></div>
            <div>
                <div class="course"><img src="/img/gift_course.png" /></div>
                <div class="toy"><img src="/img/gift_toy.png" /></div>
                <div class="bag"><img src="/img/gift_bag.png" /></div>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div>
            <button id="btn_send"></button>
            <button id="btn_share"></button>
        </div>
        <div id="rule" class="top-margin">
            <div class="title"><hr class='left' />&bull;<span style="margin-left: 0.3rem; margin-right:0.3rem;">活动规则</span>&bull;<hr class='right' /></div>
            <ol>
                <li>活动时间：2月1日—2月22日</li>
                <li>每个新春压岁礼仅限一人领取</li>
                <li>礼包中的松果课程只能在上海地区使用</li>
                <li>若新春压岁礼在10天内还未被对方领取，则自动退回到送礼人的松果亲子账户</li>
                <li>被退回的新春压岁礼可自己享用或联系客服退款</li>
                <li>如有任何疑问可添加客服微信：dorakids01，随时进行咨询</li>
                <li>本次活动最终解释权归松果亲子所有</li>
            </ol>
        </div>
        <div id="logo">
            <img src="/img/gift_logo.png" />
        </div>
        <div id="footer"></div>
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
                jsApiList: ['onMenuShareAppMessage', 'onMenuShareTimeline', 'hideMenuItems' ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });

            wx.ready(function() {
                wx.onMenuShareAppMessage({
                    title: '大过年的，只送压岁钱怎么行？',
                    desc: '新年，我们到底需要什么？一份互换的压岁钱？ or 一份走心的压岁礼？',
                    link: '${share.url}',
                    imgUrl: 'http://s.sogokids.com/2016-02-03/1f71a4ea679fbdd9976995d56e41dd99.jpg'
                });

                wx.onMenuShareTimeline({
                    title: '大过年的，只送压岁钱怎么行？',
                    link: '${share.url}',
                    imgUrl: 'http://s.sogokids.com/2016-02-03/1f71a4ea679fbdd9976995d56e41dd99.jpg'
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
</@override>

<@extends name="../base.ftl"/>
