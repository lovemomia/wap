$(function () {
    var id = sg.common.param("id");
    sg.common.get(sg.config.api + "/course/institution", {
        id: id
    }, sg.institution.render_institution, sg.institution.render_institution_error);
});

sg.institution = {
    render_institution: function (resp) {
        if (resp.errno != 0) {
            $(".content").append("<div class='error'>" + resp.errmsg + "</div>");
        } else {
            data = resp.data;
            render_detail(data)
        }

        function render_detail(data) {
            var html = "";
            html += "<div class='detail'>";
            html += "<img src='" + data.cover + "' />";
            html += "<div class='text'>";
            html += "<div class='name'>" + data.name + "</div>";
            html += "<div class='intro text-indent top-margin'>";
            html += sg.common.sections_html(data.intro);
            html += "</div>";
            html += "</div>";
            html += "</div>";

            $(".content").append(html);
        }
    },

    render_institution_error: function () {
        $(".content").append("<div class='error'>网络异常，请稍后再试</div>");
    }
};