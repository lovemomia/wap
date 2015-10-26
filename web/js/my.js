$(function () {
    var utoken = sg.common.cookie.get("utoken");
    if (utoken == '') {
        window.location.href = "/auth/login.html";
    } else {
        sg.common.get(sg.config.api + "/user", {
            utoken: utoken
        }, sg.my.success, sg.my.error);
    }
});

sg.my = {
    success: function (resp) {
        if (resp.errno == 100001) {
            sg.common.cookie.del("utoken");
            window.location.href = "/auth/login.html";
        } else if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            data = resp.data;
            var avatar = data.avatar;
            var nickName = data.nickName;
            if (avatar == '') {
                $("#avatar").attr("src", "/img/avatar01.png");
            } else {
                $("#avatar").attr("src", avatar);
            }

            $("#nickname").html(nickName);
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    }
};