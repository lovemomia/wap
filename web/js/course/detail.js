$(function () {
    var id = sg.common.param("id");
    sg.common.get(sg.config.api + "/course/detail", {
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
            sg.course.detail.render_abstracts(data.abstracts);
            sg.course.detail.render_details(data.detail)
        }
    },

    render_abstracts: function (abstracts) {
        var html = "";
        html += "<div class='text text-indent bg-white top-margin'>" + abstracts + "</div>";

        $(".content").append(html);
    },

    render_details: function (details) {
        for (var i = 0; i < details.length; i++) {
            $(".content").append(sg.course.detail.detail_html(details[i], i + 1));
        }
    },

    detail_html: function (detail, index) {
        var html = "";
        html += "<div class='course-detail text bg-white top-margin'>";
        html += "<div class='title'>";
        html += "<div class='number left'>" + index + "</div>";
        html += "<div class='left overflow-hidden'>" + detail.title + "</div>";
        html += "</div>";
        html += "<img src='" + detail.img + "' />";
        html += "<div class='desc'>" + detail.desc + "</div>";
        html += "</div>";

        $(".content").append(html);
    },

    render_course_detail_error: function () {
        $(".content").append("<div class='error'>网络异常，请稍后再试</div>");
    }
};