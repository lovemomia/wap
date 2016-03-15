<@override name="title">邀请函</@override>

<@override name="css">
    <style type="text/css">
        body {
            background-color: #00c49d;
        }

        input {
            margin: 0.1rem 0;
            padding: 0 0.125rem;
            width: 3.2rem;
            height: 0.4rem;
            border-color: #e1e1e1;
            font-size: 0.16rem;
            border: none;
            border-radius: 0.05rem;
        }

        .content {
            padding-bottom: 0.5rem;
        }

        .btn {
            margin-top: 0.25rem
        }

        .invite {
            margin: 0.1rem auto;
            width: 3.8rem;
            height: 10.45rem;
            background-image: url("http://s.sogokids.com/2016-03-15/02b15033e83048d9ecb181b18fd6b747.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        #btn_submit {
            display: inline-block;
            padding: 0.1rem 0.2rem;
            width: 3.2rem;
            height: 0.51rem;
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
    <div class="content">
        <div class="invite"></div>
        <div class="top-padding"><input type="text" id="childname" placeholder="输入孩子姓名" /></div>
        <div><input type="tel" id="mobile" placeholder="输入手机号码" /></div>
        <div class="btn">
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
                        alert("您已报名成功，\n我们将把详细信息发送至您的手机，\n请注意查收。");
                    });
                }
            });
        });
    </script>
</@override>

<@extends name="base.ftl"/>
