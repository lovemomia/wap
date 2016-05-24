<@override name="title">激活VIP卡</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/auth.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>激活VIP卡</div>
    <div class="content top-margin">
        <div class="form">
            <dl>
                <dt class="letter-sp32">卡号</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="card" name="card" placeholder="输入卡号" />
                </dd>
            </dl>
            <hr class="left-margin" />
            <dl>
                <dt class="letter-sp8">卡密码</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="password" name="password" placeholder="输入卡密码">
                </dd>
            </dl>
        </div>
        <div class="btn" style="margin-top: 0.2rem"><button id="btn_register" class="btn-main-lg">激活</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            if (!sg.common.is_login()) {
                alert("只有注册用户才能使用VIP卡，请先登录或注册");
                sg.common.redirect_login();
            } else {
                $("#btn_register").on("click", function () {
                    var card = $("#card").val();
                    var password = $("#password").val();
                    if (!card || card == "") {
                        alert("无效的卡号");
                    } else if (!password || password == "") {
                        alert("密码不能为空");
                    } else {
                        sg.common.post(sg.config.api + "/vipcard/register", {
                            utoken: sg.common.cookie.get("utoken"),
                            card: card,
                            password: password
                        }, function (data) {
                            if (data) alert("激活成功");
                            window.location.href = "/my";
                        });
                    }
                });
            }
        });
    </script>
</@override>

<@extends name="../base.ftl"/>
