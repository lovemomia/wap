$(function () {
    var id = sg.common.param("id");
    sg.book.more(id, 0);
});

sg.book = {
    more: function (id, start) {
        sg.common.get(sg.config.api + "/course/book", {
            id: id,
            start: start
        }, sg.book.success);
    },

    success: function (data) {
        var list = data.list;
        if (list.length > 0) {
            sg.common.unbind_scrollin();

            var html = "";
            html += "<div class='list'>";
            for (var i = 0; i < list.length; i++) {
                html += "<div class='scrollable top-margin'><img src='" + list[i] + "' /></div>";
            }
            html += "</div>";

            $(".content").append(html);

            if (data.nextIndex != undefined) sg.common.bind_scrollin(function () {
                sg.book.more(sg.common.param("id"), data.nextIndex);
            });
        }
    }
};