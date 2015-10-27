<@override name="title">用户注册</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/auth.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>用户注册<div class="right"><a href="/auth/login">登录</a></div></div>
    <div class="content">
        <div class="form top-margin">
            <dl>
                <dt class="letter-sp8">手机号</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="mobile" placeholder="输入手机号码">
                </dd>
            </dl>
            <hr class="sep" />
            <dl>
                <dt class="letter-sp32">密码</dt>
                <dd class="left">
                    <i></i>
                    <input type="password" id="password" placeholder="输入密码">
                </dd>
            </dl>
            <hr class="sep" />
            <dl>
                <dt class="letter-sp32">昵称</dt>
                <dd class="left">
                    <i></i>
                    <input type="text" id="nickName" placeholder="输入昵称">
                </dd>
            </dl>
            <hr class="sep" />
            <dl id="last">
                <dt class="letter-sp8">验证码</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="code" name="code" placeholder="短信验证码">
                </dd>

                <dd class="right btn">
                    <button id="btn_getcode" class="btn-sm-main">获取验证码</button>
                </dd>
            </dl>
        </div>
    </div>

    <div class="btn top-margin">
        <button id="btn_register" class="btn-lg-main">注册</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/auth.js"></script>
</@override>

<@extends name="../base.ftl"/>
