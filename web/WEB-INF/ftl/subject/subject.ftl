<@override name="title">${subject.subject.title}</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/feed/feed.css">
    <link rel="stylesheet" type="text/css" href="/css/subject/subject.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>${subject.subject.title}</div>
    <div class="content has-fix-footer">

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
            <div class="left tag img"><img src="/img/tag3x.png"/></div>
            <div class="left tag desc">适合${subject.subject.age}</div>
            <#if (subject.subject.joined > 0)>
                <div class="right tag desc">${subject.subject.joined}人已参加</div>
                <div class="right tag img"><img src="/img/tag_gray3x.png"/></div>
            </#if>
            <div style="clear:both"></div>
        </div>
        <div class="bg-white"><hr class="sep"/></div>
        <div id="intro" class="subject text no-top-border">${subject.subject.intro}</div>

        <div class="tabs top-margin">
            <ul>
                <li><a href="#panel-1">可选课程</a></li>
                <li><a href="#panel-2">购买须知</a></li>
                <li><a href="#panel-3">成长说</a></li>
            </ul>
            <div id="panel-1">
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
                </#if>
            </div>
            <div id="panel-2">
                <div class="subject text no-top-border">
                    <#list subject.subject.notice as notice>
                        <div class="notice title">${notice.title}</div>
                        <div class="notice content">${notice.content}</div>
                    </#list>
                </div>
            </div>
            <div id="panel-3">
                <#if (subject.feeds?? && subject.feeds.totalCount>0)>
                    <div class="subject list bottom-border">
                        <#list subject.feeds.list as feed>
                            <div class="feed">
                            <div class="feed-avatar left">
                                <#if (feed.avatar?length > 0)>
                                    <img src="${feed.avatar}" />
                                <#else>
                                    <img src="/img/avatar02.png" />
                                </#if>
                            </div>
                            <div class="feed-info right top-margin bottom-margin">
                                <div>
                                    <div class="nickname left">${feed.nickName}</div>
                                    <div class="addtime right">${feed.addTime}</div>
                                    <div style="clear:both"></div>
                                    </div>
                                <div>
                                    <#if (feed.children?size > 0)>
                                        <div class="children left">${feed.children[0]}</div>
                                    </#if>
                                    <div style="clear:both"></div>
                                    </div>
                                <hr class="sep full"/>
                                <#if (feed.content?length > 0)><div class="feed-content">${feed.content}</div></#if>
                                <#if (feed.imgs?size>0)>
                                    <#list feed.imgs as img>
                                        <#if (img_index%3==0)>
                                        <div class="feed-img">
                                        </#if>
                                        <img src="${img}" />
                                        <#if (img_index%3==2 || (img_index+1) == feed.imgs?size)>
                                            <div style="clear:both"></div>
                                        </div>
                                        </#if>
                                    </#list>
                                </#if>
                                </div>
                            <div style="clear:both"></div>
                            </div>
                            <#if (feed_index < subject.feeds.list?size - 1)>
                                <hr class="sep" />
                            </#if>
                        </#list>
                    </div>
                </#if>
            </div>
        </div>
    </div>

    <div class="footer fixed">
        <div class="left price top-border">课程包<span class="left-margin">¥ </span><span class="number">${subject.subject.price}</span><span>起</span></div>
        <div class="right"><button id="btn_buy" class="btn-orange">立即抢购</button></div>
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
