<@override name="title">灰</@override>

<@override name="css">
    <link rel="stylesheet" type="text/css" href="/css/test/1.css">
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>灰</div>
    <div class="content">
        <div class="title"><span class="color-main">8</span>/8 灰</div>
        <div class="questions">
            <div class="question" category="test1_4" id="36">显示出手工艺技巧（例如：折纸、拼贴等手工）或在其他方面表现出良好的动作协调性（例如：跳舞、手指操）</div>
            <hr class="sep" />
            <div class="question" category="test1_5" id="37">有时会有节奏地敲打桌子</div>
            <hr class="sep" />
            <div class="question" category="test1_6" id="38">有两个或更多亲密朋友</div>
            <hr class="sep" />
            <div class="question" category="test1_7" id="39">能从生活的成功和失败中学习</div>
            <hr class="sep" />
            <div class="question" category="test1_8" id="40">很关心生态系统的话题（例如对于大鱼吃小鱼，小鱼吃虾米的问题感到好奇）</div>
        </div>
        <div class="bottom-margin"><button id="btn_submit" class="btn-lg-main">查看结果</button></div>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript" src="/js/test/1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn_submit").on("click", function () {
                var scores = new Array(sessionStorage.getItem("test1_1"),
                        sessionStorage.getItem("test1_2"),
                        sessionStorage.getItem("test1_3"),
                        sessionStorage.getItem("test1_4"),
                        sessionStorage.getItem("test1_5"),
                        sessionStorage.getItem("test1_6"),
                        sessionStorage.getItem("test1_7"),
                        sessionStorage.getItem("test1_8"));

                var form = $("<form method='post'></form>");
                form.attr({"action": "/test/1/result"});
                var ids_input = $("<input type='hidden'>");
                ids_input.attr({ "name": "ids" });
                ids_input.val(sessionStorage.getItem("test1_ids"));
                form.append(ids_input);
                var scores_input = $("<input type='hidden'>");
                scores_input.attr({ "name": "scores" });
                scores_input.val(scores);
                form.append(scores_input);

                sg.test1.reset();

                form.submit();
            });
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
