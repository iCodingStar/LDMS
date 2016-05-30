
$(function () {

    $(".dropdown-menu li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $("#btn-teacher-search").on('click', function () {
        var username = $(".search-input-username").val();
        var rolename = $(".search-role .select-name").text();
        var state = $(".search-state .select-name").text();
        //alert(username+"---"+rolename+"---"+state);
        if (rolename == "所有角色") {
            rolename = "";
        }
        if (state == "所有状态") {
            state = "";
        } else if (state == "正常") {
            state = 1;
        } else {
            state = 0;
        }
        getTeacherPageDataAndParse(1, username, rolename, state);
    });

    // $(".add-user-submit").on('click', function () {
    //     var username = $("#add-user-modal-dialog .form-username").val().trim();
    //     var password = $("#add-user-modal-dialog .form-password").val().trim();
    //     var rolename = $("#add-user-modal-dialog .select-name").text().trim();
    //     $(".modal-body .alert").remove();
    //     if (username == "") {
    //         $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入用户名！</div>');
    //         return;
    //     } else if (username.length < 2 || username.length > 20) {
    //         $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">用户名长度应为2-20！</div>');
    //         return;
    //     } else if (password == "") {
    //         $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">密码不能为空！</div>');
    //         return;
    //     } else if (password.length < 6 || password.length > 16) {
    //         $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">密码长度应为6-16！</div>');
    //         return;
    //     } else if (rolename == "请选择角色") {
    //         $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请选择用户角色！</div>');
    //         return;
    //     }
    //
    //     var btn_this = $(this);
    //     getTeacherData("addUser.do", {
    //         username: username,
    //         password: password,
    //         rolename: rolename
    //     }, function (result) {
    //         if (result == '1') {
    //             showMsg("添加用户成功!", 0, refreshCurrentPage);
    //         } else if (result == '0') {
    //             btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">添加用户失败！</div>');
    //         } else if (result == '-1') {
    //             btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">输入信息有误！</div>');
    //         } else if (result == '-2') {
    //             alert(result);
    //             btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">用户名已存在！</div>');
    //         }
    //     });
    // });

    $(".btn-state").on('click', function () {
        $(".btn-state.btn-active").removeClass("btn-active");
        $(this).addClass("btn-active");
    });

    // $(".modify-user-submit").on('click', function () {
    //     var username = $(this).siblings().eq(0).find(".form-username").val();
    //     var rolename = $(this).siblings().eq(1).find(".select-name").text();
    //     var state = $(this).siblings().eq(2).find(".btn-active").text();
    //     if (state == "正常") {
    //         state = 1;
    //     } else {
    //         state = 0;
    //     }
    //
    //     getTeacherData("/admin/teacher/update", {
    //         username: username,
    //         rolename: rolename,
    //         state: state
    //     }, function (result) {
    //         if (result == '1') {
    //             //$("#modify-user-modal-dialog").modal('hide');
    //             showMsg("修改用户成功!", 0, refreshCurrentPage);
    //         } else {
    //             $("#modify-user-modal-dialog .modal-body").children().eq(0).before('<div class="alert alert-danger" role="alert">修改信息出现错误,请重试！</div>');
    //         }
    //     });
    // });

    // $(".delete-user-submit").on('click', function () {
    //     var username = $("#delete-user-modal-dialog .delete-username").text();
    //     if (username == null) {
    //         return;
    //     }
    //     getTeacherData("deleteUser.do", {
    //         username: username
    //     }, function (result) {
    //         //$("#delete-user-modal-dialog").modal('hide');
    //         if (result == '1') {
    //             showMsg("删除用户成功!", 0, refreshCurrentPage);
    //         } else {
    //             showMsg("删除用户失败，请稍候重试!", 1);
    //         }
    //     });
    // });

});

function getTeacherPageDataAndParse(page, username, rolename, state) {
    if (page < 0) return;
    getTeacherData("/admin/teacher/query", {
        page: page,
        username: username,
        roleName: rolename,
        state: state
    }, function (data) {
        $(".table tr:not(:first)").remove();
        if (data == null) {
            return;
        }
        $.each(data.datas, function (index, item) {
            var node = "<tr>"
                + "<td>" + item.userId + "</td>"
                + "<td>" + item.username + "</td>"
                + "<td>" + item.role.roleName + "</td>"
                + "<td>";
            if (item.state == 1) {
                node += "正常";
            } else if (item.state == 0) {
                node += "封锁";
            }
            node += "</td>"
                + "<td><button type='button' class='btn btn-primary btn-sm modify-user-btn'"
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
        // //按钮事件绑定
        // $(".modify-user-btn").on('click', function () {
        //     var username = $(this).parent().siblings().eq(1).text();
        //     var rolename = $(this).parent().siblings().eq(2).text();
        //     var state = $(this).parent().siblings().eq(3).text();
        //     $("#modify-user-modal-dialog").find(".form-username").val(username);
        //     $(".btn-state.btn-active").removeClass("btn-active");
        //     if (state == "正常") {
        //         $(".btn-state").eq(0).addClass("btn-active");
        //     } else {
        //         $(".btn-state").eq(1).addClass("btn-active");
        //     }
        //     $("#modify-user-modal-dialog").find(".select-name").text(rolename);
        // });
        //
        // $(".delete-user-btn").on('click', function () {
        //     var username = $(this).parent().siblings().eq(1).text();
        //     $(".delete-username").text(username);
        // });

        //分页
        $(".page-nav .pagination li").remove();
        if (data.pageCount > 1) {
            var paramStr = "";
            if (username && username != "") {
                paramStr += ",'" + username + "'";
            }
            if (rolename && rolename != "") {
                paramStr += ",'" + rolename + "'";
            }
            if (state && state != "") {
                paramStr += ",'" + state + "'";
            }

            var prevPage = "<li><span aria-hidden='true' onclick=getTeacherPageDataAndParse(" + parseInt(data.currentPage - 1) + paramStr + ")>&laquo;</span></li>";
            $(".page-nav .pagination").append(prevPage);

            for (var i = data.startPage; i <= data.endPage; i++) {
                var pagenav = "";
                if (data.currentPage == i) {
                    pagenav += "<li class='active'>";
                } else {
                    pagenav += "<li>";
                }
                pagenav += "<a onclick=getTeacherPageDataAndParse(" + i + paramStr + ")>" + i + "</a></li>";
                $(".page-nav .pagination").append(pagenav);
            }

            var nextPage = "<li><span aria-hidden='true' onclick=getTeacherPageDataAndParse(" + parseInt(data.currentPage + 1) + paramStr + ")>&raquo;</span></li>";
            $(".page-nav .pagination").append(nextPage);

            if (data.currentPage == 1) {
                $(".page-nav .pagination li:first").remove();
            }
            if (data.currentPage == data.endPage) {
                $(".page-nav .pagination li:last").remove();
            }
        }
    });
}

/**
 * @author: shixing
 * @since : 1.0.0
 * @function:使用ajax完成POST请求
 */
function getTeacherData(url, data, callback) {
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

function refreshCurrentPage() {
    var currentPage = $(".pagination .active a").text();
    if (currentPage == "") {
        currentPage = 1;
    }
    getTeacherPageDataAndParse(currentPage);
}