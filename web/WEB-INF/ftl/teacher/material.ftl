<@override name="title">教材教具</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/teacher/material.css">
</@override>

<@override name="body">
    <div class="header bg-white"><div class="back left"><img src="/img/back3x.png"></div>教材教具</div>
    <div class="content list top-border bottom-border bg-white">
        <div class="title">${material.title}</div>
        <div class="body">${material.content}</div>
    </div>
</@override>

<@extends name="../base.ftl"/>
