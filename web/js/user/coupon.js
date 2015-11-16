$(function () {
    var status = sg.common.param("status", 1);
    if (!sg.common.is_login()) {
        sg.common.redirect_login();
    } else {
        sg.coupon.more(status, 0);
    }
});

sg.coupon = {
    more: function (status, start) {
        sg.common.get(sg.config.api + "/user/coupon", {
            utoken: sg.common.cookie.get("utoken"),
            status: status,
            start: start
        }, sg.coupon.success);
    },

    success: function (data) {
        var list = data.list;
        if (list.length > 0) {
            var status = sg.common.param("status", 1);
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_coupon_html(list[i]);
                if (i < list.length - 1) html += "<hr class='sep' />";
            }
            html += "</div>";
            if (status == 3) {
                html += "<div class='link'><a href='/user/coupon?status=1&start=0'>可用红包</a></div>";
            } else {
                html += "<div class='link'><a href='/user/coupon?status=3&start=0'>过期红包</a></div>";
            }

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.coupon.more(status, data.nextIndex);
            });
        }

        function generate_coupon_html(coupon) {
            var html = "";
            html += "<div class='coupon'>";
            if (coupon.status == 1) {
                html += "<div class='label'><img src='/img/unused3x.png' /></div>";
            } else if (coupon.status == 3) {
                html += "<div class='label'><img src='/img/expired3x.png' /></div>";
            }
            html += "<div class='element scrollable'>";
            html += "<div class='left'>";
            html += "<img src='/img/coupon3x.png' />";
            html += "<div class='discount'>¥" + coupon.discount + "</div>";
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + coupon.title + "</div>";
            html += "<div class='desc overflow-hidden'>" + coupon.desc + "元</div>";
            html += "<div class='time overflow-hidden'>有效期：" + coupon.startTime + "至" + coupon.endTime + "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";
            html += "</div>";
            html += "</div>";

            return html;
        }
    },
};