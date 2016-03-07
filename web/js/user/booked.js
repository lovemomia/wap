$(function () {
    var status = sg.common.param("status", 1);
    if (status == 2) $("#finished").addClass("on");
    else $("#notfinished").addClass("on");

    if (!sg.common.is_login()) {
        sg.common.redirect_login();
    } else {
        sg.booked.more(status, 0);
    }
});

sg.booked = {
    more: function (status, start) {
        if (status == 2) {
            sg.common.get(sg.config.api + "/user/course/finished", {
                utoken: sg.common.cookie.get("utoken"),
                start: start
            }, sg.booked.success);
        } else {
            sg.common.get(sg.config.api + "/user/course/notfinished", {
                utoken: sg.common.cookie.get("utoken"),
                start: start
            }, sg.booked.success);
        }
    },

    success: function (data) {
        var totalCount = data.totalCount;
        if (totalCount > 0) {
            var list = data.list;
            var status = sg.common.param("status", 1);
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_course_html(list[i]);
                if (i < list.length - 1) html += "<hr class='left-margin' />";
            }
            html += "</div>";

            $(".courses").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.booked.more(status, data.nextIndex);
            });

            $(".list .booked .element:last").removeClass("bottom-border");
        } else {
            var html = "";
            html += "<div class='logo'><img src='/img/logo3x.png'></div>";
            html += "<div class='tips'>";
            html += "<p>没有待上课程，快去选课吧~</p>";
            html += "</div>";

            $(".courses").html(html);
        }

        function generate_course_html(course) {
            var status = sg.common.param("status", 1);

            var html = "";
            html += "<div class='booked'>";
            if (status == 1) {
                html += "<a href='/course/cancelable?id=" + course.id + '&bid=' + course.bookingId + "'>";
            } else {
                html += "<a href='/course?id=" + course.id + "'>";
            }
            html += "<div class='element scrollable'>";
            html += "<div class='left'>";
            html += "<img src='" + course.cover + "' />";
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + course.title + "</div>";
            html += "<div class='desc overflow-hidden'>" + course.place.address + "</div>";
            html += "<div class='desc overflow-hidden'>" + course.scheduler + "</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";
            html += "</a>";
            html += "</div>";

            return html;
        }
    }
};