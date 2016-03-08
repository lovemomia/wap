$(function () {
    sg.subjectlist.all(sg.config.city);
});

sg.subjectlist = {
    all: function (city) {
        sg.common.get(sg.config.api + "/subject/list", {
            city: city
        }, sg.subjectlist.success);
    },

    success: function (list) {
        if (list != undefined && list.length > 0) {
            var html = "";
            for (var i = 0; i < list.length; i++) {
                html += generate_subject_html(list[i]);
            }

            $(".content").append(html);

            function generate_subject_html(subject) {
                var html = "";
                if (sessionStorage.getItem("_src") != null) {
                    html += "<a href='" + sg.config.appname + "://subjectdetail?id=" + subject.id + "'>";
                } else {
                    html += "<a href='/subjectdetail?id=" + subject.id + "'>";
                }
                html += "<div class='subject bottom-border'>";
                html += "<div class='cover' style='background-image: url(" + subject.cover + ")'></div>";
                html += "<div class='desc'>";
                html += "<div class='title overflow-hidden'>" + subject.title + "</div>";
                html += "</div>";
                html += "</div>";
                html += "</a>";

                return html;
            }
        }
    }
};