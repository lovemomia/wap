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
        var list = data.list;
        if (list.length > 0) {
            var status = sg.common.param("status", 1);
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_course_html(list[i], i, list.length);
            }
            html += "</div>";

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.booked.more(status, data.nextIndex);
            });

            $(".list .booked .element:last").removeClass("bottom-border");
            $(".btn-delete").on("click", function () {
                var parent_div = $(this).parent().parent();
                var bid = parent_div.attr("bid");

                if (window.confirm('确定要删除这门课程吗？')) {
                    sg.common.post(sg.config.api + "/course/cancel", {
                        utoken: sg.common.cookie.get("utoken"),
                        bid: bid
                    }, function (data) {
                        parent_div.remove();
                        $(".list .booked .element:last").removeClass("bottom-border");
                    });
                }
            });
        }

        function generate_course_html(course, index, count) {
            var status = sg.common.param("status", 1);

            var html = "";
            html += "<div bid=" + course.bookingId + " class='booked'>";
            html += "<a href='/course?id=" + course.id + "'>";
            html += "<div class='element scrollable bottom-border'>";
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
            if (status == 1) {
                html += "<div class='btn'>";
                html += "<button class='btn-orange btn-delete'>删除</button>";
                html += "</div>";
            }
            html += "</div>";

            return html;
        }
    }
};