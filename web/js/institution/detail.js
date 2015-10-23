$(function () {
    var id = sg.common.param("id");
    sg.common.get(sg.config.api + "/course/institution", {
        id: id
    }, sg.course.detail.render_course_detail, sg.course.detail.render_course_detail_error);
});

sg.course = {}
sg.course.detail = {
    render_course_detail: function (resp) {
        if (resp.errno != 0) {
            $(".content").append("<div class='error'>" + resp.errmsg + "</div>");
        } else {
            data = resp.data;
            sg.course.detail.render_detail(data)
        }
    },

    render_detail: function (data) {
        var html = "";
        html += "<div class='institution-detail'>";
        html += "<img src='" + data.cover + "' />";
        html += "<div class='text bg-white'>";
        html += "<div class='name'>" + data.name + "</div>";
        html += "<div class='intro text-indent top-margin'>";
        var sections = data.intro.replace("\r", "").split("\n");
        for (var i = 0; i < sections.length; i++) {
            html += "<div>" + sections[i] + "</div>";
        }
        html += "</div>";
        html += "</div>";
        html += "</div>";

        $(".content").append(html);
    },

    render_course_detail_error: function () {
        $(".content").append("<div class='error'>网络异常，请稍后再试</div>");
    }
};