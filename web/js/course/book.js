$(function () {
    var id = sg.common.param("id");
    sg.book.more(id, 0);
});

sg.book = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/course/book", {
            id: id,
            start: start
        }, sg.book.success, sg.book.error);
    },

    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            var list = resp.data.list;
            if (list.length > 0) {
                unbind_scrollin();

                var html = "";
                html += "<div class='list'>";
                for (var i = 0; i < list.length; i++) {
                    html += "<div class='img top-margin'><img src='" + list[i] + "' /></div>";
                    //html += "<div class='img top-margin'></div>";
                }
                html += "</div>";

                $(".content").append(html);

                if (resp.data.nextIndex != undefined) bind_scrollin(sg.common.param("id"), resp.data.nextIndex);
            }
        }

        function unbind_scrollin() {
            var last = $(".img:last");
            last.unbind("scrollin");
        }

        function bind_scrollin(id, next_index) {
            var last = $(".img:last");
            last.bind("scrollin", function () {
                sg.book.more(id, next_index);
            });
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    }
};