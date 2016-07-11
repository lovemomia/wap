<@override name="title">用户注册</@override>

<@override name="css">
<link rel="stylesheet" type="text/css" href="/css/auth.css">
</@override>

<@override name="body">
<div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>用户注册<div class="right"><a href="/auth/login">登录</a></div></div>
<div class="content top-padding">
    <div class="form bottom-margin">
        <hr class="left-margin" />
        <dl>
            <dt class="letter-sp8">手机号</dt>
            <dd class="left">
                <i></i>
                <input type="tel" id="mobile" placeholder="输入手机号码">
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
        <dl>
            <dt class="letter-sp32">标识符</dt>
            <dd class="left">
                <i></i>
                <input type="text" id="saleCode" placeholder="输入标识符">
            </dd>
        </dl>
    </div>
</div>

<div class="btn top-padding">
    <button id="btn_register_sale" class="btn-main-lg">注册</button>
</div>
</@override>

<@override name="js">
<script type="text/javascript" src="/js/auth.js"></script>
</@override>

<@extends name="../base.ftl"/>
