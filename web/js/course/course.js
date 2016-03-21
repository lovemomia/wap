$(function () {
    if ($("#scroll_img").length > 0) sg.scroll.scroll_img();

    var id = sg.common.param("id");

    $("#btn_cancel").on("click", function () {
        var bid = sg.common.param("bid");

        if (window.confirm('确定要取消预约这门课程吗？')) {
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

    $("#btn_buy").on('click', function () {
        window.location.href = "/subject/placeorder?id=" + $(this).attr("sid") + "&coid=" + id;
    });

    $("#btn_try").on('click', function () {
        window.location.href = "/subject/placeorder?id=" + $(this).attr("sid");
    });

    $("#btn_buy_subject").on('click', function () {
        window.location.href = "/subject/placeorder?id=" + $(this).attr("sid");
    });

    $("#goal").html(sg.common.sections_html($("#goal").html()));
    $(".detail-text").each(function () {
        $(this).html(sg.common.sections_html($(this).html()));
    });
    $(".experience").html(sg.common.sections_html($(".experience").html()));
    $("#tips").html(sg.common.sections_html($("#tips").html()));
    $("#notice").html(sg.common.sections_html($("#notice").html()));
    $(".notice.content").each(function(){
        $(this).html(sg.common.sections_html($(this).html()));
    });

    $(".tabs").tabs();
});
