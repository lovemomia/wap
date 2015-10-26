<@override name="title">用户登录</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/auth.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>用户登录<div class="right"><a href="/auth/register.html">注册</a></div></div>
    <div class="content">
        <div class="form top-margin">
            <dl>
                <dt class="letter-sp8">手机号</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="mobile" placeholder="输入手机号码" />
                </dd>
            </dl>
            <hr class="sep" />
            <dl>
                <dt class="letter-sp32">密码</dt>
                <dd class="left">
                    <i></i>
                    <input type="password" id="password" placeholder="输入密码" />
                </dd>
            </dl>
        </div>
    </div>

    <div class="password-link"><a href="/auth/password.html">忘记密码</a></div>
    <div class="btn">
        <button id="btn_login" class="btn-lg-main">登录</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/auth.js"></script>
</@override>

<@extends name="../base.ftl"/>
