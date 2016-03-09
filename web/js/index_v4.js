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
            sg.common.get(sg.config.api + "/v3/index", {
                city: city,
                start: start,
                utoken: sg.common.cookie.get("utoken")
            }, sg.index.success_init);
        } else {
            sg.common.get(sg.config.api + "/v3/index", {
                city: city,
                start: start,
                utoken: sg.common.cookie.get("utoken")
            }, sg.index.success_more);
        }
    },

    success_init: function (data) {
        generate_banners_html(data.banners);
        generate_events_html(data.events);
        generate_subjects_html(data.subjectCourseType, data.subjects);
        generate_topic_html(data.topics);

        if (data.courses.totalCount > 0) {
            var html = "";
            html += "<div class='free top-margin'>";
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

        function generate_events_html(events) {
            if (events == undefined || events.length == 0) return;

            var line = Math.ceil(events.length / 2);
            var html = "";
            html += "<div class='events'>";
            html += "<div class='head title'><span class='wave'>~</span>新用户专享<span class='wave'>~</span></div>";
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
                html += "<div class='title overflow-hidden'>" + event.title + "</div>";
                html += "<div class='desc'><span class='overflow-hidden color" + index + "'>" + event.desc + "</span></div>";
                html += "</div>";
                html += "<div class='right'>";
                html += "<img src='" + event.img + "' />";
                html += "</div>";

                return html;
            }
        }

        function generate_subjects_html(subjectCourseType, subjects) {
            if (subjects == undefined || subjects.length == 0) return;

            var html = "";
            html += "<div class='subjects'>";
            for (var i = 0; i < subjects.length; i++) {
                var subject = subjects[i];
                html += "<a href='/subjectdetail?id=" + subject.id + "'>";
                html += "<div class='subject top-margin' style='background-image: url(\"" + subject.cover + "\")'>";
                html += "</div>";
                html += "</a>";

                var courses = subject.courses;
                if (courses == undefined || courses.length < 2) continue;

                html += "<div class='courses bg-white v-border top-margin'>";
                html += "<div class='head title'><span class='wave'>~</span>";
                if (subjectCourseType == 1) html += "本周热门课程";
                else html += "本周新开课程";
                html += "<span class='wave'>~</span></div>";
                if (courses.length == 2) html += "<div class='courses c2'>";
                else html += "<div class='c3'>";
                for (var j = 0; j < Math.min(courses.length, 3); j++) {
                    var course = courses[j];
                    html += "<a href='/course?id=" + course.id + "'>";
                    html += "<div class='course left'>";
                    html += "<div class='cover' style='background-image: url(\"" + course.cover + "\");'></div>";
                    html += "<div class='key-word'>" + course.keyWord + "</div>";
                    html += "<div class='age'>" + course.age + "</div>";
                    html += "<div class='joined'>" + course.joined + "人参加</div>";
                    html += "</div>";
                    html += "</a>";
                }
                html += "<div style='clear: both;'></div>";

                html += "</div>";
                html += "</div>";
            }
            html += "</div>";

            $(".content").append(html);
        }

        function generate_topic_html(topics) {
            if (topics == undefined || topics.length == 0) return;

            var topic = topics[0];
            var html = "";
            html += "<a id='topic' href='javascript:void(0)'>";
            html += "<div class='topic v-border top-margin bg-white'>";
            html += "<img src='/img/topic.png' />";
            html += "<div class='title'>" + topic.title + "</div>";
            html += "<div><hr class='left'/><div class='left sub-title overflow-hidden'>" + topic.subTitle + "</div><hr class='right' /><div style='clear: both' /></div>";
            html += "<img class='topic-icon' src='/img/topic-icon.png' />";
            html += "<div class='joined'><span>" + topic.joined + "人在讨论</span></div>";
            html += "<div class='arrow right'><img src='/img/allow3x.png'/></div>";
            html += "</div>";
            html += "</a>";

            $(".content").append(html);

            $("#topic").on('click', function () {
                if (confirm("该功能目前只能在APP上使用，快去下载APP吧~")) {
                    window.location.href = "http://a.app.qq.com/o/simple.jsp?pkgname=com.youxing.duola";
                }
            });
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
                html += "<a href='/course/buyable?id=" + course.id + "'>";
                html += "<div class='subject scrollable bottom-border'>";
                html += "<div class='cover' style='background-image: url(" + course.cover + ")'>";
                if (course.status == 2) {
                    html += "<img class='sold-out' src='/img/full.png'>";
                }
                html += "</div>";
                html += "<div class='desc'>";
                html += "<div class='left'>";
                html += "<div class='title overflow-hidden'>" + course.title + "</div>";
                var intro = "<span class='tags'>" + course.subject + "</span> " + course.scheduler + " | " + course.region;
                if (intro.length == 6) intro = "";
                html += "<div class='intro overflow-hidden'>" + intro + "</div>";
                html += "</div>";
                html += "<div class='price right'><span class='number'>" + course.price + "</span>元</div>"
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