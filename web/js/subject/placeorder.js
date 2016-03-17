$(function () {
    sessionStorage.removeItem("skuId");
    sessionStorage.removeItem("price");
    sessionStorage.removeItem("subjectId");

    $(".sku").on("click", function () {
        doClick($(this));
    });

    function doClick (element) {
        $(".sku.on .sel img").attr("src", "/img/notsel2x.png");
        $(".sku.on").removeClass("on");

        element.addClass("on");
        element.children(".sel").children("img").attr("src", "/img/sel2x.png");

        var price = new Number(element.attr("price"));
        var discount = new Number($(".coupon").attr("discount"));
        $(".coupon").html("");
        if (price > discount) {
            price = (price - discount).toFixed(2);
            $("#total_fee").html(price);
            $(".coupon").html("(已减 " + $(".coupon").attr("discount") + ")");
        } else {
            $("#total_fee").html(element.attr("price"));
        }

        sessionStorage.setItem("skuId", element.attr("id"));
        sessionStorage.setItem("price", element.attr("price"));
        sessionStorage.setItem("subjectId", element.attr("sid"));
    }

    $("#packages").on("click", function () {
        window.location.href = "/subjectdetail?id=" + sg.common.param("id");
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
        } else if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
            alert("无效的手机号吗");
        } else {
            var invite = sessionStorage.getItem("invite");
            if (invite == null) invite = "";
            var couponCode = sg.common.param("ccode", "");
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
                },
                inviteCode: invite,
                couponCode: couponCode
            };

            sg.common.post(sg.config.api + "/subject/order", {
                utoken: sg.common.cookie.get("utoken"),
                order: JSON.stringify(order)
            }, sg.placeorder.success);
        }
    });

    var skuId = sg.common.param("sid", 0);
    if (skuId > 0) {
        doClick($("#" + skuId));
    }
});

sg.placeorder = {
    success: function (data) {
        window.location.href = "/payment/pay?oid=" + data.id + "&count=" + data.count + "&fee=" + data.totalFee;
    }
};