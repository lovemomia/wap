$(function () {
    sg.trial.more(sg.config.city, 0);
});

sg.trial = {
    more: function (city, start) {
        sg.common.get(sg.config.api + "/v2/subject/trial", {
            city: city,
            start: start
        }, sg.trial.success);
    },

    success: function (data) {
        var list = data.list;
        if (list.length > 0) {
            sg.common.unbind_scrollin();
            generate_trial_html(list);
            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.trial.more(sg.config.city, data.nextIndex);
            });

            function generate_trial_html(list) {
                if (list == undefined || list.length <= 0) return;

                var html = "";
                for (var i = 0; i < list.length; i++) {
                    html += generate_course_html(list[i]);
                }

                html += "</div>";

                $(".content").append(html);

                function generate_course_html(course) {
                    var html = "";
                    if (sessionStorage.getItem("_src") != null) {
                        html += "<a href='" + sg.config.appname + "://coursedetail?id=" + course.id + "'>";
                    } else {
                        html += "<a href='/course/trial?id=" + course.id + "'>";
                    }
                    html += "<div class='course scrollable'>";
                    html += "<div class='cover' style='background-image: url(" + course.cover + ")'>";
                    if (course.status == 2) {
                        html += "<img class='sold-out' src='/img/full.png'>";
                    }
                    html += "</div>";
                    html += "<div class='desc'>";
                    html += "<div class='title overflow-hidden'>" + course.title + "</div>";
                    var intro = course.subject + " | " + course.age + " | " + course.region;
                    if (intro.length == 6) intro = "";
                    html += "<div class='intro overflow-hidden'>" + intro + "</div>";
                    html += "<div class='price'>￥<span class='number'>" + course.price + "</span></div>";
                    html += "<div class='origin-price'>￥" + course.originalPrice + "</div>";
                    html += "</div>";
                    if (course.joined > 0) {
                        html += "<div class='joined'>" + course.joined + "人参加</div>";
                    }
                    html += "</div>";
                    html += "</a>";

                    return html;
                }
            }
        }
    }
};