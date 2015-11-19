$(function () {
    if (sessionStorage.getItem("test1_1") == null) sessionStorage.setItem("test1_1", 0);
    if (sessionStorage.getItem("test1_2") == null) sessionStorage.setItem("test1_2", 0);
    if (sessionStorage.getItem("test1_3") == null) sessionStorage.setItem("test1_3", 0);
    if (sessionStorage.getItem("test1_4") == null) sessionStorage.setItem("test1_4", 0);
    if (sessionStorage.getItem("test1_5") == null) sessionStorage.setItem("test1_5", 0);
    if (sessionStorage.getItem("test1_6") == null) sessionStorage.setItem("test1_6", 0);
    if (sessionStorage.getItem("test1_7") == null) sessionStorage.setItem("test1_7", 0);
    if (sessionStorage.getItem("test1_8") == null) sessionStorage.setItem("test1_8", 0);

    var test1_ids = sessionStorage.getItem("test1_ids");
    if (test1_ids == null) {
        test1_ids = JSON.stringify(new Array());
        test1_ids = sessionStorage.setItem("test1_ids", test1_ids);
    }

    var ids = JSON.parse(test1_ids);
    $(".question").each(function () {
        var id = $(this).attr("id");
        if (ids[id] == 1) {
            $(this).addClass("active");
            $(this).append("<div class='sel'><img src='/img/sel.jpg' /></div>");
        } else {
            $(this).append("<div class='sel'><img src='/img/unsel.jpg' /></div>");
        }
    });

    $(".question").on("click", function () {
        var ids = JSON.parse(sessionStorage.getItem("test1_ids"));
        var category = $(this).attr("category");
        var id = $(this).attr("id");
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
            $(this).children(".sel").children("img").attr("src", "/img/unsel.jpg");

            var score = sessionStorage.getItem(category);
            sessionStorage.setItem(category, Number(score) - 1);
            ids[id] = 0;
        } else {
            $(this).addClass("active");
            $(this).children(".sel").children("img").attr("src", "/img/sel.jpg");

            var score = sessionStorage.getItem(category);
            sessionStorage.setItem(category, Number(score) + 1);
            ids[id] = 1;
        }

        sessionStorage.setItem("test1_ids", JSON.stringify(ids));
    });
});