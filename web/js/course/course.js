$(function () {
    if ($("#scroll_img").length > 0) sg.common.scroll_img();

    $("#goal").html(sg.common.sections_html($("#goal").html()));
    $("#flow").html(sg.common.sections_html($("#flow").html()));
    $("#tips").html(sg.common.sections_html($("#tips").html()));
    $("#institution").html(sg.common.sections_html($("#institution").html()));
});
