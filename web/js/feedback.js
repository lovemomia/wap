$(function () {
    $('#btn_commit').on('click', function () {
        var content = $("#content").val();
        var contact = $("#contact").val();
        if (!content || content == "") {
            alert("反馈内容不能为空");
        } else if (content.length > 200) {
            alert("反馈字数超出限制");
        } else if (!contact || contact == "") {
            alert("联系方式不能为空");
        } else {
            sg.common.post(sg.config.api + "/feedback", {
                content: content,
                contact: contact
            }, sg.feedback.success, sg.common.error);
        }
    });
});

sg.feedback = {
    success: function (resp) {
        if (resp.errno != 0) {
            alert(resp.errmsg);
        } else {
            alert("反馈提交成功");
        }
    }
};