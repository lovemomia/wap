$(function () {
    if (!sg.common.is_login()) {
        sg.common.redirect_login();
    } else {
        var oid = sg.common.param("oid", 0);
        sg.bookable.more(oid, 0);
    }
});

sg.bookable = {
    more: function (oid, start) {
        sg.common.get(sg.config.api + "/user/bookable", {
            utoken: sg.common.cookie.get("utoken"),
            oid: oid,
            start: start
        }, sg.bookable.success);
    },

    success: function (data) {
        var list = data.list;
        if (list.length > 0) {
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_package_html(list[i]);
                if (i < list.length - 1) html += "<hr class='sep' />";
            }
            html += "</div>";

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.bookable.more(sg.bookable.param_oid(), data.nextIndex);
            });
        }

        function generate_package_html(package) {
            var html = "";
            html += "<a href='/subject/courses?sid=" + package.subjectId + "&pid=" + package.packageId + "'>";
            html += "<div class='element scrollable'>";
            html += "<div class='left'>";
            html += "<img src='" + package.cover + "' />";
            html += "</div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + package.title + "</div>";
            html += "<div class='desc overflow-hidden'>" + package.expireTime + "</div>";
            html += "<div class='desc overflow-hidden'>还可约" + package.bookableCourseCount + "次课</div>";
            html += "</div>";
            html += "<div style='clear: both;'></div>";
            html += "</div>";
            html += "</a>";

            return html;
        }
    }
};