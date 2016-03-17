$(function () {
    var status = sg.common.param("status", 2);
    if (status == 1) $("#all").addClass("on");
    else if (status == 2) $("#not_payed").addClass("on");
    else $("#payed").addClass("on");

    if (!sg.common.is_login()) {
        sg.common.redirect_login();
    } else {
        sg.order.more(status, 0);
    }
});

sg.order = {
    more: function (status, start) {
        sg.common.get(sg.config.api + "/user/order", {
            utoken: sg.common.cookie.get("utoken"),
            status: status,
            start: start
        }, sg.order.success);
    },

    success: function (data) {
        var totalCount = data.totalCount;
        if (totalCount > 0) {
            var list = data.list;
            var status = sg.common.param("status", 2);
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_order_html(list[i]);
                if (i < list.length - 1) html += "<hr class='left-margin' />";
            }
            html += "</div>";

            $(".orders").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.order.more(status, data.nextIndex);
            });
        } else {
            var html = "";
            html += "<div class='logo'><img src='/img/logo3x.png'></div>";
            html += "<div class='tips'>";
            html += "<p>没有相应的订单哦~</p>";
            html += "</div>";

            $(".orders").html(html);
        }

        function generate_order_html(order) {
            var html = "";
            html += "<div class='order'>";
            if (order.courseId > 0) {
                html += "<a href='/course?id=" + order.courseId + "'>";
            } else {
                html += "<a href='/subjectdetail?id=" + order.subjectId + "'>";
            }
            html += "<div class='element scrollable'>";
            html += "<div class='left'>";
            html += "<img src='" + order.cover + "' />";
            html += "</div>";
            if (order.status < 3) {
                html += "<div class='right pay'>";
            } else {
                html += "<div class='right'>";
            }
            html += "<div class='title overflow-hidden'>" + order.title + "</div>";
            html += "<div class='desc overflow-hidden'>总价：" + order.totalFee + "元</div>";
            html += "<div class='desc overflow-hidden'>数量：" + order.count + "</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";
            html += "</a>";
            if (order.status < 3) {
                html += "<div class='btn'>";
                html += "<button class='btn-orange' onclick='sg.order.pay(" + order.id +  "," + order.count + "," + order.totalFee + ")'>付款</button>";
                html += "</div>";
            }
            html += "</div>";

            return html;
        }
    },

    pay: function (oid, count, fee) {
        window.location.href = "/payment/pay?oid=" + oid + "&count=" + count + "&fee=" + fee;
    }
};