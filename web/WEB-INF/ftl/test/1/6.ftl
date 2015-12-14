<@override name="title">蓝</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>蓝</div>
    <div class="content">
        <div class="title"><span class="color-main">6</span>/8 蓝</div>
        <div class="questions">
            <div class="question" category="test1_2" id="26">喜欢将物品按类别、层次分类而不是将他们混合在一起</div>
            <hr class="sep" />
            <div class="question" category="test1_3" id="27">构建有趣的三维立体结构（如：乐高拼装玩具）</div>
            <hr class="sep" />
            <div class="question" category="test1_4" id="28">喜欢跑步、跳跃、摔跤或类似的有障碍的活动（例如：跑进课堂、翻跳椅子）</div>
            <hr class="sep" />
            <div class="question" category="test1_5" id="29">无意地自己哼唱给自己听</div>
            <hr class="sep" />
            <div class="question" category="test1_6" id="30">会有技巧的劝导、说服其他孩子</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/7";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
