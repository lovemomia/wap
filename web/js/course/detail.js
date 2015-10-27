$(function () {
    var id = sg.common.param("id");
    sg.common.get(sg.config.api + "/course/detail", {
        id: id
    }, sg.course.detail.render_course_detail, sg.course.detail.error);
});

sg.course = {};
sg.course.detail = {
    render_course_detail: function (resp) {
        if (resp.errno != 0) {
            $(".content").append("<div class='error'>" + resp.errmsg + "</div>");
        } else {
            $(".content").append("<div class='detail'>" + resp.data.detail + "</div>");
        }
    },

    error: function () {
        $(".content").append("<div class='error'>网络异常，请稍后再试</div>");
    }
};