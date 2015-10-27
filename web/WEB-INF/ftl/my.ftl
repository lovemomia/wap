<@override name="title">我的</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/my.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border">我的</div>
    <div class="content has-fix-footer">
        <div class="form top-margin">
            <div class="line large" onclick="window.location.href='/user/profile.html'">
                <div class="img left"><img id="avatar" src="" /></div>
                <div class="info left">
                    <div id="nickname"></div>
                    <div id="children"></div>
                </div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/user/booked.html'">
                <div class="img left"><img src="/img/yixuanx3x.png" /></div>
                <div class="title left">已选课程</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
            <hr class="sep" />
            <div class="line" onclick="window.location.href='/user/bookable.html'">
                <div class="img left"><img src="/img/daiyuex3x.png" /></div>
                <div class="title left">待选课程</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/user/order.html'">
                <div class="img left"><img src="/img/dingdan3x.png" /></div>
                <div class="title left">我的订单</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/feedback.html'">
                <div class="img left"><img src="/img/yijian3x.png" /></div>
                <div class="title left">意见反馈</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>
    </div>
    <div class="footer fixed"></div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/my.js"></script>
</@override>

<@extends name="base.ftl"/>
