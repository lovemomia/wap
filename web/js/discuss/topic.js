$(function () {
    $("#btn_join").on("click", function () {
        if (confirm("该功能目前只能在APP上使用，快去下载APP吧~")) {
            window.location.href = "http://a.app.qq.com/o/simple.jsp?pkgname=com.youxing.duola";
        }
    })
});