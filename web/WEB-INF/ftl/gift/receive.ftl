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
                    <li>点击上方“领取礼包”按钮，领取新春礼包</li>
                    <li>进入 [职业梦想] ，了解松果课程详情</li>
                    <img id="flow1" src="/img/gift_flow1.png" />
                    <li>在课程体系中看看有哪些自己喜欢的课程</li>
                    <img id="flow2" src="/img/gift_flow2.png" />
                    <li>进入 [我的-预约课程] ，去预约您和孩子都喜欢的课程哟~</li>
                    <img id="flow3" src="/img/gift_flow3.png" />
                    <li>长按下方二维码，关注 [松果亲子] 公众号，第一时间获得课程更新信息和最新活动资讯，还有更多好玩有趣的亲子教育美文和你分享</li>
                </ol>
            </div>
        </div>
        <div id="code"><img src="/img/code.png" /></div>
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
