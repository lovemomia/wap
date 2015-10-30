<@override name="title">个人信息</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/user/profile.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>个人信息</div>
    <div class="content">
        <div class="title">个人信息</div>
        <div class="profile">
            <div class="line large">
                <div class="left letter-sp32">头像</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div class="avatar right"><img id="avatar" src="${user.avatar}" /></div>
                <input type="file" id="browsefile" name="file">
            </div>
            <hr class="sep">
            <div id="nickname" class="line">
                <div class="left letter-sp32">昵称</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div class="info right">${user.nickName}</div>
            </div>
            <hr class="sep">
            <div class="line">
                <div class="left letter-sp8">手机号</div>
                <div class="info right">${user.mobile}</div>
            </div>
        </div>
        <div class="profile top-margin">
            <div id="sex" class="line">
                <div class="left letter-sp32">性别</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div class="info right">${user.sex}</div>
            </div>
            <hr class="sep">
            <div id="address" class="line">
                <div class="left letter-sp8">常住地</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div class="info right">${user.address}</div>
            </div>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/user/profile.js"></script>
</@override>

<@extends name="../base.ftl"/>
