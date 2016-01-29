$(function () {
    //if (!sg.common.is_weixin()) {
    //    alert("送礼功能目前只支持微信哦~");
    //    window.location.href = "/";
    //}

    $("#btn_send").on("click", function () {
        window.location.href = "/gift/placeorder?id=1";
    });

    $("#btn_share").on("click", function () {
        var html = "";
        html += "<div class='share_tips' onclick='$(this).remove()'>";
        html += "<img src='/img/share.png' />";
        html += "</div>";
        $(document.body).append(html);
    });
});