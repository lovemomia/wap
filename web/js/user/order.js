$(function () {
    var status = sg.order.param_status();
    if (status == 1) $("#all").addClass("on");
    else if (status == 2) $("#not_payed").addClass("on");
    else $("#payed").addClass("on");

    sg.order.more(status, 0);
});

sg.order = {
    param_status: function () {
        var status = sg.common.param("status");
        if (status == null) status = 2;

        return status;
    },

    more: function (status, start) {
        sg.common.check_login();

        sg.common.get(sg.config.api + "/user/order", {
            utoken: sg.common.cookie.get("utoken"),
            status: status,
            start: start
        }, sg.order.success, sg.order.error);
    },

    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            var list = resp.data.list;
            if (list.length > 0) {
                var status = sg.order.param_status();
                unbind_scrollin();

                var html = "";
                html += "<div class='list small bottom-border'>";
                for (var i = 0; i < list.length; i++) {
                    html += generate_order_html(list[i]);
                    if (i < list.length - 1) html += "<hr class='sep' />";
                }
                html += "</div>";

                $(".content").append(html);

                if (resp.data.nextIndex != undefined) bind_scrollin(status, resp.data.nextIndex);
            }
        }

        function unbind_scrollin() {
            var last = $(".element:last-child");
            last.unbind("scrollin");
        }

        function generate_order_html(order) {
            var html = "";
            html += "<div class='element'>";
            html += "<div class='left'>";
            html += "<img src='" + order.cover + "' />";
            html += "</div>";
            html += "<div class='right btn'>";
            if (order.status < 3) {
                html += "<button class='btn-orange' onclick='sg.order.pay(" + order.id +  ")'>付款</button>";
            }
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + order.title + "</div>";
            html += "<div class='price overflow-hidden'>总价：" + order.totalFee + "元</div>";
            html += "<div class='count overflow-hidden'>数量：" + order.count + "</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";

            return html;
        }

        function bind_scrollin(status, next_index) {
            var last = $(".element:last-child");
            last.bind("scrollin", function () {
                sg.order.more(status, next_index);
            });
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    },

    pay: function (oid) {
        window.location.href = "/payment/pay?oid=" + oid;
    }
};