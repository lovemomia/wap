<@override name="title"></@override>

<@override name="css">
    <style type="text/css">
        body {
            background-color: #00c49d;
        }

        input {
            width: 3.6rem;
            height: 0.4rem;
        }

        .invite {
            width: 100%;
            height: 11.02rem;
            background-image: url("http://s.sogokids.com/2016-03-14/35bc5ab0cf4b7b6d6358988d6ee54ec3.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        #btn_submit {
            display: inline-block;
            padding: 0.1rem 0.2rem;
            width: 3.6rem;
            height: 0.578rem;
            font-size: 0.19rem;
            color: #ffffff;
            background-color: transparent;
            background-image: url("/img/invite_btn.png");
            background-repeat: no-repeat;
            background-size: 100% 100%;
            border: none;
        }
    </style>
</@override>

<@override name="body">
    <div class="content bottom-padding">
        <div class="invite"></div>
        <div class="top-margin"><input type="text" id="childname" placeholder="输入孩子姓名" /></div>
        <div class="top-margin bottom-padding"><input type="tel" id="mobile" placeholder="输入手机号码" /></div>
        <div class="btn top-padding bottom-padding">
            <button id="btn_submit"></button>
        </div>
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
