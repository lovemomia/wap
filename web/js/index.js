$(function () {
    sg.common.remove_histories();
    sg.index.init();

    $("#my").on("click", function () {
        window.location.href = "/my";
    });
});

sg.index = {
    init: function () {
        sg.index.read_data(1, 0); // TODO city
    },

    read_data: function (city, start) {
        if (start == 0) {
            sg.common.get(sg.config.api + "/v2/index", {
                city: city,
                start: start
            }, sg.index.success_init);
        } else {
            sg.common.get(sg.config.api + "/v2/index", {
                city: city,
                start: start
            }, sg.index.success_more);
        }
    },

    success_init: function (data) {
        generate_banners_html(data.banners);
        generate_icons_html(data.icons);
        generate_events_html(data.events);

        if (data.courses.totalCount > 0) {
            var html = "";
            html += "<div class='free'>";
            html += "<div class='title'><hr class='left' />热门推荐<hr class='right' /></div>";
            html += "</div>";

            $(".content").append(html);
        }

        sg.index.success_more(data);

        function generate_banners_html(banners) {
            if (banners == undefined || banners.length == 0) return;

            var html = "";
            html += "<div class='banner'>";
            if (banners.length == 1) {
                html += "<a href='" + banners[0].action + "'><img src='" + banners[0].cover + "' /></a>";
            } else {
                html += "<div id='scroll_img' class='scroll_box'>";
                html += "<ul id='scroll_wrap' class='scroll_wrap'>";
                for (var i = 0; i < banners.length; i++) {
                    html += "<li><a href='" + banners[i].action + "'><img src='" + banners[i].cover + "' /></a></li>";
                }
                html += "</ul>";

                html += "<ul id='scroll_position' class='scroll_position'>";
                for (var i = 0; i < banners.length; i++) {
                    if (i == 0) html += "<li class='on'><a href='javascript:void(0);'></a></li>";
                    else html += "<li><a href='javascript:void(0);'></a></li>";
                }
                html += "</ul>";
                html += "</div>";
            }
            html += "</div>";

            $(".content").append(html);

            if (banners.length > 1) sg.scroll.scroll_img();
        }

        function generate_icons_html(icons) {
            if (icons == undefined || icons.length == 0) return;

            var line = Math.ceil(icons.length / 4);
            var html = "";
            html += "<div class='icons'>";
            for (var i = 0; i < line; i++) {
                html += "<div class='icons-line'>";
                for (var j = 0; j < 4; j++) {
                    if (j + i * 4 >= icons.length) break;
                    var icon = icons[j + i * 4];
                    html += "<a class='icon' href='" + icon.action + "'>";
                    html += "<img src='" + icon.img + "' />";
                    html += "<div class='title overflow-hidden'>" + icon.title + "</div>";
                    html += "</a>"
                }
                html += "<div style='clear:both'></div>";
                html += "</div>"
            }
            html += "</div>";

            $(".content").append(html);
        }

        function generate_events_html(events) {
            if (events == undefined || events.length == 0) return;

            var line = Math.ceil(events.length / 2);
            var html = "";
            html += "<div class='events'>";
            for (var i = 0; i < line; i++) {
                html += "<div class='events-line'>";

                var event = events[i * 2];
                html += "<a class='event left' href='" + event.action + "'>";
                html += generate_event_html(event, i * 2 + 1);
                html += "</a>";

                if (i * 2 + 1 < events.length) {
                    event = events[i * 2 + 1];
                    html += "<a class='event right left-border' href='" + event.action + "'>";
                    html += generate_event_html(event, i * 2 + 2);
                    html += "</a>";
                }

                html += "<div style='clear:both'></div>";
                html += "</div>"
            }
            html += "</div>";

            $(".content").append(html);

            function generate_event_html(event, index) {
                var html = "";
                html += "<div class='left'>";
                html += "<div class='title overflow-hidden color" + index + "'>" + event.title + "</div>";
                html += "<div class='desc overflow-hidden'>" + event.desc + "</div>";
                html += "</div>";
                html += "<div class='right'>";
                html += "<img src='" + event.img + "' />";
                html += "</div>";

                return html;
            }
        }
    },

    success_more: function (data) {
        sg.common.unbind_scrollin();
        generate_courses_html(data.courses);
        if (data.courses.nextIndex != undefined) sg.common.bind_scrollin(function () {
            sg.index.read_data(1, data.courses.nextIndex);
        });

        function generate_courses_html(courses) {
            if (courses == undefined || courses.list.length <= 0) return;

            var html = "";
            var list = courses.list;
            for (var i = 0; i < list.length; i++) {
                html += generate_course_html(list[i]);
            }

            html += "</div>";

            $(".free").append(html);

            function generate_course_html(course) {
                var html = "";
                html += "<a href='/course?id=" + course.id + "'>";
                html += "<div class='subject scrollable'>";
                html += "<div class='cover' style='background-image: url(" + course.cover + ")'>";
                html += "</div>";
                html += "<div class='desc'>";
                html += "<div class='title overflow-hidden'>" + course.title + "</div>";
                var intro = course.age + " | " + course.scheduler + " | " + course.region;
                if (intro.length == 6) intro = "";
                html += "<div class='intro overflow-hidden'>" + intro + "</div>";
                html += "<div class='tags overflow-hidden'>" + course.subject + "</div>";
                html += "<div class='price'>￥<span class='number'>" + course.price + "</span>/次</div>"
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
};