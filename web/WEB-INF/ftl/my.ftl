<@override name="title">我的</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/my.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border">我的</div>
    <div class="content has-fix-footer">
        <div id="profile" class="form top-margin">
            <#if user??>
                <div class="line large" onclick="window.location.href='/user/profile'">
                    <div class="img left"><img id="avatar" src="${user.avatar}" /></div>
                    <div class="info left">
                        <div id="nickname">${user.nickName}</div>
                        <div id="children"></div>
                    </div>
                    <div class="arrow right"><img src="/img/allow3x.png"/></div>
                </div>
            <#else>
                <div class="line large">
                    <div class="not-login-tips">您还没有登录哦~</div>
                    <div class="not-login-button">
                        <button id="btn_login" class="btn btn-sm-main">立即登录</button>
                    </div>
                    <div style="clear: both;"></div>
                </div>
            </#if>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/user/bookable'">
                <div class="img left"><img src="/img/daiyuex3x.png" /></div>
                <div class="title left">预约课程</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
            <hr class="sep" />
            <div class="line" onclick="window.location.href='/user/booked'">
                <div class="img left"><img src="/img/yixuanx3x.png" /></div>
                <div class="title left">已选课程</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
        </div>

        <div class="form top-margin">
            <div class="line" onclick="window.location.href='/user/order'">
                <div class="img left"><img src="/img/dingdan3x.png" /></div>
                <div class="title left">我的订单</div>
                <div class='arrow right'><img src='/img/allow3x.png' /></div>
            </div>
            <hr class="sep" />
            <div class="line" onclick="window.location.href='/user/coupon'">
                <div class="img left"><img src="/img/hongbao3x.png" /></div>
                <div class="title left">我的红包</div>
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
        
        <#if user??>
            <div class="btn top-margin-lg bottom-margin">
                <button id="btn_logout" class="btn-lg-main">退出登录</button>
            </div>
        </#if>
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
