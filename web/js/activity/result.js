$(function () {
    var eid = sg.common.param("eid");
    sg.common.post(sg.config.api_ssl + "/activity/check", {
        eid: eid
    }, sg.result.success);

    var aid = sg.common.param("aid", 0);
    if (aid > 0) {
        $(".back").on("click", function () {
            window.location.href = "/activity/detail/" + aid;
        });
    }
});

sg.result = {
    success: function (data) {
        if (data == true) {
            $(".content .title").html("付款成功");
            $(".content .desc").html("您已报名成功");
        } else {
            $(".content .title").html("付款失败");
            $(".content .desc").html("如果支付系统已扣款，请与客服联系");
        }
    }
};