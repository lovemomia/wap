<@override name="title">支付结果</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/payment/result.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>
        <#if (result.payed == true)>
        购买成功
        <#else>
        付款失败
        </#if>
    </div>
    <div class="content">
        <div class="logo"><img src="/img/logo3x.png"></div>
        <#if (result.payed == true)>
            <div class="title">购买成功</div>
            <div class="desc">您已购买成功，请提前选课，并预约</div>
            <div class="btn">
                <div class="left"><button id="btn_booking" class="btn-orange">预约上课</button></div>
                <div class="right"><button id="btn_order" class="btn-main">查看订单</button></div>
                <div style="clear: both;"></div>
            </div>
        <#else>
            <div class="title">付款失败</div>
            <div class="desc">如果支付系统已扣款，请与客服联系</div>
        </#if>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/payment/result.js"></script>
</@override>

<@extends name="../base.ftl"/>
