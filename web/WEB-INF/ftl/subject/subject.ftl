<@override name="title">${subject.subject.title}</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/subject/subject.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>${subject.subject.title}</div>
    <div class="content has-fix-footer">

        <#if (subject.subject.imgs?size>0)>
            <div class="subject img">
                <img src="${subject.subject.imgs[0]}" />
            </div>
        </#if>

        <div id="intro" class="subject text no-top-border">${subject.subject.intro}</div>

        <#if (subject.newCourses?? && subject.newCourses?size>0)>
        <div class="module">
            <div class="head">最新开班</div>
            <hr class="green" />
            <div class="list">
                <#list subject.newCourses as course>
                    <#if (course_index>0)><hr class="sep"></#if>
                    <a href="/course?id=${course.id}&sid=${course.skuId}">
                        <div class="element">
                            <div class="left"><img src="${course.cover}"></div>
                            <div class="right">
                                <div class="title overflow-hidden">${course.title}</div>
                                <div class="desc overflow-hidden">${course.age} | ${course.scheduler}</div>
                                <div class="desc overflow-hidden">${course.region}</div>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                    </a>
                </#list>
            </div>
        </div>
        </#if>

        <#if (subject.courses?? && subject.courses?size>0)>
        <div class="module">
            <div class="head">所有课程</div>
            <hr class="green" />
            <div class="courses bottom-border top-padding">
                <#list subject.courses as course>
                    <a href="/course?id=${course.id}">
                        <div class="course" style="background-image: url('${course.cover}')">
                            <div class="lesson">LESSON ${course_index + 1}</div>
                            <div class="info gradient">
                                <div class="title">${course.title}</div>
                                <div class="age"><img src="/img/ren3x.png" />${course.age}</div>
                            </div>
                        </div>
                    </a>
                </#list>
            </div>
        </div>
        <#else>
            <div class="bg-white bottom-border">
                <div class="logo"><img src="/img/logo3x.png"></div>
                <div class="tips">
                    <p>目前还没有可选课程，我们会尽快推出的哦~</p>
                </div>
            </div>
        </#if>

        <#if (subject.comments?? && subject.comments.totalCount>0)>
            <div class="subject comment v-border top-margin">
                <div class="title">用户评价</div>
                <hr class="left-margin" />
                <#list subject.comments.list as comment>
                    <#if (comment_index == 0)>
                    <div>
                        <div class="comment-avatar left">
                            <#if (comment.avatar?length>0)>
                                <img src="${comment.avatar}" />
                            <#else>
                                <img src="/img/avatar02.png" />
                            </#if>
                        </div>
                        <div class="comment-info right top-margin bottom-margin">
                            <div>
                                <div class="nickname left">${comment.nickName}</div>
                                <div class="addtime right">${comment.addTime}</div>
                                <div style="clear:both"></div>
                            </div>
                            <div>
                                <#if (comment.children?size>0)>
                                    <div class="children left">${comment.children[0]}</div>
                                </#if>
                                <div class="right">
                                    <#list 1..5 as i>
                                        <#if (5-comment.star<i)>
                                            <img class="star" src="/img/dianliang2x.png" />
                                        <#else>
                                            <img class="star" src="/img/budianliang2x.png" />
                                        </#if>
                                    </#list>
                                </div>
                                <div style="clear:both"></div>
                            </div>
                            <div class="comment-content">${comment.content}</div>
                            <#if (comment.imgs?size>0)>
                                <#list comment.imgs as img>
                                    <#if (img_index<3)>
                                        <#if (img_index%3==0)>
                                        <div class="comment-img">
                                        </#if>
                                        <img src="${img}" />
                                        <#if (img_index%3==2 || (img_index+1) == comment.imgs?size)>
                                            <div style="clear:both"></div>
                                        </div>
                                        </#if>
                                    </#if>
                                </#list>
                            </#if>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    </#if>
                </#list>
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
        <div class="left price top-border"><span class="left-margin">¥ </span><span class="number">${subject.subject.cheapestSkuPrice}</span><span>起/${subject.subject.cheapestSkuTimeUnit}</span><span class="price-desc right">${subject.subject.cheapestSkuDesc}</span></div>
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
