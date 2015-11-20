<@override name="title">趣味测试</@override>

<@override name="css">
    <style type="text/css">
        .test {
            position: relative;
            margin: 0 0.1rem 0.11rem 0.1rem;
            box-shadow: 0.03rem 0.04rem 0.02rem #e6e6e6;
        }

        .test .cover {
            width: 100%;
            height: 2.06rem;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .test .title {
            position: relative;
            padding: 0.1rem;
            width: 100%;
            height: 0.6rem;
            line-height: 0.4rem;
            background-color: #ffffff;
            text-align: left;
            font-size: 0.2rem;
        }

        .test .joined {
            position: absolute;
            top: 0.3rem;
            right: 0;
            padding: 0.02rem 0.1rem 0.03rem 0.15rem;
            background-image: url("/img/label3x.png");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            color: #ffffff;
            font-size: 0.12rem;
        }
    </style>
</@override>

<@override name="body">
    <div class="header bg-white bottom-border"><div class="back left"><img src="/img/back3x.png"></div>趣味测试</div>
    <div class="content top-padding">
        <#list tests as test>
            <a href="/test/${test.id}/cover">
                <div class="test scrollable">
                    <div class="cover" style="background-image: url('${test.cover}')"></div>
                    <div class="title overflow-hidden">${test.title}</div>
                    <div class="joined">${test.joined}人已参加</div>
                </div>
            </a>
        </#list>
    </div>
</@override>

<@extends name="../base.ftl"/>
