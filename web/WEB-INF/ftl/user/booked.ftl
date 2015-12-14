<@override name="title">已选课程</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/user/booked.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>已选课程</div>
    <div class="content">
        <div class="tab bg-white bottom-border">
            <div id="notfinished" class="left" onclick="window.location.href='/user/booked?status=1'">待上课</div>
            <div id="finished" class="left" onclick="window.location.href='/user/booked?status=2'">已上课</div>
            <div style="clear: both;"></div>
        </div>
        <div class="courses"></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/jquery.sonar.min.js"></script>
    <script type="text/javascript" src="/js/user/booked.js"></script>
</@override>

<@extends name="../base.ftl"/>
