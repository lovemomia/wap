$(function () {
    $("#mobile").on("input", function () {
        var val = $(this).val();
        if (sg.common.is_invalid_mobile(val)) {
            $("#get_coupon").removeClass("active");
            $("#get_coupon").addClass("disable");
        } else {
            $("#get_coupon").removeClass("disable");
            $("#get_coupon").addClass("active");
        }
    });

    $("#get_coupon").on("click", function () {
        if ($(this).hasClass("active")) {
            var inviteCode = sessionStorage.getItem("invite");
            if (inviteCode == null) {
                alert("领取红包失败，无效的分享链接")
            } else {
                var mobile = $("#mobile").val();
                $.ajax({
                    url: sg.config.api + "/coupon/invite",
                    data: {
                        mobile: mobile,
                        invite: inviteCode
                    },
                    type: "post",
                    dataType: "json",
                    timeout: 5000,
                    success: function (resp) {
                        if (resp.errno != 0) {
                            $(".msg").html(resp.errmsg);
                            $("#mobile").val("");
                            $("#get_coupon").removeClass("active");
                            $("#get_coupon").addClass("disable");
                        } else {
                            window.location.href = "/hongbao_result?mobile=" + mobile;
                        }
                    },
                    error: function () {
                        alert("网络异常，请稍后再试");
                    }
                });
            }
        }
    });
});