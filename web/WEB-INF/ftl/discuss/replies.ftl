<@override name="title">全部回复</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/discuss/replies.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>全部回复</div>
    <div class="content bottom-border bg-white has-fixed-footer ">
        <div class="replies-title bottom-border">所有回答<span id="totalCount">0</span></div>
        <div class="new-reply bg-white"></div>
    </div>
    <div class="footer fixed">
        <button id="btn_join" class="btn-orange">参与讨论</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/jquery.sonar.min.js"></script>
    <script type="text/javascript" src="/js/discuss/replies.js"></script>
</@override>

<@extends name="../base.ftl"/>
