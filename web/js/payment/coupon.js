$(function () {
    sg.payment_coupon.more(0);
});

sg.payment_coupon = {
    more: function (start) {
        sg.common.get(sg.config.api + "/user/coupon", {
            utoken: sg.common.cookie.get("utoken"),
            status: 1,
            start: start
        }, sg.payment_coupon.success);
    },

    success: function (data) {
        var list = data.list;
        if (data.totalCount == 0) {
            var html = "";
            html += "<div class='wuhongbao'><img src='/img/wuhongbao2x.png' /></div>";
            html += "<div class='tip'>暂无可用红包</div>";

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

            $(".content").append(html);

            $(".coupon").on("click", function () {
                sessionStorage.setItem("couponId", $(this).attr('coupon_id'));
                sessionStorage.setItem("discount", $(this).attr('discount'));
                sg.common.back();
            });

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.payment_coupon.more(data.nextIndex);
            });
        }

        function generate_coupon_html(coupon) {
            var html = "";
            html += "<div class='coupon' coupon_id='" + coupon.id + "' discount='" + coupon.discount + "' style='background-image: url(/img/hongbao2x.png)'>";
            html += "<div class='element scrollable'>";
            html += "<div class='discount'><span class='number'>" + coupon.discount + "</span>元</div>";
            html += "<div class='desc'>" + coupon.desc + "</div>";
            html += "<div class='desc'>" + coupon.startTime + "至" + coupon.endTime + "</div>";
            html += "</div>";
            html += "</div>";

            return html;
        }
    }
};