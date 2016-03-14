<@override name="title">话题讨论</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/discuss/topic.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>话题讨论</div>
    <div class="content has-fixed-footer ">
        <div class="topic bottom-border bg-white">
            <div id="title" class="title"></div>
            <div id="body" class="body"></div>
            <div class="replies-title bottom-border">所有回答<span id="totalCount">0</span></div>
            <div class="new-reply bg-white"></div>
        </div>
    </div>
    <div class="footer fixed">
        <button id="btn_join" class="btn-orange">参与讨论</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/jquery.sonar.min.js"></script>
    <script type="text/javascript" src="/js/discuss/topic.js"></script>
</@override>

<@extends name="../base.ftl"/>
