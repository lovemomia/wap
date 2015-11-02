$(function () {
    if (!sg.common.is_login()) {
        sg.common.redirect_login();
    } else {
        $("#browsefile").change(sg.profile.update_avatar);
        $("#nickname").on("click", sg.profile.update_nickname);
        $("#sex").on("click", sg.profile.update_sex);
        $("#address").on("click", sg.profile.update_address);
    }
});

sg.profile = {
    update_avatar: function() {
        var ext = this.value.substr(this.value.lastIndexOf('.') + 1).toLowerCase();
        if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'bmp' && ext != 'png') {
            alert('图片格式错误');
            return;
        } else {
            var avatar_img = $("#avatar");
            do_upload(this.files[0], avatar_img);
        }

        function do_upload(file, avatar_img) {
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function (e) {
                var data = new FormData();
                data.append('file', $('#browsefile')[0].files[0]);
                $.ajax({
                    url: sg.config.api_img,
                    type: 'post',
                    data: data,
                    processData: false,
                    contentType: false,
                    success: function (resp) {
                        if (resp.errno != 0){
                            alert("更新头像失败");
                        } else {
                            var path = resp.data.path;
                            sg.common.post(sg.config.api + "/user/avatar", {
                                utoken: sg.common.cookie.get("utoken"),
                                avatar: path
                            }, function (data) {
                                avatar_img.attr("src", data.avatar);
                            });
                        }
                    },
                    error: function () {
                        alert("更新头像失败");
                    }
                });
            }
        }
    },

    update_nickname: function () {
        var nickname_div = $(this).children(".info");
        var nickname = prompt("请输入新的昵称", nickname_div.html());
        if (nickname) {
            sg.common.post(sg.config.api + "/user/nickname", {
                utoken: sg.common.cookie.get("utoken"),
                nickname: nickname
            }, function (data) {
                nickname_div.html(data.nickName);
            });
        }
    },

    update_sex: function () {
        var sex_div = $(this).children(".info");
        var sex = prompt("请输入新的性别", sex_div.html());
        if (sex) {
            sg.common.post(sg.config.api + "/user/sex", {
                utoken: sg.common.cookie.get("utoken"),
                sex: sex
            }, function (data) {
                sex_div.html(data.sex);
            });
        }
    },

    update_address: function () {
        var address_div = $(this).children(".info");
        var address = prompt("请输入新的住址", address_div.html());
        if (address) {
            sg.common.post(sg.config.api + "/user/address", {
                utoken: sg.common.cookie.get("utoken"),
                address: address
            }, function (data) {
                address_div.html(data.address);
            });
        }
    }
};