<@override name="title">我的</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/my.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border">我的</div>
    <div class="content has-fix-footer">
        <div id="profile" class="form top-margin"></div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/user/booked'">
                <div class="img left"><img src="/img/yixuanx3x.png" /></div>
                <div class="title left">已选课程</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
            <hr class="sep" />
            <div class="line" onclick="window.location.href='/user/bookable'">
                <div class="img left"><img src="/img/daiyuex3x.png" /></div>
                <div class="title left">待选课程</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/user/order'">
                <div class="img left"><img src="/img/dingdan3x.png" /></div>
                <div class="title left">我的订单</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/feedback'">
                <div class="img left"><img src="/img/yijian3x.png" /></div>
                <div class="title left">意见反馈</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>
    </div>
    <div class="footer fixed">
        <div id="index" class="left w50">
            <div><img src="/img/jpk3x01.png"></div>
            <div>精品课</div>
        </div>
        <div class="right w50">
            <div><img src="/img/wd3x02.png"></div>
            <div>我的</div>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/my.js"></script>
</@override>

<@extends name="base.ftl"/>
