$(function () {
    var id = sg.common.param("sid");
    sg.courselist.more(id, 0);
});

sg.courselist = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/subject/course", {
            id: id,
            start: start
        }, sg.courselist.success, sg.common.error);
    },

    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            var list = resp.data.courses.list;
            if (list.length > 0) {
                unbind_scrollin();

                var html = "";
                html += "<div class='list bottom-border'>";
                var pid = sg.common.param("pid")
                for (var i = 0; i < list.length; i++) {
                    html += generate_course_html(list[i], pid);
                    if (i < list.length - 1) html += "<hr class='sep' />";
                }
                html += "</div>";

                $(".content").append(html);

                if (resp.data.nextIndex != undefined) bind_scrollin(sg.common.param("sid"), resp.data.nextIndex);
            }
        }

        function unbind_scrollin() {
            var last = $(".element:last");
            last.unbind("scrollin");
        }

        function generate_course_html(course, pid) {
            var html = "";
            if (pid == null) {
                html += "<a href='/course?id=" + course.id + "'>";
            } else {
                html += "<a href='/course/skuplace?id=" + course.id + "&pid=" + pid + "'>";
            }
            html += "<div class='element'>";
            html += "<div class='left'>";
            html += "<img src='" + course.cover + "' />";
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + course.title + "</div>";
            html += "<div class='desc overflow-hidden'>" + course.age + " | " + course.scheduler + "</div>";
            html += "<div class='desc overflow-hidden'>" + course.region + "</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";
            html += "</a>";

            return html;
        }

        function bind_scrollin(status, next_index) {
            var last = $(".element:last");
            last.bind("scrollin", function () {
                sg.courselist.more(status, next_index);
            });
        }
    }
};