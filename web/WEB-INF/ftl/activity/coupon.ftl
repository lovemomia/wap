<@override name="title">红包</@override>

<@override name="css">
    <style type="text/css">
        body {
            text-align: center;
        }

        .content {
            width: 100%;
            height: 6.63rem;
            background-image: url("http://s.sogokids.com/2016-04-19/3ccc8832f849a8a6e4f581ab8aa301ec.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        #btn_receive {
            margin-top: 2.45rem;
            width: 1.25rem;
            height: 1.25rem;
            background-color: transparent;
            background-image: url("/img/chai.png");
            background-size: 100% 100%;
            border-radius: 0.75rem;
        }
    </style>
</@override>

<@override name="body">
    <div class="content">
        <button id="btn_receive" class="btn-main"></button>
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
