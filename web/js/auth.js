$(function () {
    var ref = sg.common.param("ref");
    if (ref != null && ref != "") {
        sessionStorage.setItem("authRef", ref);
    }

    $("#btn_getcode").on("click", function () {
        var timer;
        var mobile = $("#mobile").val();
        if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else {
            sg.common.post(sg.config.api + "/auth/send", {
                mobile: mobile
            }, sg.auth.auth_send_success);
        }
    });

    $("#btn_register").on("click", function () {
        var nickName = $("#nickName").val();
        var password = $("#password").val();
        var mobile = $("#mobile").val();
        var code = $("#code").val();
        if (!nickName || nickName == "") {
            alert("用户昵称不能为空");
        } else if (!password || password == "") {
            alert("密码不能为空");
        } else if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else if (!code || code == "") {
            alert("验证码不能为空");
        } else {
            sg.common.post(sg.config.api + "/auth/register", {
                mobile: mobile,
                password: password,
                nickname: nickName,
                code: code
            }, sg.auth.auth_success);
        }
    });

    $("#btn_login").on("click", function () {
        var mobile = $("#mobile").val();
        var password = $("#password").val();
        if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else if (!password || password == "") {
            alert("密码不能为空");
        } else {
            sg.common.post(sg.config.api + "/auth/login", {
                mobile: mobile,
                password: password
            }, sg.auth.auth_success);
        }
    });

    $("#btn_login_code").on("click", function () {
        var mobile = $("#mobile").val();
        var code = $("#code").val();
        if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else if (!code || code == "") {
            alert("验证码不能为空");
        } else {
            sg.common.post(sg.config.api + "/auth/login/code", {
                mobile: mobile,
                code: code
            }, sg.auth.auth_success);
        }
    });

    $("#btn_password").on("click", function () {
        var mobile = $("#mobile").val();
        var password = $("#password").val();
        var code = $("#code").val();
        if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else if (!password || password == "") {
            alert("密码不能为空");
        } else if (!code || code == "") {
            alert("验证码不能为空");
        } else {
            sg.common.post(sg.config.api + "/auth/password", {
                mobile: mobile,
                password: password,
                code: code
            }, sg.auth.auth_success);
        }
    });
});

sg.auth = {
    auth_send_success: function (data) {
        var timer;
        var seconds = 60;
        var send_btn = $("#btn_getcode");
        send_wait();

        function send_wait() {
            send_btn.attr("disabled", "true");
            send_btn.addClass("colddown");
            timer = window.setInterval(set_remain_time, 1000); //启动计时器，1秒执行一次
        }

        function set_remain_time() {
            if (seconds == 1) {
                window.clearInterval(timer); //停止计时器
                send_btn.removeAttr("disabled"); //启用按钮
                send_btn.removeClass("colddown");
                send_btn.html("重新发送");
            } else {
                send_btn.html(seconds + "秒后重试");
                seconds--;
            }
        }
    },

    auth_success: function (data) {
        sg.common.cookie.set("utoken", data.token, 365);
        var ref = sessionStorage.getItem("authRef");
        if (ref != null) {
            window.location.href = ref;
        } else {
            sg.common.back();
        }
    }
};
