<@override name="title">紫</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>紫</div>
    <div class="content">
        <div class="title"><span class="color-main">7</span>/8 紫</div>
        <div class="questions">
            <div class="question" category="test1_7" id="31">更喜欢独立学习、玩耍而非与同伴一起</div>
            <hr class="sep" />
            <div class="question" category="test1_8" id="32">喜欢做关于自然的事情，诸如观察鸟类、收集蝴蝶或昆虫、研究树木、饲养动物</div>
            <hr class="sep" />
            <div class="question" category="test1_1" id="33">喜欢听故事</div>
            <hr class="sep" />
            <div class="question" category="test1_2" id="34">对数学有关的话题感兴趣</div>
            <hr class="sep" />
            <div class="question" category="test1_3" id="35">喜欢在书本、作业纸张或其他物品上乱涂乱画</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/8";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
