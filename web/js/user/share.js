$(function () {
    $("#btn_share").on("click", function () {
        if (sg.common.is_weixin()) {
            sg.share.share_tips();
        } else {
            alert("分享功能只能在微信中使用哦~");
        }
    });
});

sg.share = {
    share_tips: function () {
        var html = "";
        html += "<div class='share_tips' onclick='$(this).remove()'>";
        html += "<img src='/img/share.png' />";
        html += "</div>";
        $(document.body).append(html);
    }
};