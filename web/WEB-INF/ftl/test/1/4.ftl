<@override name="title">绿</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>绿</div>
    <div class="content">
        <div class="title"><span class="color-main">4</span>/8 绿</div>
        <div class="questions">
            <div class="question" category="test1_8" id="16">显示出对自然界构成的兴趣（例如：户外玩耍时会注意到山和云；在城市环境里会对运动鞋或汽车款式显示出敏感性</div>
            <hr class="sep" />
            <div class="question" category="test1_1" id="17">喜欢看书</div>
            <hr class="sep" />
            <div class="question" category="test1_2" id="18">喜欢猜谜、智力题，喜欢听推理故事</div>
            <hr class="sep" />
            <div class="question" category="test1_3" id="19">喜欢看电影、幻灯片或其他形象化的内容</div>
            <hr class="sep" />
            <div class="question" category="test1_4" id="20">喜欢拆卸物品并按原样安装起来</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/5";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
