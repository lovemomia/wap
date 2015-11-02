$(function () {
    sessionStorage.removeItem("selPid");
    sessionStorage.removeItem("selSid");

    var status = sg.common.param("status",1);
    if (status == 1) $("#week").addClass("on");
    else if (status == 2) $("#cur_month").addClass("on");
    else $("#next_month").addClass("on");

    var pid = sg.common.param("pid");
    if (pid > 0) {
        sessionStorage.setItem("selPid", pid);

        $(".sku.place .element.active").on("click", function () {
            sessionStorage.removeItem("selSid");

            $(".right.sel").each(function() {
                $(this).html("");
            });

            $(this).children(".right.sel").html("<img src='/img/sel2x.png' />");

            sessionStorage.setItem("selSid", $(this).attr("sid"));
        });

        $("#btn_submit").on("click", function () {
            var pid = sessionStorage.getItem("selPid");
            var sid = sessionStorage.getItem("selSid");
            if (pid > 0) {
                if (sid == null || sid <= 0) {
                    alert("请先选择一个时间地点");
                } else {
                    sg.common.post(sg.config.api + "/course/booking", {
                        utoken: sg.common.cookie.get("utoken"),
                        pid: pid,
                        sid: sid
                    }, function (data) {
                        alert("预约成功");
                        sg.common.back();
                    });
                }
            }
        });
    }
});