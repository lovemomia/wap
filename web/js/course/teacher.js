$(function () {
    var id = sg.common.param("id");
    sg.teacher.more(id, 0);
});

sg.teacher = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/course/teacher", {
            id: id,
            start: start
        }, sg.teacher.success, sg.teacher.error);
    },

    success: function (resp) {
        if (resp.errno != 0) {
            $(".content").append("<div class='error'>" + resp.errmsg + "</div>");
        } else {
            if (resp.data.totalCount <= 0) {
                $(".content").html("<div class='error'>本课程暂无助教老师</div>");
            } else {
                var html = "";
                var list = resp.data.list;
                for (var i = 0; i < list.length; i++) {
                    html += generate_teacher_html(list[i]);
                    if (i < list.length - 1) html += "<hr class='sep' />";
                }

                $(".content").append(html);
            }
        }

        function generate_teacher_html(teacher) {
            var html = "";
            html += "<div class='element'>";
            html += "<div class='left'>";
            html += "<img src='" + teacher.avatar + "' />";
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='name overflow-hidden'>" + teacher.name + "</div>";
            html += "<div class='education overflow-hidden'>" + teacher.education + "</div>";
            html += "<div class='experience overflow-hidden'>";
            html += sg.common.sections_html(teacher.experience);
            html += "</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";

            return html;
        }
    },

    error: function (resp) {
        $(".content").append("<div class='error'>网络异常，请稍后再试</div>");
    }
};