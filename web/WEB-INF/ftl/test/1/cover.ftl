<@override name="title">你的孩子是哪种天才？</@override>

<@override name="css">
    <style type="text/css">
        body {
            background-color: #ffffff;
        }

        p {
            margin: 0;
        }

        h2 {
            color: #333333;
        }

        .desc {
            padding: 0 0.2rem 0.2rem 0.2rem;
            text-align: left;
            color: #757575;
        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>你的孩子是哪种天才？</div>
    <div class="content">
        <div><img src="http://s.sogokids.com/2015-11-18/737fc6aa3e65067f3d426b76091fb3a2.jpg" /></div>
        <div class="desc">
            <h2>为什么要测试孩子的天赋</h2>
            <p class="bottom-margin">著名儿童心理学家格塞尔认为：</p>
            <p>孩子带着一个天然进度表降临人世。尽管知他们认知无法与成人相比，但对于内在需要，他们比成人更加敏锐，每个孩子都非常“聪明”。</p>
            <p class="top-margin">（量表依据哈佛心理学学家加德纳的多元智能理论开发）</p>
        </div>
        <div class="top-margin bottom-margin"><button id="btn_start" class="btn-lg-orange">开始测试</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            $("#btn_start").on("click", function () {
                window.location.href = "/test/1/1";
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
