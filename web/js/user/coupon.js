$(function () {
    var status = sg.common.param("status", 0);
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
        var status = sg.common.param("status", 0);
        var list = data.list;
        if (data.totalCount == 0) {
            var html = "";
            html += "<div class='wuhongbao'><img src='/img/wuhongbao2x.png' /></div>";
            if (status == 3) {
                html += "<div class='tip'>暂无过期红包</div>";
                html += "<div class='link'><a href='/user/coupon?status=0&start=0'>可用红包</a></div>";
            } else {
                html += "<div class='tip'>暂无可用红包</div>";
                html += "<div class='link'><a href='/user/coupon?status=3&start=0'>过期红包</a></div>";
            }

            $("body").addClass("bg-white");
            $(".content").html(html);
        } else if (list.length > 0) {
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_coupon_html(list[i]);
            }
            html += "</div>";
            if (status == 3) {
                html += "<div class='link'><a href='/user/coupon?status=0&start=0'>可用红包</a></div>";
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
            if (coupon.status != 1) {
                html += "<div class='discount disable'><span class='number disable'>" + coupon.discount + "</span>元</div>";
            } else {
                html += "<div class='discount'><span class='number'>" + coupon.discount + "</span>元</div>";
            }
            html += "<div class='desc'>" + coupon.desc + "</div>";
            html += "<div class='desc'>" + coupon.startTime + "至" + coupon.endTime + "</div>";
            html += "</div>";
            html += "</div>";

            return html;
        }
    },
};