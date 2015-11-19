<@override name="title">黄</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>黄<div class="right"><span class="color-main">3</span>/8</div></div>
    <div class="content">
        <div class="questions">
            <div class="question" category="test1_3" id="11">喜欢艺术活动，擅长绘画</div>
            <hr class="sep" />
            <div class="question" category="test1_4" id="12">善于模仿别人的手势或言语、习惯动作</div>
            <hr class="sep" />
            <div class="question" category="test1_5" id="13">喜欢玩打击乐器或参加群体合唱</div>
            <hr class="sep" />
            <div class="question" category="test1_6" id="14">会给小伙伴或者家长提供建议</div>
            <hr class="sep" />
            <div class="question" category="test1_7" id="15">对自己的能力和弱点有一定认识</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/4";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
