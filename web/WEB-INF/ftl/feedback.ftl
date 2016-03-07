<@override name="title">意见反馈</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/feedback.css">
</@override>

<@override name="body">
<div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>意见反馈</div>
<div class="content">
    <div class="tips">欢迎您提出宝贵的意见和建议，您留下的每个字都将用来改善我们的产品。</div>
    <div class="form">
        <dl>
            <dd class="textarea">
                <textarea id="content" placeholder="请输入您的反馈意见（200字以内）"></textarea>
            </dd>
        </dl>
    </div>

    <div class="form top-margin">
        <dl>
            <dt>联系方式</dt>
            <dd class="left">
                <i></i>
                <input type="tel" id="contact" placeholder="请输入您的联系方式" />
            </dd>
        </dl>
    </div>
</div>

<div class="btn top-padding">
    <button id="btn_commit" class="btn-main-lg">提交</button>
</div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/feedback.js"></script>
</@override>

<@extends name="base.ftl"/>
