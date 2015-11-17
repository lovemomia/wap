$(function () {
    $("#btn_share").on("click", function () {
        sg.share.share_tips();
    });
});

sg.share = {
    share_tips: function () {
        var html = "";
        html += "<div class='share_tips' onclick='$(this).remove()'>";
        html += "<div class='tips_info'>";
        html += "<p class='tip1'>请点击右上角按钮</p>"
        html += "<div class='tip2'>";
        html += "<img src='/img/timeline.png' />";
        html += "<div class='tip-desc'>分享到朋友圈，或</div>"
        html += "<img src='/img/friend.png' />";
        html += "<div class='tip-desc'>发送给好友</div>"
        html += "<div style='clear: both'></div>"
        html += "</div>";
        html += "</div>";
        html += "</div>";
        $(document.body).append(html);
    }
};