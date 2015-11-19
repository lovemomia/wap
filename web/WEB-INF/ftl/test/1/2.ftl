<@override name="title">橙</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>橙<div class="right"><span class="color-main">2</span>/8</div></div>
    <div class="content">
        <div class="questions">
            <div class="question" category="test1_6" id="6">似乎是天生的领袖</div>
            <hr class="sep" />
            <div class="question" category="test1_7" id="7">显示出独立意识或意志坚定，很有主见</div>
            <hr class="sep" />
            <div class="question" category="test1_8" id="8">喜欢去动物园、自然历史博物馆，更喜欢在户外玩耍</div>
            <hr class="sep" />
            <div class="question" category="test1_1" id="9">善于记人名、地名、日期或其他细节</div>
            <hr class="sep" />
            <div class="question" category="test1_2" id="10">喜欢电脑游戏、象棋、跳棋、或其他带有策略性的游戏</div>
        </div>
        <div class="bottom-margin"><button id="btn_next" class="btn-lg-main">下一题</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_next").on("click", function () {
                window.location.href = "/test/1/3";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
