<@override name="title">上课地点</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/course/skuplace.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>上课地点<#if (params.pid > 0)><div id="btn_submit" class="right">提交</div></#if></div>
    <div class="content">
        <div class="tab bg-white bottom-border">
            <div id="cur_month" class="left" onclick="window.location.href='/course/skuplace?id=${params.id}&pid=${params.pid}&status=2'">${params.cur_month}</div>
            <div id="next_month" class="left" onclick="window.location.href='/course/skuplace?id=${params.id}&pid=${params.pid}&status=3'">${params.next_month}</div>
            <div style="clear: both;"></div>
        </div>

        <#if (params.dates?size > 0)>
            <#list params.dates as date>
                <#if (date.skus?size > 0)>
                    <div class="sku text no-bottom-border top-margin">
                        <div class="left day">${date.day}</div>
                        <div class="left">
                            <div class="month">${date.month}月</div>
                            <div class="weekday">${date.weekday}</div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="sku place bottom-border">
                        <#list date.skus as sku>
                            <div class="bg-white"><hr class="sep"/></div>
                            <#if sku.stock == 0>
                                <div class="element disable">
                            <#else>
                                <div sid="${sku.id}" class="element active">
                            </#if>
                                <div class="left">
                                    <div class="name">${sku.place.name}</div>
                                    <div class="address">${sku.place.address}</div>
                                    <div class="left time">${sku.time} </div>
                                    <#if sku.stock == 0>
                                        <div class="left stock full">名额已满</div>
                                    <#elseif (sku.stock < 10)>
                                        <div class="left stock">仅剩${sku.stock}个名额</div>
                                    <#else>
                                        <div class="left stock">还有${sku.stock}个名额</div>
                                    </#if>
                                    <div style="clear: both;"></div>
                                </div>
                                <#if (sku.stock > 0)>
                                    <div class="right sel"></div>
                                </#if>
                                <div style="clear: both;"></div>
                            </div>
                        </#list>
                    </div>
                </#if>
            </#list>
        <#else>
            <div class="logo"><img src="/img/logo3x.png"></div>
            <div class="tips">
                <p>这个时间段内目前还没有课程</p>
                <p>快去看看后面的日子有没有吧</p>
            </div>
        </#if>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/course/skuplace.js"></script>
</@override>

<@extends name="../base.ftl"/>
