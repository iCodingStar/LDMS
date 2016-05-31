
$(function () {

    getUserPageDataAndParse(1);

    $(".dropdown-menu li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $("#btn-search-user").on('click', function () {
        var username = $(".search-input-username").val();
        var rolename = $(".search-role .select-name").text();

        if (rolename == "用户角色"|| rolename == "所有角色") {
            rolename = "";
        }

        getUserPageDataAndParse(1, username, rolename);
    });

    $(".add-user-submit").on('click', function () {
        var username = $("#add-user-modal-dialog .form-username").val().trim();
        var password = $("#add-user-modal-dialog .form-password").val().trim();
        var rolename = $("#add-user-modal-dialog .select-name").text().trim();
        $(".modal-body .alert").remove();
        if (username == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入用户名！</div>');
            return;
        } else if (username.length < 2 || username.length > 20) {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">用户名长度应为2-20！</div>');
            return;
        } else if (password == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">密码不能为空！</div>');
            return;
        } else if (password.length < 6 || password.length > 16) {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">密码长度应为6-16！</div>');
            return;
        } else if (rolename == "请选择角色") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请选择用户角色！</div>');
            return;
        }

        var btn_this = $(this);
        getUserData("/admin/user/add", {
            username: username,
            password: password,
            auth: rolename
        }, function (result) {
            if (result == 'success') {
                showMsg("添加用户成功!", 0, refreshCurrentPage);
            } else if (result == '0') {
                btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">添加用户失败！</div>');
            } else if (result == '-1') {
                btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">输入信息有误！</div>');
            } else if (result == '-2') {
                alert(result);
                btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">用户名已存在！</div>');
            }
        });
    });

    $(".btn-state").on('click', function () {
        $(".btn-state.btn-active").removeClass("btn-active");
        $(this).addClass("btn-active");
    });

    $(".modify-user-submit").on('click', function () {
        var username = $(this).siblings().eq(0).find(".form-username").val();
        var rolename = $(this).siblings().eq(1).find(".select-name").text();
        alert(username + ":" + rolename)
        getUserData("/admin/user/update", {
            username: username,
            auth: rolename
        }, function (result) {
            if (result == 'success') {
                showMsg("修改用户成功!", 0, refreshCurrentPage);
            } else {
                $("#modify-user-modal-dialog .modal-body").children().eq(0).before('<div class="alert alert-danger" role="alert">修改信息出现错误,请重试！</div>');
            }
        });
    });

    $(".delete-user-submit").on('click', function () {
        var username = $("#delete-user-modal-dialog .delete-username").text();

        if (username == null) {
            return;
        }
        getUserData("/admin/user/delete", {
            username: username
        }, function (result) {
            if (result == 'success') {
                showMsg("删除用户成功!", 0, refreshCurrentPage);
            } else {
                showMsg("删除用户失败，请稍候重试!", 1);
            }
        });
    });

});

/**
 * @author: shixing
 * @since : 1.0.0
 * @function:使用ajax完成POST请求
 */
function getUserData(url, data, callback) {
    $.ajax({
        method: 'POST',
        url: url,
        data: data,
        success: function (response) {
            callback(response);
        },
        error: function () {
            showMsg("服务器发生错误,操作失败!", 1);
        }
    });
}


function getUserPageDataAndParse(page, username, rolename) {
    if (page < 0) return;
    getUserData("/admin/user/query/page", {
        page: page,
        username: username,
        auth: rolename
    }, function (data) {

        $(".table tr:not(:first)").remove();
        if (data == null) {
            return;
        }

        $.each(data.data, function (index, item) {
            var node = "<tr>"
                + "<td>" + (index + 1) + "</td>"
                + "<td>" + item.username + "</td>"
                + "<td>" + item.auth + "</td>";

            node += "<td><button type='button' class='btn btn-primary btn-sm modify-user-btn'"
                + "data-target='#modify-user-modal-dialog' data-toggle='modal'>修改"
                + "</button>"
                + "<button type='button' class='btn btn-primary btn-sm delete-user-btn'"
                + "data-target='#delete-user-modal-dialog'"
                + "data-toggle='modal'>删除"
                + "</button>"
                + "</td>"
                + "</tr>";
            $(".table").append(node);
        });

        //按钮事件绑定
        $(".modify-user-btn").on('click', function () {
            var username = $(this).parent().siblings().eq(1).text();
            var rolename = $(this).parent().siblings().eq(2).text();

            $("#modify-user-modal-dialog").find(".form-username").val(username);
            $("#modify-user-modal-dialog").find(".select-name").text(rolename);
        });

        //获取用户名绑定到确认的dialog上
        $(".delete-user-btn").on('click', function () {
            var username = $(this).parent().siblings().eq(1).text();
            $(".delete-username").text(username);
        });

        //分页
        $(".page-nav .pagination li").remove();
        if (data.totalPages > 1) {
            var paramStr ="";

            paramStr += ",'" + username + "'";
            paramStr += ",'" + rolename + "'";

            var prevPage = "<li><span aria-hidden='true' onclick=getUserPageDataAndParse(" + parseInt(data.currentPage - 1) + paramStr + ")>&laquo;</span></li>";
            $(".page-nav #user").append(prevPage);

            for (var i = data.startPage; i <= data.endPage; i++) {
                var pagenav = "";
                if (data.currentPage == i) {
                    pagenav += "<li class='active'>";
                } else {
                    pagenav += "<li>";
                }
                pagenav += "<a onclick=getUserPageDataAndParse(" + i + paramStr + ")>" + i + "</a></li>";
                $(".page-nav #user").append(pagenav);
            }

            var nextPage = "<li><span aria-hidden='true' onclick=getUserPageDataAndParse(" + parseInt(data.currentPage + 1) + paramStr + ")>&raquo;</span></li>";
            $(".page-nav #user").append(nextPage);

            if (data.currentPage == 1) {
                $(".page-nav #user li:first").remove();
            }
            if (data.currentPage == data.endPage) {
                $(".page-nav #user li:last").remove();
            }
        }
    });
}


function refreshCurrentPage() {
    var currentPage = $("#user .active a").text();
    if (currentPage == "") {
        currentPage = 1;
    }
    getUserPageDataAndParse(currentPage);
}