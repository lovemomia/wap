$(function () {
    if ($("#scroll_img").length > 0) sg.scroll.scroll_img();

    var id = sg.common.param("id");

    $("#btn_cancel").on("click", function () {
        var bid = sg.common.param("bid");

        if (window.confirm('确定要删除这门课程吗？')) {
            sg.common.post(sg.config.api + "/course/cancel", {
                utoken: sg.common.cookie.get("utoken"),
                bid: bid
            }, function () {
                sg.common.back();
            });
        }
    });

    $("#skuplace").on("click", function () {
        window.location.href = "/course/skuplace?id=" + id;
    });

    $("#book").on("click", function () {
        window.location.href = "/course/book?id=" + id;
    });

    $("#detail").on("click", function () {
        window.location.href = "/course/detail?id=" + id;
    });

    $("#teacher").on("click", function () {
        window.location.href = "/course/teacher?id=" + id;
    });

    $("#institution").on("click", function () {
        window.location.href = "/institution/detail?id=" + id;
    });

    $("#goal").html(sg.common.sections_html($("#goal").html()));
    $("#flow").html(sg.common.sections_html($("#flow").html()));
    $("#tips").html(sg.common.sections_html($("#tips").html()));
    $("#institution").html(sg.common.sections_html($("#institution").html()));
});
