<@override name="title">赤</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>赤<div class="right"><span class="color-main">1</span>/8</div></div>
    <div class="content">
        <div class="questions">
            <div class="question" category="test1_1" id="1">善于讲故事、说笑话、会编谎话</div>
            <hr class="sep" />
            <div class="question" category="test1_2" id="2">喜欢数数，喜欢与数字打交道</div>
            <hr class="sep" />
            <div class="question" category="test1_3" id="3">喜欢看课文以外的东西</div>
            <hr class="sep" />
            <div class="question" category="test1_4" id="4">身体的力量超过同龄孩子</div>
            <hr class="sep" />
            <div class="question" category="test1_5" id="5">歌唱嗓音好，能记住歌曲的旋律，当音乐听起来走调时能够觉察出来</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/2";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
