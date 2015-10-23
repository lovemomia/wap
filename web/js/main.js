sg.common = {
    param: function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    },

    get: function (url, params, success_callback, error_callback) {
        $.ajax({
            url: url,
            data: params,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success: function (resp) {
                success_callback(resp);
            },
            error: function (resp) {
                error_callback(resp);
            }
        });
    },

    scroll_img: function () {
        var slider = Swipe(document.getElementById('scroll_img'), {
            auto: 3000,
            continuous: true,
            callback: function (pos) {
                var i = bullets.length;
                while (i--) {
                    bullets[i].className = ' ';
                }
                bullets[pos].className = 'on';
            }
        });
        var bullets = document.getElementById('scroll_position').getElementsByTagName('li');
    },

    sections_html: function (content) {
        var html = "";
        var sections = content.replace("\r", "").split("\n");
        for (var i = 0; i < sections.length; i++) {
            html += "<div>" + sections[i] + "</div>";
        }

        return html;
    },

    list_html: function (content) {
        var html = "";
        var sections = content.replace("\r", "").split("\n");
        for (var i = 0; i < sections.length; i++) {
            html += "<div class='left list-dot'>-</div>";
            html += "<div class='left list-content'>" + sections[i] + "</div>";
            html += "<div style='clear:both'></div>";
        }

        return html;
    }
};