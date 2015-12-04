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
        var totalCount = data.courses.totalCount;
        if (totalCount > 0) {
            var list = data.courses.list;
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

            if (data.courses.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.courselist.more(sg.common.param("sid"), data.courses.nextIndex);
            });
        } else {
            var html = "";
            html += "<div class='logo'><img src='/img/logo3x.png'></div>";
            html += "<div class='tips'>";
            html += "<p>目前还没有可选课程，我们会尽快推出的哦~</p>";
            html += "</div>";

            $(".content").html(html);
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