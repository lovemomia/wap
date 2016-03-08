<@override name="title">${subject.subject.title}</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/feed/feed.css">
    <link rel="stylesheet" type="text/css" href="/css/subject/subject.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>${subject.subject.title}</div>
    <div class="content has-fix-footer">

        <div class="subject img">
            <img src="${subject.subject.cover}" />
        </div>

        <div id="intro" class="subject text no-top-border">${subject.subject.intro}</div>
        <#if (subject.courses?? && subject.courses.totalCount>0)>
            <div class="subject list bottom-border">
                <#list subject.courses.list as course>
                    <a href="/course?id=${course.id}">
                        <div class="element">
                            <div class="left"><img src="${course.cover}" /></div>
                            <div class="right">
                                <div class="title overflow-hidden">${course.title}</div>
                                <div class="desc overflow-hidden">${course.age} | ${course.scheduler}</div>
                                <div class="desc overflow-hidden">${course.region}</div>
                                <div class="price">
                                    <#if (course.price > 0)>
                                        <span>价值 </span><span class="number">${course.price}</span><span>元</span>
                                    <#else>
                                        <span class="free">公益课</span>
                                    </#if>
                                </div>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                        <#if (course_index < subject.courses.list?size - 1)>
                            <hr class="sep" />
                        </#if>
                    </a>
                </#list>
                <#if (subject.courses.nextIndex?? && subject.courses.nextIndex > 0)>
                    <div class="more top-border"><a href="/subject/courses?sid=${subject.subject.id}">查看更多</a></div>
                </#if>
            </div>
        <#else>
            <div class="bg-white bottom-border">
                <div class="logo"><img src="/img/logo3x.png"></div>
                <div class="tips">
                    <p>目前还没有可选课程，我们会尽快推出的哦~</p>
                </div>
            </div>
        </#if>

        <div class="subject text top-margin v-border">
            <#list subject.subject.notice as notice>
                <div class="notice title">${notice.title}</div>
                <div class="notice content">${notice.content}</div>
            </#list>
        </div>
    </div>

    <div class="footer fixed">
        <div class="left price top-border">课程包<span class="left-margin">¥ </span><span class="number">${subject.subject.price}</span><span>起</span></div>
        <#if subject.subject.status==1>
            <div class="right"><button id="btn_buy" class="btn-orange">立即抢购</button></div>
        <#else>
            <div class="right"><button class="btn-gray">已经售完</button></div>
        </#if>
        <div style="clear:both"></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/hhSwipe.js"></script>
    <script type="text/javascript" src="/js/scroll.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/subject/subject.js"></script>
</@override>

<@extends name="../base.ftl"/>
