<@override name="title"></@override>

<@override name="css">
    <style type="text/css">

    </style>
</@override>

<@override name="body">
    <div class="content bottom-padding">
        <div class="form top-margin">
            <dl>
                <dt>孩子姓名</dt>
                <dd class="left">
                    <i></i>
                    <input type="text" id="childname" placeholder="输入孩子姓名" />
                </dd>
            </dl>
            <hr class="sep" />
            <dl>
                <dt class="letter-sp8">手机号</dt>
                <dd class="left">
                    <i></i>
                    <input type="tel" id="mobile" placeholder="输入手机号码" />
                </dd>
            </dl>
        </div>
    </div>

    <div class="btn top-margin">
        <button id="btn_submit" class="btn-lg-main">确认报名</button>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            $("#btn_submit").on("click", function () {
                var childName = $("#childname").val();
                var mobile = $("#mobile").val();
                if (!childName || childName == "") {
                    alert("孩子姓名不能为空");
                } else if (!mobile || mobile == "" || sg.common.is_invalid_mobile(mobile)) {
                    alert("无效的手机号吗");
                } else {
                    sg.common.post("/entryform/submit", {
                        childname: childName,
                        mobile: mobile
                    }, function (data) {
                        alert("报名成功");
                    });
                }
            });
        });
    </script>
</@override>

<@extends name="base.ftl"/>
