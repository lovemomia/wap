<@override name="title">收银台</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/payment/pay.css">
</@override>

<@override name="body">
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
            <div class="line coupon">
                <div class="left letter-sp32">红包</div>
                <div class="arrow right"><img src="/img/allow3x.png"/></div>
                <div class="info right"><span class="coupon">使用红包</span></div>
            </div>
            <hr class="sep">
            <div class="line">
                <div class="left">还需支付</div>
                <div id="total_fee" class="info right">${params.fee}元</div>
            </div>
        </div>
        <div class="title">选择支付方式</div>
        <div id="pay_types" class="pay"></div>

        <div class="btn top-margin-lg">
            <button id="btn_pay" class="btn-lg-orange">确认支付</button>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/gift/pay.js"></script>
</@override>

<@extends name="../base.ftl"/>
