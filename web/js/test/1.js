$(function () {
    var ids = JSON.parse(sessionStorage.getItem("test1_ids"));
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