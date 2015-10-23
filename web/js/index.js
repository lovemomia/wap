$(function () {
    sg.common.get(sg.config.api + "/index", {
        city: 1,
        start: 0
    }, sg.index.render_index, sg.index.render_index_error);
});

sg.index = {
    render_index: function (resp) {
        if (resp.errno != 0) {
            $(".content").append("<div class='error'>" + resp.errmsg + "</div>");
        } else {
            data = resp.data;
            sg.index.render_banners(data.banners);
            sg.index.render_icons(data.icons);
            sg.index.render_events(data.events);
            sg.index.render_subjects(data.subjects);
        }
    },

    render_banners: function (banners) {
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

        if (banners.length >= 1) sg.common.scroll_img();
    },

    render_icons: function (icons) {
        if (icons == undefined || icons.length == 0) return;

        var line = Math.ceil(icons.length / 4);
        var html = "";
        html += "<div class='icons'>";
        for (var i = 0; i < line; i++) {
            html += "<div class='icons-line'>";
            for (var j = 0; j < 4; j++) {
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
    },

    render_events: function (events) {
        if (events == undefined || events.length == 0) return;

        var line = Math.ceil(events.length / 2);
        var html = "";
        html += "<div class='events'>";
        for (var i = 0; i < line; i++) {
            html += "<div class='events-line'>";

            var event = events[i * 2];
            html += "<a class='event left' href='" + event.action + "'>";
            html += sg.index.event_html(event, i * 2 + 1);
            html += "</a>";

            if (i * 2 + 1 < events.length) {
                event = events[i * 2 + 1];
                html += "<a class='event right left-border' href='" + event.action + "'>";
                html += sg.index.event_html(event, i * 2 + 2);
                html += "</a>";
            }

            html += "<div style='clear:both'></div>";
            html += "</div>"
        }
        html += "</div>";

        $(".content").append(html);
    },

    event_html: function (event, index) {
        var html = "";
        html += "<div class='left'>";
        html += "<div class='title overflow-hidden color" + index + "'>" + event.title + "</div>";
        html += "<div class='desc overflow-hidden'>" + event.desc + "</div>";
        html += "</div>";
        html += "<div class='right'>";
        html += "<img src='" + event.img + "' />";
        html += "</div>";

        return html;
    },

    render_subjects: function (subjects) {
        if (subjects == undefined || subjects.totalCount <= 0) return;

        var html = "";
        html += "<div class='free'>";
        html += "<div class='title'><hr class='left' />课程试听<hr class='right' /></div>";

        var list = subjects.list;
        for (var i = 0; i < list.length; i++) {
            html += sg.index.subject_html(list[i]);
        }

        html += "</div>";

        if (subjects.nextIndex != undefined) {
            html += "<div class='more'>查看更多</div>"
        }

        $(".content").append(html);
    },

    subject_html: function (subject) {
        var html = "";
        html += "<div class='subject'>";
        html += "<a href='/subjectdetail?id=" + subject.id + "'>";
        html += "<div class='cover'>";
        html += "<img src='" + subject.cover + "' />";
        html += "</div>";
        html += "<div class='desc'>";
        html += "<div class='title overflow-hidden'>" + subject.title + "</div>";
        var intro = subject.age + " | " + subject.scheduler + " | " + subject.region;
        if (intro.length == 6) intro = "";
        html += "<div class='intro overflow-hidden'>" + intro + "</div>";
        html += "<div class='tags overflow-hidden'>" + subject.tags + "</div>";
        html += "<div class='price'><i>￥</i><i class='number'>" + subject.price + "</i><i>起</i></div>"
        html += "</div>";
        html += "</a>";
        html += "</div>";

        return html;
    },

    render_index_error: function (resp) {
        $(".content").append("网络异常，请稍后再试");
    }
};