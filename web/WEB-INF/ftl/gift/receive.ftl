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
            <div class="title"><hr class='left' />&bull;<span style="margin-left: 0.1rem; margin-right:0.1rem;">礼包使用说明</span>&bull;<hr class='right' /></div>
            <div class="usage">
                <ol>
                    <li>玩具和书包将于2月15日后为您寄出</li>
                    <li>松果课程包使用步骤如下：</li>
                    <div>（1）长按二维码，关注 [松果亲子] 公众号</div>
                    <div id="code"><img src="/img/code.png" /></div>
                    <div>（2）进入公众号，点击左下方 [课程报名]</div>
                    <img id="flow1" src="/img/gift_flow1.jpg" />
                    <div>（3）点击右下角 [我的]，进入个人中心</div>
                    <img id="flow2" src="/img/gift_flow2.jpg" />
                    <div>（5）在个人中心，进入 [预约课程] 去选课</div>
                    <img id="flow4" src="/img/gift_flow4.jpg" />
                    <li>如有任何疑问，请添加微信客服：dorakids01，随时进行咨询</li>
                </ol>
            </div>
        </div>
        <div id="rule">
            <div class="title">&bull;<span style="margin-left: 0.1rem; margin-right:0.1rem;">本次活动最终解释权归松果亲子所有</span>&bull;</div>
        </div>
        <div id="footer"></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/gift/receive.js"></script>
</@override>

<@extends name="../base.ftl"/>
