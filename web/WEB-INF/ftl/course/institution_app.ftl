<@override name="title">机构介绍</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/cpourse/institution.css">
</@override>

<@override name="body">
    <@block name="header"></@block>
    <div class="content">
        <div class="detail">
            <img src="${detail.cover}" />
            <div class="text no-border">
                <div class="name">${detail.name}</div>
                <div class="intro text-indent top-margin">${detail.intro}</div>
                </div>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/course/institution.js"></script>
</@override>

<@extends name="../base.ftl"/>
