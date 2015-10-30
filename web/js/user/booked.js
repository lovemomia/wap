$(function () {
    var status = sg.booked.param_status();
    if (status == 2) $("#finished").addClass("on");
    else $("#notfinished").addClass("on");

    if (!sg.common.is_login()) {
        window.location.href = "/auth/login";
    } else {
        sg.booked.more(status, 0);
    }
});

sg.booked = {
    param_status: function () {
        var status = sg.common.param("status");
        if (status == null || status != 2) status = 1;

        return status;
    },

    more: function (status, start) {
        if (status == 2) {
            sg.common.get(sg.config.api + "/user/course/finished", {
                utoken: sg.common.cookie.get("utoken"),
                start: start
            }, sg.booked.success, sg.common.error);
        } else {
            sg.common.get(sg.config.api + "/user/course/notfinished", {
                utoken: sg.common.cookie.get("utoken"),
                start: start
            }, sg.booked.success, sg.common.error);
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
                html += "<div class='list bottom-border'>";
                for (var i = 0; i < list.length; i++) {
                    html += generate_course_html(list[i], i, list.length);
                }
                html += "</div>";

                $(".content").append(html);

                if (resp.data.nextIndex != undefined) bind_scrollin(status, resp.data.nextIndex);

                $(".list .booked .element:last").removeClass("bottom-border");
                $(".btn-delete").on("click", function () {
                    var parent_div = $(this).parent().parent();
                    var bid = parent_div.attr("bid");

                    if (window.confirm('确定要删除这门课程吗？')) {
                        sg.common.post(sg.config.api + "/course/cancel", {
                            utoken: sg.common.cookie.get("utoken"),
                            bid: bid
                        }, function (resp) {
                            if (resp.errno != 0) {
                                alert(resp.errmsg);
                            } else {
                                parent_div.remove();
                                $(".list .booked .element:last").removeClass("bottom-border");
                            }
                        }, sg.common.error);
                    }
                });
            }
        }

        function unbind_scrollin() {
            var last = $(".element:last");
            last.unbind("scrollin");
        }

        function generate_course_html(course, index, count) {
            var status = sg.booked.param_status();

            var html = "";
            html += "<div bid=" + course.bookingId + " class='booked'>";
            html += "<a href='/course?id=" + course.id + "'>";
            html += "<div class='element bottom-border'>";
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

        function bind_scrollin(status, next_index) {
            var last = $(".element:last");
            last.bind("scrollin", function () {
                sg.booked.more(status, next_index);
            });
        }
    }
};