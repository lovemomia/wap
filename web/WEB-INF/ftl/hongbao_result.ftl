<@override name="title">送你50元松果亲子红包</@override>

<@override name="css">
    <style type="text/css">
        p {
            margin: 0.1rem 0;
        }

        .desc {
            font-size: 0.17rem;
            color: #666666;
        }

        .success {
            width: 1.2rem;
            margin: 0 auto;
            padding-top: 0.2rem;
            font-size: 0.2rem;
            color: #00c49d;
            text-align: center;
        }

        .success img {
            float: left;
            margin-right: 0.1rem;
            width: 0.25rem;
            height: 0.25rem;
        }

        #mobile {
            color: #f67531;
        }

        .btn {
            width: 3rem;
            margin: 0 auto;
            padding: 0.1rem 0;
        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>送你50元松果亲子红包</div>
    <div class="content">
        <div><img src="/img/hongbao-success.png"></div>
        <div class="desc">
            <div class="success"><img src="/img/tag3x.png" /><div class="left">领取成功</div><div style="clear:both;"></div></div>
            <p>红包已放入松果亲子账号</p>
            <p id="mobile"></p>
            <p>使用该手机号登录或注册即可使用</p>
        </div>
        <div class="btn">
            <#--<div class="left"><button id="btn_download" class="btn-main">下载APP</button></div>-->
            <div><button id="btn_home" class="btn-main">立即使用</button></div>
            <div style="clear: both;"></div>
        </div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            $("#mobile").html(sg.common.param("mobile"));

            $("#btn_download").on("click", function () {
                window.location.href = "http://a.app.qq.com/o/simple.jsp?pkgname=com.youxing.duola";
            });

            $("#btn_home").on("click", function () {
                window.location.href = "/";
            });
        });
    </script>
</@override>

<@extends name="base.ftl"/>
