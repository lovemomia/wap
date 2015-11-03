<@override name="title">${subject.subject.title}</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/subject/subject.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>${subject.subject.title}</div>
    <div class="content">

        <#if subject.subject.imgs?size == 0>
        <#else>
            <div class="subject img">
                <#if subject.subject.imgs?size == 1>
                    <#list subject.subject.imgs as img>
                        <img src="${img}" />
                    </#list>
                <#else>
                    <div id="scroll_img" class="scroll_box">
                        <ul id="scroll_wrap" class="scroll_wrap">
                            <#list subject.subject.imgs as img>
                                <li><img src="${img}" /></li>
                            </#list>
                        </ul>

                        <ul id="scroll_position" class="scroll_position">
                            <#list subject.subject.imgs as img>
                                <#if img_index == 0>
                                    <li class="on"><a href="javascript:void(0);"></a></li>
                                <#else>
                                    <li><a href="javascript:void(0);"></a></li>
                                </#if>
                            </#list>
                        </ul>
                    </div>
                </#if>
            </div>
        </#if>

        <div class="subject text no-border">
            <div class="left price">课程包<span class="left-margin">¥</span><span class="number">${subject.subject.price}</span><span>起</span></div>
            <div class="right button">
                <button id="btn_buy" class="btn-orange">立即抢购</button>
            </div>
            <div style="clear:both"></div>
        </div>
        <div class="bg-white">
            <hr class="sep" />
        </div>

        <div class="subject text no-top-border">
            <div class="left tag img"><img src="/img/tag3x.png"/></div>
            <div class="left tag desc">适合${subject.subject.age}</div>
            <#if (subject.subject.joined > 0)>
                <div class="right tag desc">${subject.subject.joined}人已参加</div>
                <div class="right tag img"><img src="/img/tag_gray3x.png"/></div>
            </#if>
            <div style="clear:both"></div>
        </div>

        <div class="subject text no-bottom-border top-margin"><div class="title">课程目标</div></div>
        <div class="bg-white"><hr class="sep"/></div>
        <div id="intro" class="subject text no-top-border">${subject.subject.intro}</div>

        <div id="courses" class="subject text no-bottom-border top-margin">
            <div class="title left">可选课程（${subject.courses.totalCount}）</div>
            <div class="arrow right"><img src="/img/allow3x.png" /></div>
            <div class="arrow right">更多</div>
            <div style="clear:both"></div>
        </div>
        <div class="bg-white"><hr class="sep"/></div>
        <div class="subject list bg-white bottom-border">
            <#list subject.courses.list as course>
                <#if (course_index > 0)><hr class='sep' /></#if>
                <div class="element course" cid="${course.id}">
                    <div class="left"><img src="${course.cover}"></div>
                    <div class="right">
                        <div class="title overflow-hidden">${course.title}</div>
                        <div class="desc overflow-hidden">${course.age} | ${course.scheduler}</div>
                        <div class="desc overflow-hidden">${course.region}</div>
                        <div class="price">价值<span>￥</span><span class="number">${course.price}</span></div>
                    </div>
                    <div style="clear:both"></div>
                </div>
            </#list>
        </div>

        <div class="subject text no-bottom-border top-margin"><div class="title">购买须知</div></div>
        <div class="bg-white"><hr class="sep"/></div>
        <div class="subject text no-top-border">
            <#list subject.subject.notice as notice>
                <div class="notice title">${notice.title}</div>
                <div class="notice content">${notice.content}</div>
            </#list>
        </div>

    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/hhSwipe.js"></script>
    <script type="text/javascript" src="/js/scroll.js"></script>
    <script type="text/javascript" src="/js/subject/subject.js"></script>
</@override>

<@extends name="../base.ftl"/>
