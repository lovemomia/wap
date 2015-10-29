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
            }, sg.placeorder.success, sg.placeorder.error);
        }
    });
});

sg.placeorder = {
    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            pay(resp);
        }

        function pay(resp) {
            var form = document.createElement("form");
            form.action = "/payment/pay";
            form.method = "post";
            form.style.display = "none";

            var data = resp.data;
            var oid = document.createElement("input");
            oid.name = "oid";
            oid.value = data.id;
            form.appendChild(oid);

            var count = document.createElement("input");
            count.name = "count";
            count.value = data.count;
            form.appendChild(count);

            var fee = document.createElement("input");
            fee.name = "fee";
            fee.value = data.totalFee;
            form.appendChild(fee);

            document.body.appendChild(form);

            form.submit();
        }
    },

    error: function (resp) {
        alert("网络异常，请稍后再试");
    }
}