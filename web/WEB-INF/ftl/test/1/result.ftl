<@override name="title">测试结果</@override>

<@override name="css">
    <style type="text/css">
        .result {
            padding: 0.1rem;
            text-align: left;
            background-color: #ffffff;
        }

        h3 {
            margin-top: 0;
            margin-bottom: 0.1rem;
        }

        .people {

        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>测试结果</div>
    <div class="content">
        <#list results as result>
            <div class="result top-margin top-border bottom-border">
                <h3>${result.title}</h3>
                <div>${result.desc}</div>
                <div class="people top-margin">代表人物: ${result.people}</div>
            </div>
        </#list>
    </div>
</@override>

<@extends name="../../base.ftl"/>
