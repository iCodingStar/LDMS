Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

function showMsg(msg, type, callback) {

    $(".modal").modal('hide');

    $(".message-body .alert").remove();

    switch (type) {
        case 0:
            $(".message-body").append('<div class="alert alert-success" role="alert">' + msg + '</div>');
            break;
        case 1:
            $(".message-body").append('<div class="alert alert-danger" role="alert">' + msg + '</div>');
            break
    }

    $("#msg-modal").modal('show');
    setTimeout(function () {
        $("#msg-modal").modal('hide');
        if (callback) {
            callback();
        }
    }, 2000);
}

$(function () {
    $(".modal-body .btn-single").on('click', function () {
        var oldPass = $("#old-password-div").find("input").val().trim();
        var newPass1 = $("#new-password-div1").find("input").val().trim();
        var newPass2 = $("#new-password-div2").find("input").val().trim();
        $(".modal-body .alert").remove();
        if (oldPass == "") {
            $("#old-password-div").before('<div class="alert alert-danger" role="alert">请输入原密码！</div>');
            return;
        } else if (newPass1.length < 6) {
            $("#old-password-div").before('<div class="alert alert-danger" role="alert">密码长度为6-16！</div>');
            return;
        } else if (newPass1 != newPass2) {
            $("#old-password-div").before('<div class="alert alert-danger" role="alert">两次输入不一致！</div>');
            return;
        }

        $.post("../modifyPassword.do", {
            "oldPass": oldPass,
            "newPass": newPass1
        }, function (response) {
            if (response == '0') {
                $("#modify-pass").modal('hide');
                showMsg("密码修改成功,请重新登录", 0, toLoginPage);
            } else if (response == '-1') {
                $("#old-password-div").before('<div class="alert alert-danger" role="alert">原密码输入错误！</div>');
            } else if (response == '1') {
                $("#old-password-div").before('<div class="alert alert-danger" role="alert">修改密码失败！</div>');
            } else if (response == '2') {
                $("#modify-pass").modal('hide');
                showMsg("登录失效,请重新登录", 0, toLoginPage);
            }
        }, 'text');
    });
});

