$(function () {
    sg.common.remove_histories();

    var utoken = sg.common.cookie.get("utoken");
    if (utoken == '') {
        sg.my.not_login();
    } else {
        sg.common.get(sg.config.api + "/user", {
            utoken: utoken
        }, sg.my.success, sg.my.error);
    }
});

sg.my = {
    not_login: function () {
        var html = "";
        html += "<div class='line large'>";
        html += "<div class='not-login-tips'>您还没有登录哦~</div>";
        html += "<div class='not-login-button'><button id='btn_login' class='btn btn-sm-main'>立即登录</button></div>";
        html += "<div style='clear: both;'></div>";
        html += "</div>";

        $("#profile").html(html);

        $("#btn_login").on("click", function () {
            window.location.href = "/auth/login";
        });
    },

    success: function (resp) {
        if (resp.errno == 100001) {
            sg.common.cookie.del("utoken");
            window.location.href = "/auth/login.html";
        } else if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            data = resp.data;
            var avatar = data.avatar;
            if (avatar == '') avatar = "/img/avatar01.png";
            var nickName = data.nickName;

            var html = "";
            html += "<div class='line large' onclick='window.location.href=\'/user/profile.html\''>";
            html += "<div class='img left'><img id='avatar' src='" + avatar + "' /></div>";
            html += "<div class='info left'>";
            html += "<div id='nickname'>" + nickName + "</div>";
            html += "<div id='children'></div>";
            html += "</div>";
            html += "<div class='arrow right'><img src='/img/allow3x.png' /></div>";
            html += "</div>";

            $("#profile").html(html);

            var logout_html = "";
            logout_html += "<div class='btn top-margin'>";
            logout_html += "<button id='btn_logout' class='btn-lg-main'>退出登录</button>";
            logout_html += "</div>";

            $(".content").append(logout_html);

            $("#btn_logout").on("click", function () {
                sg.common.cookie.del("utoken");
                window.location.href = "/my";
            });
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    }
};