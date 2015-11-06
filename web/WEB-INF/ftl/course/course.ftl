<@override name="title">课程详情</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/course/course.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>课程详情</div>
    <div class="content">

        <#if (course.cancelable?? && course.cancelable == true)>
        <div class="list">
            <div class="element">
                <div class="left"><img src="${course.cover}" /></div>
                <div class="right">
                    <div class="title overflow-hidden">${course.title}</div>
                    <div class="desc overflow-hidden">${course.place.address}</div>
                    <div class="desc overflow-hidden">${course.scheduler}</div>
                    <#if (course.price > 0)>
                        <div class="price"><span>价值 </span><span class="number">${course.price}</span><span>元</span></div>
                    <#else>
                        <div class="price"><span class="free">公益课</span></div>
                    </#if>
                </div>
                <div style="clear: both;"></div>
            </div>
        </div>
        <#else>
            <#if course.imgs?size == 0>
            <#else>
                <div class="course img">
                    <#if course.imgs?size == 1>
                        <#list course.imgs as img>
                            <img src="${img}" />
                        </#list>
                    <#else>
                        <div id="scroll_img" class="scroll_box">
                            <ul id="scroll_wrap" class="scroll_wrap">
                                <#list course.imgs as img>
                                    <li><img src="${img}" /></li>
                                </#list>
                            </ul>

                            <ul id="scroll_position" class="scroll_position">
                                <#list course.imgs as img>
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
            <div class="course-title">${course.title}</div>

            <div class="course text no-top-padding no-border">
                <#if (course.price > 0)>
                    <div class="left price">价值<span class="left-margin">¥</span><span class="number">${course.price}</span></div>
                <#else>
                    <div class="left price"><span class="free">公益课</span></div>
                </#if>
                <div style="clear:both"></div>
            </div>
        </#if>
        
        <div class="bg-white">
            <hr class="sep" />
        </div>

        <div class="course text no-top-border">
            <div class="left tag img"><img src="/img/tag3x.png"/></div>
            <div class="left tag desc">适合${course.age}</div>
            <#if (course.insurance == true)>
                <div class="left tag img"><img src="/img/tag3x.png"/></div>
                <div class="left tag desc">送保险</div>
            </#if>
            <#if (course.joined > 0)>
                <div class="right tag desc">${course.joined}人已参加</div>
                <div class="right tag img"><img src="/img/tag_gray3x.png"/></div>
            </#if>
            <div style="clear:both"></div>
        </div>

        <#if (course.cancelable?? && course.cancelable == true)>
        <div id="btn_cancel" class="top-margin">
            <button class="btn-lg-main">取消预约</button>
        </div>
        </#if>

        <div class="course text no-bottom-border top-margin"><div class="title">课程目标</div></div>
        <div class="bg-white"><hr class="sep"/></div>
        <div id="goal" class="course text no-top-border">${course.goal}</div>

        <#if course.place??>
            <div id="skuplace" class="course text no-bottom-border top-margin">
                <div class="title left">课程表</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div style="clear:both"></div>
            </div>
            <div class="bg-white"><hr class="sep"/></div>
            <div class="course place text no-top-border">
                <div class="name">${course.place.name}</div>
                <div class="info"><div class="left img right-margin"><img src="/img/weizhi3x.png" /></div>${course.place.address}</div>
                <div class="info"><div class="left img right-margin"><img src="/img/shijian3x.png" /></div>${course.place.scheduler}</div>
                <div style="clear:both"></div>
            </div>
        </#if>

        <#if course.book??>
            <#if (course.book.imgs?size > 0)>
                <div id="book" class="course text no-bottom-border top-margin">
                    <div class="title left">课前绘本</div>
                    <div class="arrow right"><img src="/img/allow3x.png" /></div>
                    <div style="clear:both"></div>
                </div>
                <div class="bg-white"><hr class="sep"/></div>
                <div class="course text no-top-border">
                    <#list course.book.imgs as img>
                        <#if (img_index < 2)>
                            <div class="left bookimg right-margin"><img src="${img}" /></div>
                        <#elseif (img_index == 2)>
                            <div class="left bookimg"><img src="${img}" /></div>
                        <#else>
                            <#break>
                        </#if>
                    </#list>
                    <div style="clear:both"></div>
                </div>
            </#if>
        </#if>

        <div id="detail" class="course text no-bottom-border top-margin">
            <div class="title left">课程内容</div>
            <div class="arrow right"><img src="/img/allow3x.png" /></div>
            <div style="clear:both"></div>
        </div>
        <div class="bg-white"><hr class="sep"/></div>
        <div id="flow" class="course text no-top-border">${course.flow}</div>

        <#if course.teachers??>
            <div id="teacher" class="course text no-bottom-border top-margin">
                <div class="title left">讲师团</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div style="clear:both"></div>
            </div>
            <div class="bg-white"><hr class="sep"/></div>
            <div class="course text no-top-border">
                <#list course.teachers as teacher>
                    <#if (teacher_index < 5)>
                        <div class="left teacher right-margin"><img src="${teacher.avatar}" /></div>
                    <#elseif (teacher_index == 5)>
                        <div class="left teacher"><img src="${teacher.avatar}" /></div>
                    <#else>
                        <#break>
                    </#if>
                </#list>
                <div style="clear:both"></div>
            </div>
        </#if>

        <div class="course text no-bottom-border top-margin"><div class="title">特别提示</div></div>
        <div class="bg-white"><hr class="sep"/></div>
        <div id="tips" class="course text no-top-border">${course.tips}</div>

        <#if course.institution??>
            <div id="institution" class="course text no-bottom-border top-margin">
                <div class="title left">合作机构介绍</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div style="clear:both"></div>
            </div>
            <div class="bg-white"><hr class="sep"/></div>
            <div id="institution" class="course text no-top-border">${course.institution}</div>
        </#if>

    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/hhSwipe.js"></script>
    <script type="text/javascript" src="/js/scroll.js"></script>
    <script type="text/javascript" src="/js/course/course.js"></script>
</@override>

<@extends name="../base.ftl"/>
