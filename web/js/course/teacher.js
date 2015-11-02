$(function () {
    var id = sg.common.param("id");
    sg.teacher.more(id, 0);
});

sg.teacher = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/course/teacher", {
            id: id,
            start: start
        }, sg.teacher.success);
    },

    success: function (data) {
        var list = data.list;
        if (list.length > 0) {
            sg.common.unbind_scrollin();

            var html = "";
            for (var i = 0; i < list.length; i++) {
                html += generate_teacher_html(list[i]);
                if (i < list.length - 1) html += "<hr class='sep' />";
            }

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.teacher.more(sg.common.param("id"), data.nextIndex);
            });
        }

        function generate_teacher_html(teacher) {
            var html = "";
            html += "<div class='element scrollable'>";
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
    }
};