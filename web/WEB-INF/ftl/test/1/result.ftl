<@override name="title">测试结果</@override>

<@override name="css">
    <style type="text/css">
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>测试结果</div>
    <div class="content"></div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            var scores = new Array();
            var score1 = sessionStorage.getItem("test1_1");
            if (score1 != null) scores.push(score1);
            var score2 = sessionStorage.getItem("test1_2");
            if (score2 != null) scores.push(score2);
            var score3 = sessionStorage.getItem("test1_3");
            if (score3 != null) scores.push(score3);
            var score4 = sessionStorage.getItem("test1_4");
            if (score4 != null) scores.push(score4);
            var score5 = sessionStorage.getItem("test1_5");
            if (score5 != null) scores.push(score5);
            var score6 = sessionStorage.getItem("test1_6");
            if (score6 != null) scores.push(score6);
            var score7 = sessionStorage.getItem("test1_7");
            if (score7 != null) scores.push(score7);
            var score8 = sessionStorage.getItem("test1_8");
            if (score8 != null) scores.push(score8);

            scores.sort(function (a, b) {
                return a < b ? 1 : -1
            });

            var count = Math.min(scores.length, 3);
            for (var i = 0; i < count; i++) {
            }
        })
    </script>
</@override>

<@extends name="../../base.ftl"/>
