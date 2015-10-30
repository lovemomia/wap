$(function () {
    var id = sg.common.param("id");
    sg.teacher.more(id, 0);
});

sg.teacher = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/course/teacher", {
            id: id,
            start: start
        }, sg.teacher.success, sg.common.error);
    },

    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            var list = resp.data.list;
            if (list.length > 0) {
                unbind_scrollin();

                var html = "";
                var list = resp.data.list;
                for (var i = 0; i < list.length; i++) {
                    html += generate_teacher_html(list[i]);
                    if (i < list.length - 1) html += "<hr class='sep' />";
                }

                $(".content").append(html);

                if (resp.data.nextIndex != undefined) bind_scrollin(sg.common.param("id"), resp.data.nextIndex);
            }
        }

        function unbind_scrollin() {
            var last = $(".element:last");
            last.unbind("scrollin");
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

        function bind_scrollin(id, next_index) {
            var last = $(".element:last");
            last.bind("scrollin", function () {
                sg.teacher.more(id, next_index);
            });
        }
    }
};