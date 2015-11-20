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

    get_sync: function (url, params, success_callback, error_callback) {
        $.ajax({
            url: url,
            async: false,
            data: params,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success: function (resp) {
                if (resp.errno != 0) error_callback();
                sg.common.success(resp, success_callback);
            },
            error: function () {
                error_callback();
            }
        });
    },

    get: function (url, params, success_callback) {
        $.ajax({
            url: url,
            data: params,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success: function (resp) {
                sg.common.success(resp, success_callback);
            },
            error: function () {
                sg.common.error();
            }
        });
    },

    success: function (resp, success_callback) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
            if (resp.errno == 100001) {
                sg.common.cookie.del("utoken");
                window.location.href = "/auth/login";
            }
        } else {
            success_callback(resp.data);
        }
    },

    error: function () {
        alert("网络异常，请稍后再试");
    },

    post: function (url, params, success_callback) {
        $.ajax({
            url: url,
            data: params,
            type: "post",
            dataType: "json",
            timeout: 5000,
            success: function (resp) {
                sg.common.success(resp, success_callback);
            },
            error: function () {
                sg.common.error();
            }
        });
    },

    param: function (name, defaultValue) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return defaultValue == undefined ? null : defaultValue;
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

    url_no_query: function (url) {
        var index = url.indexOf("?");
        if (index == -1) return url;
        return url.substring(0, index);
    },

    init: function () {
        var current_url = window.location.href;
        var path = sg.common.url_path(current_url);
        if (!path.startWith("/auth/")) sessionStorage.removeItem("authRef");
        if (!path.startWith("/payment/pay") && !path.startWith("/payment/coupon")) sg.common.clean_coupon();

        var param_ref = sg.common.param("ref");
        var param_back = sg.common.param("back");
        var referrer_url = document.referrer;
        var url_back = sessionStorage.getItem("url_back");
        if (url_back == null) {
            if (!path.startWith("/auth/") || param_ref == null) sg.common.push_history(current_url, referrer_url);
            else if (param_back != null && param_back != "null") sg.common.push_history(current_url, param_back);
        } else {
            sessionStorage.removeItem("url_back");
        }

        var invite = sg.common.param("invite");
        if (invite != null) sessionStorage.setItem("invite", invite);

        var src = sg.common.param("_src");
        if (src != null) sessionStorage.setItem("_src", src);
        if (sessionStorage.getItem("_src") != null) {
            $(".header").remove();
            $(".content").removeClass("has-fix-header");
        }
    },

    clean_coupon: function () {
        sessionStorage.removeItem("couponId");
        sessionStorage.removeItem("discount")
    },

    push_history: function (current_url, referrer_url) {
        var url_history_str = sessionStorage.getItem("url_history");
        if (url_history_str == null) url_history_str = JSON.stringify(new Array());
        var url_history = JSON.parse(url_history_str);

        if (referrer_url != undefined && referrer_url != null  && referrer_url != "") {
            var referrer_path = sg.common.url_path(referrer_url);
            var current_path = sg.common.url_path(current_url);
            if (!referrer_path.startWith("/auth/") && (!referrer_path.startWith("/payment/pay") || current_path.startWith("/payment/coupon")) && sg.common.url_no_query(current_url) != sg.common.url_no_query(referrer_url)) {
                if (url_history.length == 0 || sg.common.url_no_query(url_history[url_history.length - 1]) != sg.common.url_no_query(referrer_url)) {
                    url_history.push(referrer_url);
                    sessionStorage.setItem("url_history", JSON.stringify(url_history));
                }
            }
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

    remove_histories: function () {
        sessionStorage.removeItem("url_back");
        sessionStorage.removeItem("url_history");
    },

    bind_scrollin: function (callback) {
        var last = $(".scrollable:last");
        last.bind("scrollin", function () {
            callback();
        });
    },

    unbind_scrollin: function () {
        var last = $(".scrollable:last");
        last.unbind("scrollin");
    },

    sections_html: function (content) {
        var html = "";
        var sections = content.replace("\r", "").split("\n");
        for (var i = 0; i < sections.length; i++) {
            html += "<div>" + sections[i] + "</div>";
        }

        return html;
    },

    is_login: function () {
        var utoken = sg.common.cookie.get("utoken");
        return utoken != '';
    },

    redirect_login: function () {
        var current_url = window.location.href;
        window.location.href = "/auth/login?ref=" + encodeURIComponent(current_url);
    },

    is_invalid_mobile: function (mobile) {
        return !(/^1\d{10}$/.test(mobile));
    },

    is_weixin: function () {
        return navigator.userAgent.toLowerCase().indexOf('micromessenger') != -1;
    }
};