<@override name="title">课程详情</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/scroll.css">
    <link rel="stylesheet" type="text/css" href="/css/course/course.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>课程详情</div>
    <#if !(course.cancelable?? && course.cancelable == true) && (course.buyable || course.trial??)>
        <div class="content has-fix-footer">
    <#else>
        <div class="content bottom-padding">
    </#if>

        <#if (course.cancelable?? && course.cancelable == true)>
        <div class="list">
            <div class="element">
                <div class="left"><img src="${course.cover}" /></div>
                <div class="right">
                    <div class="title overflow-hidden">${course.title}</div>
                    <div class="desc overflow-hidden">${course.address}</div>
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

            <#if !course.buyable>
                <div class="course-title no-bottom-padding">${course.title}</div>
                <div class="course text no-top-padding no-bottom-padding no-border">
                    <#if (course.price > 0)>
                        <div class="left price">价值<span class="left-margin">¥</span><span class="number">${course.price}</span></div>
                    <#else>
                        <div class="left price"><span class="free">公益课</span></div>
                    </#if>
                    <div style="clear:both"></div>
                </div>
            <#else>
                <div class="course-title">${course.title}</div>
            </#if>
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

        <#if (course.cancelable?? && course.cancelable==true)>
        <div id="btn_cancel" class="top-margin">
            <button class="btn-lg-main">取消预约</button>
        </div>
        </#if>

        <#if (course.comments?? && course.comments.totalCount>0)>
            <div id="comment" class="course text no-bottom-border top-margin">
                <div class="title left">用户点评</div>
                <#--<div class="arrow right"><img src="/img/allow3x.png" /></div>-->
                <div style="clear:both"></div>
            </div>
            <div class="course comment bottom-border">
                <#list course.comments.list as comment>
                    <div class="bg-white"><hr class="sep"/></div>
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
        </#if>

        <div class="course text no-bottom-border top-margin"><div class="title">课程内容</div></div>
        <div class="bg-white"><hr class="sep"/></div>
        <div id="goal" class="course text no-border">${course.goal}</div>
        <#if course.detail??>
        <div class="course detail bottom-border bottom-padding">
            <#list course.detail as detailblock>
                <div class="title overflow-hidden"><div class="idx">${detailblock_index+1}</div>${detailblock.title}</div>
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

        <#if course.teachers??>
            <div id="teacher" class="course text no-bottom-border top-margin">
                <div class="title left">专业讲师</div>
                <div class="arrow right"><img src="/img/allow3x.png" /></div>
                <div style="clear:both"></div>
            </div>
            <div class="bg-white"><hr class="sep"/></div>
            <div class="course teacher text no-top-border">
                <#list course.teachers as teacher>
                    <#if (teacher_index == 0)>
                        <div class="left"><img src="${teacher.avatar}" /></div>
                        <div class="right">
                            <div class="name overflow-hidden">${teacher.name}</div>
                            <div class="education overflow-hidden">${teacher.education}</div>
                            <div class="experience overflow-hidden">${teacher.experience}</div>
                        </div>
                        <div style="clear:both"></div>
                    </#if>
                </#list>
            </div>
        </#if>

        <#if (course.tips?length>0)>
            <div class="course text no-bottom-border top-margin"><div class="title">特别提示</div></div>
            <div class="bg-white"><hr class="sep"/></div>
            <div id="tips" class="course text no-top-border">${course.tips}</div>
        </#if>

        <#if (course.notice?? && course.notice?length>0)>
            <div class="course text no-bottom-border top-margin"><div class="title">购买须知</div></div>
            <div class="bg-white"><hr class="sep"/></div>
            <div id="notice" class="course text no-top-border">${course.notice}</div>
        </#if>

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

    <#if !(course.cancelable?? && course.cancelable == true)>
        <#if course.buyable>
            <div class="footer fixed">
                <div class="left top-border">价格: ¥ <span class="number">${course.price}</span></div>
                <#if course.status==1>
                    <div class="right"><button id="btn_buy" sid="${course.subjectId}" class="btn-orange">立即抢购</button></div>
                <#else>
                    <div class="right"><button class="btn-gray">已经售完</button></div>
                </#if>
                <div style="clear:both"></div>
            </div>
        <#elseif course.trial?? && course.trial>
            <div class="footer fixed">
                <div class="left top-border">价格: ¥ <span class="number">1</span></div>
                <#if course.status==1>
                    <div class="right"><button id="btn_try" sid="${course.subjectId}" class="btn-orange">加入试听</button></div>
                <#else>
                    <div class="right"><button class="btn-gray">已经售完</button></div>
                </#if>
                <div style="clear:both"></div>
            </div>
        </#if>
    </#if>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/hhSwipe.js"></script>
    <script type="text/javascript" src="/js/scroll.js"></script>
    <script type="text/javascript" src="/js/course/course.js"></script>
</@override>

<@extends name="../base.ftl"/>
