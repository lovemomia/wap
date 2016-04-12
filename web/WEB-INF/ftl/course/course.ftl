<@override name="title">课程详情</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/course/course.css">
</@override>

<@override name="body">
    <#if !(course.cancelable?? && course.cancelable == true)>
        <div class="content has-fix-footer">
    <#else>
        <div class="content bottom-padding">
    </#if>

    <#if (course.cancelable?? && course.cancelable == true)>
        <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>课程详情</div>
        <div class="list">
            <div class="element">
                <div class="left"><img src="${course.cover}" /></div>
                <div class="right">
                    <div class="title overflow-hidden">${course.title}</div>
                    <div class="desc overflow-hidden">${course.address}</div>
                    <div class="desc overflow-hidden">${course.scheduler}</div>
                </div>
                <div style="clear: both;"></div>
            </div>
        </div>
    <#else>
        <#if (course.imgs?size == 0)>
            <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>课程详情</div>
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
                <div class="header bg-transparent fix-parent"><div class="back left"><img src="/img/back3x.png"></div></div>
            </div>
        </#if>

        <div class="course-title">${course.title}</div>
    </#if>

    <div class="course all-padding bottom-border" style="background-color: #f8f8f8">
        <div class="left tag img"><img src="/img/tag3x.png"/></div>
        <div class="left tag desc">适合${course.age}</div>
        <#if (course.insurance == true)>
            <div class="left tag img"><img src="/img/tag3x.png"/></div>
            <div class="left tag desc">送保险</div>
        </#if>
        <#if (course.joined > 0)>
            <div class="left tag img"><img src="/img/tag3x.png"/></div>
            <div class="left tag desc">${course.joined}人已参加</div>
        </#if>
        <div style="clear:both"></div>
    </div>

    <#if (course.cancelable?? && course.cancelable==true)>
        <div id="btn_cancel" class="top-margin btn">
            <button class="btn-main-lg">取消预约</button>
        </div>
    </#if>

    <#if course.place??>
        <div id="skuplace" class="course top-border top-margin">
            <div class="title left no-border">课程表</div>
            <div class="arrow right"><img src="/img/allow3x.png" /></div>
            <div style="clear:both"></div>
        </div>
        <div class="bg-white"><hr class="left-margin"/></div>
        <div class="course place text bottom-border">
            <div class="name">${course.place.name}</div>
            <div class="info"><div class="left img right-margin"><img src="/img/shijian3x.png" /></div>${course.place.scheduler}</div>
            <div class="info"><div class="left img right-margin"><img src="/img/weizhi3x.png" /></div>${course.place.address}</div>
            <div style="clear:both"></div>
        </div>
    </#if>

    <div class="tabs top-margin">
        <ul>
            <li><a href="#panel-1">课程介绍</a></li>
            <li><a href="#panel-2">购买须知</a></li>
            <li><a href="#panel-3">用户评价</a></li>
        </ul>

        <div id="panel-1" class="bottom-border">
            <div id="goal" class="course text no-border">${course.goal}</div>
            <#if course.detail??>
            <div class="course detail bottom-padding">
                <#list course.detail as detailblock>
                    <#if (detailblock_index > 0)>
                        <div class="title top-margin overflow-hidden">
                    <#else>
                        <div class="title overflow-hidden">
                    </#if>
                    <div class="idx">${detailblock_index+1}</div>${detailblock.title}</div>
                    <#list detailblock.content as contentblock>
                        <#if contentblock.img??>
                            <div class="img"><img src="${contentblock.img}" /></div>
                        </#if>
                        <#if contentblock.text??>
                            <div class="detail-text">${contentblock.text}</div>
                        </#if>
                    </#list>
                </#list>
            </div>
            </#if>

            <#if (course.tips?length>0)>
                <div class="course text no-border"><div class="title">上课注意事项</div></div>
                <div id="tips" class="course text no-border">${course.tips}</div>
            </#if>

            <#if course.teachers??>
                <div id="teacher" class="course text no-border">
                    <div class="title">专业讲师</div>
                </div>
                <#list course.teachers as teacher>
                    <#if (teacher_index>0)>
                        <div class="bg-white"><hr class="left-margin"/></div>
                    </#if>
                    <div class="course teacher text">
                    <div class="left"><img src="${teacher.avatar}" /></div>
                    <div class="right">
                        <div class="name overflow-hidden">${teacher.name}</div>
                        <div class="education overflow-hidden">${teacher.education}</div>
                    </div>
                    <div style="clear:both"></div>
                    <div class="experience">${teacher.experience}</div>
                </div>
                </#list>
            </#if>
        </div>
        <div id="panel-2">
            <#if (course.buyable?? && course.buyable) || (course.trial?? && course.trial)>
                <div id="notice" class="text bottom-border">${course.notice}</div>
            <#else>
                <div id="subject_notice" class="text bottom-border">
                    <#list course.subjectNotice as notice>
                        <div class="notice title">${notice.title}</div>
                        <div class="notice content">${notice.content}</div>
                    </#list>
                </div>
            </#if>
        </div>
        <div id="panel-3">
            <#if (course.comments?? && course.comments.totalCount>0)>
                <div class="course comment bg-white bottom-border">
                    <#list course.comments.list as comment>
                        <#if (comment_index > 0)><hr class="left-margin" /></#if>
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
                                <hr class="sep full"/>
                                <div class="comment-content">${comment.content}</div>
                                <#if (comment.imgs?size>0)>
                                    <#list comment.imgs as img>
                                        <#if (img_index%3==0)>
                                        <div class="comment-img">
                                        </#if>
                                        <img src="${img}" />
                                        <#if (img_index%3==2 || (img_index+1) == comment.imgs?size)>
                                            <div style="clear:both"></div>
                                        </div>
                                        </#if>
                                    </#list>
                                </#if>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="logo"><img src="/img/logo3x.png"></div>
                <div class="tips">
                    <p>目前还没有任何评价，快去抢沙发吧~</p>
                </div>
            </#if>
        </div>
    </div>

    <#if !(course.cancelable?? && course.cancelable == true)>
        <#if (course.buyable?? && course.buyable)>
            <div class="footer fixed">
                <div class="left top-border">价格: ¥ <span class="number">${course.price}</span></div>
                <#if course.status==1>
                    <div class="right"><button id="btn_buy" sid="${course.subjectId}" class="btn-orange">立即抢购</button></div>
                <#else>
                    <#if (course.packageId?? && course.packageId>0)>
                        <div class="right"><button id="btn_booking" class="btn-main" coid="${course.id}" pid="${course.packageId}">立即预约</button></div>
                    <#else>
                        <div class="right"><button class="btn-gray">已经售完</button></div>
                    </#if>
                </#if>
                <div style="clear:both"></div>
            </div>
        <#elseif course.trial?? && course.trial>
            <div class="footer fixed">
                <div class="left top-border">价格: ¥ <span class="number">1</span></div>
                <#if course.status==1>
                    <div class="right"><button id="btn_try" sid="${course.subjectId}" class="btn-orange">加入试听</button></div>
                <#else>
                    <#if (course.packageId?? && course.packageId>0)>
                        <div class="right"><button id="btn_booking" class="btn-main" coid="${course.id}" pid="${course.packageId}">立即预约</button></div>
                    <#else>
                        <div class="right"><button class="btn-gray">已经售完</button></div>
                    </#if>
                </#if>
                <div style="clear:both"></div>
            </div>
        <#else>
            <div class="footer fixed">
                <div class="left price top-border"><span class="left-margin">¥ </span><span class="number">${course.cheapestSkuPrice}</span><span>起/${course.cheapestSkuTimeUnit}</span><span class="price-desc right">${course.cheapestSkuDesc}</span></div>
                <#if (course.packageId?? && course.packageId>0)>
                    <div class="right"><button id="btn_booking" class="btn-main" coid="${course.id}" pid="${course.packageId}">立即预约</button></div>
                <#else>
                    <div class="right"><button id="btn_buy_subject" sid="${course.subjectId}" class="btn-orange">立即抢购</button></div>
                </#if>
                <div style="clear:both"></div>
            </div>
        </#if>
    </#if>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/hhSwipe.js"></script>
    <script type="text/javascript" src="/js/scroll.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/course/course.js"></script>
</@override>

<@extends name="../base.ftl"/>
