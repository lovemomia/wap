<#setting number_format="#.##">

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title><@block name="title" ></@block></title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <@block name="css" ></@block>
</head>
<body>
    <@block name="body"></@block>
    <script type="text/javascript">document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/4+"px";</script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/config.js"></script>
    <script type="text/javascript" src="/js/main.js"></script>
    <@block name="js" ></@block>
</body>
</html>