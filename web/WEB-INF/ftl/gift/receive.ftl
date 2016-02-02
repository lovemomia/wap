<@override name="title">领取礼包</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/gift/receive.css">
</@override>

<@override name="body">
    <div class="content">
        <div id="header">
            <div class="title"><img src="/img/gift_receive_title.png" /></div>
        </div>
        <div id="cover">
            <img src="/img/gift_package.png" />
        </div>
        <div>
            <button id="btn_receive"></button>
        </div>
        <div id="desc">
            <div style="margin-bottom: 0.3rem;"><img src="/img/gift_usage.png" /></div>
            <div class="usage"></div>
        </div>
        <div id="rule">
            <div class="title"><hr class='left' />&bull;<span style="margin-left: 0.1rem; margin-right:0.1rem;">本次活动最终解释权归松果亲子所有</span>&bull;<hr class='right' /></div>
        </div>
        <div id="footer"></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/gift/receive.js"></script>
</@override>

<@extends name="../base.ftl"/>
