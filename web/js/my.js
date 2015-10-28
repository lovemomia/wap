$(function () {
    sg.common.remove_histories();

    $("#index").on("click", function () {
        window.location.href = "/index";
    });

    $("#btn_login").on("click", function () {
        window.location.href = "/auth/login";
    });

    $("#btn_logout").on("click", function () {
        sg.common.cookie.del("utoken");
        window.location.href = "/my";
    });
});