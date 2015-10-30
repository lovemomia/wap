$(function () {
    sessionStorage.removeItem("skuId");
    sessionStorage.removeItem("price");
    sessionStorage.removeItem("subjectId");

    $(".sku").on("click", function () {
        $(".sku.on .sel img").attr("src", "/img/notsel2x.png");
        $(".sku.on").removeClass("on");

        $(this).addClass("on");
        $(this).children(".sel").children("img").attr("src", "/img/sel2x.png");

        $("#total_fee").html($(this).attr("price"));

        sessionStorage.setItem("skuId", $(this).attr("id"));
        sessionStorage.setItem("price", $(this).attr("price"));
        sessionStorage.setItem("subjectId", $(this).attr("sid"));
    });

    $("#btn_submit").on("click", function () {
        var skuId = sessionStorage.getItem("skuId");
        var price = sessionStorage.getItem("price");
        var subjectId = sessionStorage.getItem("subjectId");
        var name = $("#name").val();
        var mobile = $("#mobile").val();

        if (skuId == null) {
            alert("请选择一个课程包");
        } else if (!name || name == "") {
            alert("联系人姓名不能为空");
        } else if (!mobile || mobile == "" || sg.common.invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else {
            var order = {
                skus: [
                    {
                        id: skuId,
                        subjectId: subjectId,
                        price: price,
                        count: 1
                    }
                ],
                contact: {
                    name: name,
                    mobile: mobile
                }
            };

            sg.common.post(sg.config.api + "/subject/order", {
                utoken: sg.common.cookie.get("utoken"),
                order: JSON.stringify(order)
            }, sg.placeorder.success, sg.common.error);
        }
    });
});

sg.placeorder = {
    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            var data = resp.data;
            window.location.href = "/payment/pay?oid=" + data.id + "&count=" + data.count + "&fee=" + data.totalFee;
        }
    }
};