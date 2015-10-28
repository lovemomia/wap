<@override name="title">我的订单</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/user/order.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>我的订单</div>
    <div class="content">
        <div class="tab bg-white bottom-border">
            <div id="not_payed" class="left" onclick="window.location.href='/user/order?status=2'">未付款</div>
            <div id="payed" class="left" onclick="window.location.href='/user/order?status=3'">已付款</div>
            <div id="all" class="left" onclick="window.location.href='/user/order?status=1'">全部</div>
            <div style="clear: both;"></div>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/jquery.sonar.min.js"></script>
    <script type="text/javascript" src="/js/user/order.js"></script>
</@override>

<@extends name="../base.ftl"/>
