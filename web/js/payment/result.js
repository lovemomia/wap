$(function () {
    $("#btn_booking").on("click", function () {
        var oid = sg.common.param("oid");
        window.location.href = "/user/bookable?oid=" + oid;
    });

    $("#btn_order").on("click", function () {
        window.location.href = "/user/order?status=3";
    });
});