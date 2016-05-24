<@override name="title">用户登录</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/auth.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>用户登录<div class="right"><a href="/auth/register">注册</a></div></div>
    <div class="content top-margin">
        <div class="form">
            <dl>
                <dt class="letter-sp8">手机号</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="mobile" placeholder="输入手机号码" />
                </dd>
            </dl>
            <hr class="left-margin" />
            <dl class="code">
                <dt class="letter-sp8">验证码</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="code" name="code" placeholder="短信验证码">
                </dd>

                <dd class="right btn">
                    <button id="btn_getcode" class="btn-main-sm">获取验证码</button>
                </dd>
            </dl>
        </div>
        <div class="password-link"><a href="/auth/login">使用密码登录</a></div>
        <div class="btn"><button id="btn_login_code" class="btn-main-lg">登录</button></div>
        <div class="register-link"><a href="/auth/register">注册</a></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/auth.js"></script>
</@override>

<@extends name="../base.ftl"/>
