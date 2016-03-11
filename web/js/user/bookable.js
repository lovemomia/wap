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
        var totalCount = data.totalCount;
        if (totalCount > 0) {
            var list = data.list;
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list bottom-border'>";
            for (var i = 0; i < list.length; i++) {
                html += generate_package_html(list[i]);
                if (i < list.length - 1) html += "<hr class='left-margin' />";
            }
            html += "</div>";

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.bookable.more(sg.bookable.param("oid"), data.nextIndex);
            });
        } else {
            var html = "";
            html += "<div class='logo'><img src='/img/logo3x.png'></div>";
            html += "<div class='tips'>";
            html += "<p>您还没购买任何课程包，快去看看吧~</p>";
            html += "</div>";

            $(".content").html(html);
        }

        function generate_package_html(package) {
            var html = "";
            if (package.courseId > 0) {
                html += "<a href='/course/skuplace?id=" + package.courseId + "&pid=" + package.packageId + "'>";
            } else {
                html += "<a href='/subject/courses?sid=" + package.subjectId + "&pid=" + package.packageId + "'>";
            }
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