<@override name="title">青</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>青<div class="right"><span class="color-main">5</span>/8</div></div>
    <div class="content">
        <div class="questions">
            <div class="question" category="test1_5" id="21">说话、活动有节奏感</div>
            <hr class="sep" />
            <div class="question" category="test1_6" id="22">对群体活动表现出很大的兴趣</div>
            <hr class="sep" />
            <div class="question" category="test1_7" id="23">能适应不同的环境</div>
            <hr class="sep" />
            <div class="question" category="test1_8" id="24">喜欢在兔子笼、养鱼缸、鸟笼和其他饲养动物的地方逗留</div>
            <hr class="sep" />
            <div class="question" category="test1_1" id="25">喜欢顺口溜、双关语、绕口令</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/6";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
