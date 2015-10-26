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

    post: function (url, params, success_callback, error_callback) {
        $.ajax({
            url: url,
            data: params,
            type: "post",
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

    cookie: {
        get: function (key) {
            var arr = new RegExp('\w?' + key + '=(.*?)(;|$)', 'i').exec(document.cookie);
            return arr ? decodeURIComponent(arr[1]) : '';
        },

        set: function (key, val, days) {
            var reg = key + '=' + encodeURIComponent(val);
            if (days) {
                var exp = new Date();
                exp.setTime(exp.getTime() + days * 24 * 60 * 60 * 1000);
                reg += "; expires=" + exp.toGMTString();
            }
            reg += '; path=/';
            document.cookie = reg;
        },

        del: function (key) {
            tq.t.cookie.set(key, '', -10);
        }
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
            html += "<div class='left left-margin'>" + sections[i] + "</div>";
            html += "<div style='clear:both'></div>";
        }

        return html;
    },

    invalid_mobile: function (mobile) {
        return !(/^1\d{10}$/.test(mobile));
    }
};