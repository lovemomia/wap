$(function () {
    var utoken = sg.common.cookie.get("utoken");
    if (utoken == '') {
        window.location.href = "/auth/login";
    }
});