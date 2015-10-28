$(function () {
    var status = sg.booked.param_status();
    if (status == 2) $("#finished").addClass("on");
    else $("#notfinished").addClass("on");

    sg.booked.more(status, 0);
});

sg.booked = {
    param_status: function () {
        var status = sg.common.param("status");
        if (status == null || status != 2) status = 1;

        return status;
    },

    more: function (status, start) {
        sg.common.check_login();

        if (status == 2) {
            sg.common.get(sg.config.api + "/user/course/finished", {
                utoken: sg.common.cookie.get("utoken"),
                start: start
            }, sg.booked.success, sg.booked.error);
        } else {
            sg.common.get(sg.config.api + "/user/course/notfinished", {
                utoken: sg.common.cookie.get("utoken"),
                start: start
            }, sg.booked.success, sg.booked.error);
        }
    },

    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            var list = resp.data.list;
            if (list.length > 0) {
                var status = sg.booked.param_status();
                unbind_scrollin();

                var html = "";
                html += "<div class='list small bottom-border'>";
                for (var i = 0; i < list.length; i++) {
                    html += generate_course_html(list[i]);
                    if (i < list.length - 1) html += "<hr class='sep' />";
                }
                html += "</div>";

                $(".content").append(html);

                if (resp.data.nextIndex != undefined) bind_scrollin(status, resp.data.nextIndex);
            }
        }

        function unbind_scrollin() {
            var last = $(".element:last");
            last.unbind("scrollin");
        }

        function generate_course_html(course) {
            var html = "";
            html += "<div class='element'>";
            html += "<a href='/course?id=" + course.id + "'>";
            html += "<div class='left'>";
            html += "<img src='" + course.cover + "' />";
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + course.title + "</div>";
            html += "<div class='desc overflow-hidden'>" + course.place.address + "</div>";
            html += "<div class='desc overflow-hidden'>" + course.scheduler + "</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</a>";
            html += "</div>";

            return html;
        }

        function bind_scrollin(status, next_index) {
            var last = $(".element:last");
            last.bind("scrollin", function () {
                sg.booked.more(status, next_index);
            });
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    }
};