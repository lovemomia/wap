<@override name="title">话题讨论</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/discuss/topic.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>话题讨论</div>
    <div class="content bg-white has-fixed-footer bottom-border">
        <div class="title">${topic.topic.title}</div>
        <div class="body">${topic.topic.content}</div>
        <div class="replies-title bottom-border">所有回答<span>${topic.replies.totalCount}</span></div>
        <#if (topic.replies.totalCount>0)>
            <#list topic.replies.list as reply>
                <div class="reply">
                    <#if (reply_index>0)><hr class="left-margin" /></#if>
                    <div class="reply-avatar left">
                        <#if (reply.avatar?length>0)>
                            <img src="${reply.avatar}" />
                        <#else>
                            <img src="/img/avatar02.png" />
                        </#if>
                    </div>
                    <div class="reply-info right top-margin bottom-margin">
                        <div>
                            <div class="nickname left">${reply.nickName}</div>
                            <div class="addtime right">${reply.addTime}</div>
                            <div style="clear:both"></div>
                        </div>
                        <div>
                            <#if (reply.children?size>0)>
                                <div class="children left">${reply.children[0]}</div>
                            </#if>
                            <div style="clear:both"></div>
                        </div>
                        <div class="reply-content">${reply.content}</div>
                        <div class="reply-star">
                            <#if reply.stared==true>
                                <img class="left" src="/img/zan_active3x.png" />
                            <#else>
                                <img class="left" src="/img/zan3x.png" />
                            </#if>
                            ${reply.staredCount}
                        </div>
                    </div>
                    <div style="clear:both"></div>
                </div>
            </#list>
        </#if>
    </div>
    <div class="footer fixed">
        <button id="btn_join" class="btn-orange">参与讨论</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/jquery.sonar.min.js"></script>
    <script type="text/javascript" src="/js/discuss/topic.js"></script>
</@override>

<@extends name="../base.ftl"/>
