<@override name="title">提交订单</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/subject/placeorder.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>提交订单</div>
    <div class="content has-fix-footer">
        <div class="title">选择课程包</div>

        <div class="placeorder">
            <#list params.skus as sku>
                <#if (sku_index > 0)><hr class="sep"></#if>
                <div id="${sku.id}" price="${sku.price}" sid="${sku.subjectId}" class="line large sku">
                    <div class="left">
                        <div class="price overflow-hidden">¥${sku.price}元/组</div>
                        <div class="desc overflow-hidden">${sku.desc}</div>
                    </div>
                    <div class="right sel"><img src="/img/notsel2x.png" /></div>
                </div>
            </#list>
        </div>

        <div class="placeorder top-margin">
            <div class="line">
                <div class="left letter-sp8">联系人</div>
                <input type="text" id="name" placeholder="输入联系人姓名" value="${params.contact.name}" />
            </div>
            <hr class="sep">
            <div class="line">
                <div class="left">联系电话</div>
                <input type="tel" id="mobile" placeholder="输入手机号码" value="${params.contact.mobile}" />
            </div>
        </div>

    </div>

    <div class="footer fixed">
        <div class="left price top-border">总价：¥ <span id="total_fee" class="number">0</span></div>
        <div class="right"><button id="btn_submit" class="btn-orange">提交订单</button></div>
        <div style="clear:both"></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/gift/placeorder.js"></script>
</@override>

<@extends name="../base.ftl"/>
