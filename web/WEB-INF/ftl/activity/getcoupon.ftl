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
                    if (data.status == 1) {
                        alert("领取成功");
                    } else if (data.status == 2) {
                        alert("你已经领取过了");
                    } else {
                        alert("领取失败");
                    }
                });
            }
        })
    </script>
</@override>

<@extends name="../base.ftl"/>
