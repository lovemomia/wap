<@override name="title">红包</@override>

<@override name="css">
    <style type="text/css">
        body {
            text-align: center;
        }

        .content {
            padding-top: 1.6rem;
            width: 100%;
            height: 6.63rem;
            background-image: url("http://s.sogokids.com/2016-04-19/0bd56587d94b2ac6b3a119af8357e1a1.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .desc {
            margin: 0 auto;
            width: 2rem;
        }

        .discount {
            font-size: 0.3rem;
            color: #ff0000;
        }

        .success {
            color: #333333;
        }

        .dup {
            margin-top: 0.2rem;
            color: #333333;
        }

        .fail {
            margin-top: 0.3rem;
            color: #333333;
        }

        .btn {
            margin-top: 1.5rem;
        }
    </style>
</@override>

<@override name="body">
    <div class="content">
        <div class="desc"></div>
        <div class="btn"><button id="btn_use" class="btn-main">立即使用</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            if (!sg.common.is_login()) {
                sg.common.redirect_login();
            } else {
                var id = sg.common.param("id");
                sg.common.post(sg.config.api + "/activity/coupon", {
                    utoken: sg.common.cookie.get("utoken"),
                    coupon: id
                }, function (data) {
                    var html = "";
                    if (data.status == 1) {
                        var userCoupon = data.userCoupon;
                        html += "<div class='discount'>" + userCoupon.discount + "</div>"
                        html += "<div class='success'>恭喜您已获得" + userCoupon.discount + "元红包，可在购买松果课程时使用。</div>"
                        $(".desc").html(html);
                    } else if (data.status == 2) {
                        html += "<div class='dup'>您已领取过该红包了，不能重复领取哦~</div>"
                        $(".desc").html(html);
                    } else {
                        html += "<div class='fail'>领取失败，请与客服联系~</div>"
                        $(".desc").html(html);
                    }
                });
            }

            $("#btn_use").on("click", function () {
                window.location.href = "/";
            })
        })
    </script>
</@override>

<@extends name="../base.ftl"/>
