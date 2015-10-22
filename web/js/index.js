$(function() {
    sg.common.get(sg.config.api + "/index", {
        city: 1,
        start: 0,
    }, render_index, render_index_error);
});

function render_index(resp) {
    if (resp.errno != 0) {
        render_index_error(resp);
    } else {
        data = resp.data;
        render_banners(data.banners);
        render_icons(data.icons);
        render_events(data.events);
        render_subjects(data.subjects);
    }
}

function render_index_error(resp) {
    $(".content").append("网络异常，请稍后再试");
}

function render_banners(banners) {
    if (banners == undefined) return;
    // TODO
}

function render_icons(icons) {
    var line = Math.ceil(icons.length / 4);
    var html = "";
    html += "<div class='icons'>";
    for (var i = 0; i < line; i++) {
        html += "<div class='icons-line'>";
        for (var j = 0; j < 4; j++) {
            var icon = icons[j + i * 4];
            html += "<a class='icon' href='" + icon.action + "'>";
            html += "<img src='" + icon.img + "' />";
            html += "<div class='title'>" + icon.title + "</div>";
            html += "</a>"
        }
        html += "<div style='clear:both'></div>";
        html += "</div>"
    }
    html += "</div>";

    $(".content").append(html);
}

function render_events(events) {
    var line = Math.ceil(events.length / 2);
    var html = "";
    html += "<div class='events'>";
    for (var i = 0; i < line; i++) {
        html += "<div class='events-line'>";

        var event = events[i * 2];
        html += "<a class='event left' href='" + event.action + "'>";
        html += event_html(event, i * 2 + 1);
        html += "</a>";

        if (i * 2 + 1 < events.length) {
            event = events[i * 2 + 1];
            html += "<a class='event right left-boder' href='" + event.action + "'>";
            html += event_html(event, i * 2 + 2);
            html += "</a>";
        }

        html += "<div style='clear:both'></div>";
        html += "</div>"
    }
    html += "</div>";

    $(".content").append(html);
}

function event_html(event, index) {
    var html = "";
    html += "<div class='left'>";
    html += "<div class='title color" + index + "'>" + event.title + "</div>";
    html += "<div class='desc'>" + event.desc + "</div>";
    html += "</div>";
    html += "<div class='right'>";
    html += "<img src='" + event.img + "' />";
    html += "</div>";

    return html;
}

function render_subjects(subjects) {
    if (subjects == undefined) return;
    if (subjects.totalCount <= 0) return;

    var html = "";
    html += "<div class='free'>";
    html += "<div class='title'><hr class='left' />课程试听<hr class='right' /></div>";

    var list = subjects.list;
    for (var i = 0; i < list.length; i++){
        html += subject_html(list[i]);
    }

    html += "</div>";

    if (subjects.nextIndex != undefined) {
        html += "<div class='more'>查看更多</div>"
    }

    $(".content").append(html);
}

function subject_html(subject) {
    var html = "";
    html += "<div class='subject'>";
    html += "<a href='/subjectdetail?id=" + subject.id + "'>";
    html += "<div class='cover'>";
    html += "<img src='" + subject.cover + "' />";
    html += "</div>";
    html += "<div class='desc'>";
    html += "<div class='title'>" + subject.title + "</div>";
    var intro = subject.age + " | " + subject.scheduler + " | " + subject.region;
    if (intro.length == 6) intro = "";
    html += "<div class='intro'>" + intro + "</div>";
    html += "<div class='tags'>" + subject.tags + "</div>";
    html += "<div class='price'><i>￥</i><i class='number'>" + subject.price + "</i><i>起</i></div>"
    html += "</div>";
    html += "</a>";
    html += "</div>";

    return html;
}