$(function () {
    var id = sg.common.param("id");
    sg.common.get(sg.config.api + "/subject", {
        id: id
    }, sg.subject.render_subject, sg.subject.render_subject_error);
});

sg.subject = {
    render_subject: function (resp) {
        if (resp.errno != 0) {
            $(".content").append("<div class='error'>" + resp.errmsg + "</div>");
        } else {
            data = resp.data;
            render_title(data.subject.title);
            render_imgs(data.subject.imgs);
            render_price(data.subject.price);
            render_age_and_join(data.subject.age, data.subject.joined);
            render_intro(data.subject.intro);
            render_courses(data.courses);
            render_notice(data.subject.notice);
        }

        function render_title(title) {
            $("title").append(title);
            $(".header").append(title);
        }

        function render_imgs(imgs) {
            if (imgs == undefined || imgs.length == 0) return;

            var html = "";
            html += "<div class='subject img'>";
            if (imgs.length == 1) {
                html += "<img src='" + imgs[0] + "' />";
            } else {
                html += "<div id='scroll_img' class='scroll_box'>";
                html += "<ul id='scroll_wrap' class='scroll_wrap'>";
                for (var i = 0; i < imgs.length; i++) {
                    html += "<li><img src='" + imgs[i] + "' /></li>";
                }
                html += "</ul>";

                html += "<ul id='scroll_position' class='scroll_position'>";
                for (var i = 0; i < imgs.length; i++) {
                    if (i == 0) html += "<li class='on'><a href='javascript:void(0);'></a></li>";
                    else html += "<li><a href='javascript:void(0);'></a></li>";
                }
                html += "</ul>";
                html += "</div>";
            }
            html += "</div>";

            $(".content").append(html);

            if (imgs.length >= 1) sg.common.scroll_img();
        }

        function render_price(price) {
            var html = "";
            html += "<div class='subject text no-border'>";
            html += "<div class='left price'>课程包<span class='left-margin'>¥</span><span class='number'>" + price + "</span><span>起</span></div>";
            html += "<div class='right button'><button id='btn_buy' class='btn-orange'>立即抢购</button></div>";
            html += "<div style='clear:both'></div>";
            html += "</div>";
            html += "<div class='bg-white'><hr class='sep'/></div>";

            $(".content").append(html);

            $("#btn_buy").on("click", function () {
                alert("ok");
                window.location.href = "/auth/login.html";
            });
        }

        function render_age_and_join(age, joined) {
            var html = "";
            html += "<div class='subject text no-top-border'>";
            html += "<div class='left tag img'><img src='/img/tag3x.png' /></div>";
            html += "<div class='left tag desc'>适合" + age + "</div>";
            html += "<div class='left tag img'><img src='/img/tag3x.png' /></div>";
            html += "<div class='left tag desc'>" + joined + "人已参加</div>";
            html += "<div style='clear:both'></div>";
            html += "</div>";

            $(".content").append(html);
        }

        function render_intro(intro) {
            var html = "";
            html += "<div class='subject text no-bottom-border top-margin'><div class='title'>课程目标</div></div>";
            html += "<div class='bg-white'><hr class='sep'/></div>";
            html += "<div class='subject text no-top-border'>";
            html += sg.common.sections_html(intro);
            html += "</div>";


            $(".content").append(html);
        }

        function render_courses(courses) {
            var html = "";
            html += "<div class='subject text no-bottom-border top-margin'>";
            html += "<a href='/subject/courses?id=" + sg.common.param("id") + "'>";
            html += "<div class='title left'>可选课程（" + courses.totalCount + "）</div>";
            html += "<div class='arrow right'><img src='/img/allow3x.png' /></div>";
            html += "<div class='arrow right'>更多</div>";
            html += "<div style='clear:both'></div>";
            html += "</a>";
            html += "</div>";
            html += "<div class='bg-white'><hr class='sep'/></div>";
            html += "<div class='subject text no-top-border'>";
            var list = courses.list;
            for (var i = 0; i < list.length; i++) {
                html += course_html(list[i]);
            }
            html += "</div>";

            $(".content").append(html);
        }

        function course_html(course) {
            var html = "";
            html += "<div class='course-list'>";
            html += "<a href='/course?id=" + course.id + "'>";
            html += "<div class='left'><img src='" + course.cover + "'></div>";
            html += "<div class='right'>";
            html += "<div class='title overflow-hidden'>" + course.title + "</div>";
            var intro = course.age + " | " + course.scheduler;
            if (intro.length == 6) intro = "";
            html += "<div class='intro overflow-hidden'>" + intro + "</div>";
            html += "<div class='region overflow-hidden'>" + course.region + "</div>";
            html += "<div class='price'><span>￥</span><span class='number'>" + course.price + "</span><span>起</span></div>"
            html += "</div>";
            html += "<div style='clear:both'></div>";
            html += "</a>";
            html += "</div>";

            return html;
        }

        function render_notice(notice) {
            var html = "";
            html += "<div class='subject text no-bottom-border top-margin'><div class='title'>购买须知</div></div>";
            html += "<div class='bg-white'><hr class='sep'/></div>";
            html += "<div class='subject text no-top-border'>";
            for (var i = 0; i < notice.length; i++) {
                html += "<div class='notice title'>" + notice[i].title + "</div>";
                html += "<div>" + sg.common.list_html(notice[i].content) + "</div>";
            }
            html += "</div>";

            $(".content").append(html);
        }
    },

    render_subject_error: function () {
        $(".content").append("<div class='error'>网络异常，请稍后再试</div>");
    }
};