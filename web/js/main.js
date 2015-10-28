String.prototype.startWith = function (str) {
    if (str == null || str == "" || this.length == 0 || str.length > this.length) return false;
    if (this.substr(0, str.length).toLowerCase() == str.toLowerCase()) return true;
    else return false;
};

$(function () {
    sg.common.init();
    $(".back").on("click", function () {
        sg.common.back();
    });
});

sg.common = {
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
            sg.common.cookie.set(key, '', -10);
        }
    },

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

    url_path: function (url) {
        var splits = url.split("//");

        var start = splits[1].indexOf("/");
        var path = splits[1].substring(start);

        if (path.indexOf("?") != -1) {
            path = path.split("?")[0];
        }

        return path;
    },

    init: function () {
        var url_back = sessionStorage.getItem("url_back");
        if (url_back == null) {
            var url_history_str = sessionStorage.getItem("url_history");
            if (url_history_str == null) url_history_str = JSON.stringify(new Array());
            var url_history = JSON.parse(url_history_str);

            var referrer_url = document.referrer;
            if (referrer_url != undefined && referrer_url != "") {
                var referrer_path = sg.common.url_path(referrer_url);
                if (!referrer_path.startWith("/auth/")) {
                    if (url_history.length == 0 || url_history[url_history.length - 1] != referrer_url) {
                        url_history.push(referrer_url);
                        sessionStorage.setItem("url_history", JSON.stringify(url_history));
                    }
                }
            }
        } else {
            sessionStorage.removeItem("url_back");
        }
    },

    back: function () {
        sessionStorage.setItem("url_back", "back");

        var url_history_str = sessionStorage.getItem("url_history");
        if (url_history_str != null) {
            var url_history = JSON.parse(url_history_str);
            if (url_history.length > 0) {
                var url = url_history.pop();
                sessionStorage.setItem("url_history", JSON.stringify(url_history));
                window.location.href = url;
            } else {
                window.location.href = "/index";
            }
        } else {
            window.location.href = "/index";
        }
    },

    check_login: function () {
        var utoken = sg.common.cookie.get("utoken");
        if (utoken == '') {
            window.location.href = "/auth/login";
        }
    },

    remove_histories: function () {
        sessionStorage.removeItem("url_back");
        sessionStorage.removeItem("url_history");
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