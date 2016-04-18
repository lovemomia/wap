<@override name="title">红包</@override>

<@override name="css">
    <style type="text/css">
        body {
            text-align: center;
        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>红包</div>
    <div class="content">
        <button id="btn_receive" class="btn-main">领取红包</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            $("#btn_receive").on("click", function () {
                window.location.href = "/activity/getcoupon?id=${coupon.id}";
            })
        })
    </script>
</@override>

<@extends name="../base.ftl"/>
