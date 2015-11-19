$(function () {
    sg.common.remove_histories();

    var avatar = $("#avatar").attr("src");
    if (avatar == "") $("#avatar").attr("src", "/img/avatar01.png");

    $("#index").on("click", function () {
        window.location.href = "/index";
    });

    $("#btn_login").on("click", function () {
        window.location.href = "/auth/login";
    });

    $("#btn_logout").on("click", function () {
        if (window.confirm('确定要退出登录吗？')) {
            sg.common.cookie.del("utoken");
            window.location.href = "/my";
        }
    });
});