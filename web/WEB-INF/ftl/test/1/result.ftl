<@override name="title">孩子的天赋密码</@override>

<@override name="css">
    <style type="text/css">
        .title {
            padding-left: 0.1rem;
            text-align: left;
            font-size: 0.18rem;
        }

        .result {
            padding: 0.1rem;
            text-align: left;
            background-color: #ffffff;
        }

        .result .left {
            width: 1.2rem;
        }

        .result .left img {
            margin-top: 0.03rem;
            width: 1.2rem;
            height: 1.23rem;
        }

        .people {
            font-size: 0.12rem;
            color: #777777;
        }

        .result .right {
            width: 2.5rem;
        }

        h3 {
            margin-top: 0;
            margin-bottom: 0.05rem;
        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back home left"><img src="/img/back3x.png"></div>孩子的天赋密码</div>
    <div class="content top-padding">
        <div class="title bottom-margin">您孩子的这些小天赋很突出哦！</div>
        <#list results as result>
            <div class="result bottom-margin top-border bottom-border">
                <div class="left">
                    <img src="${result.img}" />
                    <div class="people top-margin">代表人物: ${result.people}</div>
                </div>
                <div class="right">
                    <h3 style="color: ${result.color}">${result.title}</h3>
                    <div>${result.desc}</div>
                </div>
                <div style="clear: both;"></div>
            </div>
        </#list>
    </div>
</@override>

<@override name="js">
    <script type="text/javascript">
        $(function () {
            $(".back").on("click", function () {
                window.location.href = "/";
            });
        });
    </script>
</@override>

<@extends name="../../base.ftl"/>
