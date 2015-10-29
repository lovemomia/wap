<@override name="title">收银台</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/payment/pay.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>收银台</div>
    <div class="content">
        <div class="pay top-margin">
            <div class="line">
                <div class="left">订单数量</div>
                <div class="info right">${params.count}</div>
            </div>
            <hr class="sep">
            <div class="line">
                <div class="left letter-sp32">总价</div>
                <div class="info right">${params.fee}元</div>
            </div>
        </div>

        <div class="pay top-margin">
            <div class="line">
                <div class="left">还需支付</div>
                <div class="info right">${params.fee}元</div>
            </div>
        </div>
        <div class="title">选择支付方式</div>
        <div id="pay_types" class="pay">
            <div pay_type="ali" class="line large payment">
                <div class="left img"><img src="/img/ali.png" /></div>
                <div class="left desc">
                    <div class="name">支付宝支付</div>
                    <div class="tip">推荐支付宝用户使用</div>
                </div>
                <div class="right sel"><img src="/img/notsel2x.png" /></div>
            </div>
            <hr class="sep">
            <div pay_type="weixin" class="line large payment">
                <div class="left img"><img src="/img/weixin.png" /></div>
                <div class="left desc">
                    <div class="name">微信支付</div>
                    <div class="tip">推荐已安装微信的用户使用</div>
                </div>
                <div class="right sel"><img src="/img/notsel2x.png" /></div>
            </div>
        </div>

        <div class="btn top-margin-lg">
            <button id="btn_pay" class="btn-lg-orange" oid="${params.oid}">确认支付</button>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/payment/pay.js"></script>
</@override>

<@extends name="../base.ftl"/>
