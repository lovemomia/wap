<@override name="title">送你50元松果亲子红包</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/hongbao.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>送你50元松果亲子红包</div>
    <div class="content">
        <div><img src="/img/hongbao.png"></div>
        <div><input id="mobile" type="tel" placeholder="请输入手机号" /></div>
        <div><button id="get_coupon" class="btn-lg-orange disable">马上领取</button></div>
        <div><button class="btn-lg-main">下载松果亲子APP</button></div>
        <div class="rules"><hr class="left" />活动规则<hr class="right" /></div>
        <div class="desc">
            <p>1.  红包仅限新用户领取，已经领取过或者购买过课程的用户不能重复领取</p>
            <p>2.  给新用户好友发红包，好友使用你的红包后，你也可以获得50元返现哦</p>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/hongbao.js"></script>
</@override>

<@extends name="base.ftl"/>
