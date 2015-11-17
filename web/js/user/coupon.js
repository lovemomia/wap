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
            html += "<div class='list'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_coupon_html(list[i]);
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
            if (coupon.status == 2) {
                html += "<div class='coupon' style='background-image: url(/img/hongbaohui2x.png)'>";
                html += "<div class='label'><img src='/img/yishiyong2x.png' /></div>";
            } else if (coupon.status == 3) {
                html += "<div class='coupon' style='background-image: url(/img/hongbaohui2x.png)'>";
                html += "<div class='label'><img src='/img/yiguoqi2x.png' /></div>";
            } else {
                html += "<div class='coupon' style='background-image: url(/img/hongbao2x.png)'>";
            }
            html += "<div class='element scrollable'>";
            html += "<div class='discount'><span class='number'>" + coupon.discount + "</span>元</div>";
            html += "<div class='desc'>使用说明: " + coupon.desc + "</div>";
            html += "<div class='desc'>有效期: " + coupon.startTime + "至" + coupon.endTime + "</div>";
            html += "</div>";
            html += "</div>";

            return html;
        }
    },
};