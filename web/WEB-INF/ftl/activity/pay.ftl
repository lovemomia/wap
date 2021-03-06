<@override name="title">收银台</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/payment/pay.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>收银台</div>
    <div class="content">
        <div class="pay top-margin">
            <div class="line">
                <div class="left letter-sp32">总价</div>
                <div class="info right">${params.fee}元</div>
            </div>
        </div>
        <div class="title">选择支付方式</div>
        <div id="pay_types" class="pay bottom-margin"></div>

        <div class="btn top-padding">
            <button id="btn_pay" class="btn-orange-lg">确认支付</button>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/activity/pay.js"></script>
</@override>

<@extends name="../base.ftl"/>
