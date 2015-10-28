$(function () {
    if ($("#scroll_img").length > 0) sg.common.scroll_img();

    $("#intro").html(sg.common.sections_html($("#intro").html()));

    $(".notice.content").each(function(){
        $(this).html(sg.common.list_html($(this).html()));
    });

    $("#btn_buy").on("click", function () {
        window.location.href = "/subject/placeorder?id=" + sg.common.param("id");
    });
});
