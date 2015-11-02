$(function () {
    var id = sg.common.param("sid");
    sg.courselist.more(id, 0);
});

sg.courselist = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/subject/course", {
            id: id,
            start: start
        }, sg.courselist.success);
    },

    success: function (data) {
        var list = data.courses.list;
        if (list.length > 0) {
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            var pid = sg.common.param("pid")
            for (var i = 0; i < list.length; i++) {
                html += generate_course_html(list[i], pid);
                if (i < list.length - 1) html += "<hr class='sep' />";
            }
            html += "</div>";

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.courselist.more(sg.common.param("sid"), data.nextIndex);
            });
        }

        function generate_course_html(course, pid) {
            var html = "";
            if (pid == null) {
                html += "<a href='/course?id=" + course.id + "'>";
            } else {
                html += "<a href='/course/skuplace?id=" + course.id + "&pid=" + pid + "'>";
            }
            html += "<div class='element scrollable'>";
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
    }
};