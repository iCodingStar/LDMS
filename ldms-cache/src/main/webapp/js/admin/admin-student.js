$(function () {
    getStudentPageDataAndParse(1);
    $(".dropdown-menu li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $("#btn-student-search").on('click', function () {
        var input_info = $(".search-student-input").val();
        var choose_info = $(".search-student-info .select-name").text();
        var sex = $(".search-student-sex .select-name").text() + "";

        // alert(input_info + "---" + choose_info + "---" + sex);

        var id, name, major, classId, academy;
        if (choose_info == "学号") {
            id = input_info;
        }
        if (choose_info == "姓名") {
            name = input_info;
        }
        if (choose_info == "班级") {
            classId = input_info;
        }
        if (choose_info == "专业") {
            major = input_info;
        }
        if (choose_info == "学院") {
            academy = input_info;
        }
        if (sex == "性别" || sex == "无筛选") {
            sex = "";
        }
        getStudentPageDataAndParse(1, id, name, sex, classId, major, academy);
    });

    $(".add-user-submit").on('click', function () {
        var name = $("#add-user-modal-dialog .form-username").val().trim();
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
        getStudentData("/admin/student/update", {
            username: username,
            password: password,
            rolename: rolename
        }, function (result) {
            if (result == '1') {
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

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function：按钮状态改变
     */
    $(".btn-state").on('click', function () {
        $(".btn-state.btn-active").removeClass("btn-active");
        $(this).addClass("btn-active");
    });

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:
     */
    $(".modify-user-submit").on('click', function () {
        var id = $(this).siblings().eq(0).find(".form-id").val().trim();
        var classId = $(this).siblings().eq(1).find(".form-classId").val().trim();
        var name = $(this).siblings().eq(2).find(".form-name").val().trim();
        var sex = $(this).siblings().eq(3).find(".btn-active").text().trim();
        var major = $(this).siblings().eq(4).find(".form-major").val().trim();
        var academy = $(this).siblings().eq(5).find(".form-academy").val().trim();

        $(".modal-body .alert").remove();

        if (classId == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入班级！</div>');
            return;
        } else if (name == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入名字！</div>');
            return;
        } else if (sex == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请选择性别！</div>');
            return;
        } else if (major == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请填写专业！</div>');
            return;
        } else if (academy == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请填写学院！</div>');
            return;
        }


        getStudentData("/admin/student/update", {
            id: id,
            classId: classId,
            name: name,
            sex:sex,
            major:major,
            academy:academy
        }, function (result) {
            if (result == 'success') {
                showMsg("修改用户成功!", 0, refreshCurrentPage);
            } else {
                $("#modify-user-modal-dialog .modal-body").children().eq(0).before('<div class="alert alert-danger" role="alert">修改信息出现错误,请重试！</div>');
            }
        });
    });

    $(".delete-user-submit").on('click', function () {
        var id = $("#delete-user-modal-dialog .delete-student-id").text();
        if (id == null) {
            return;
        }
        getStudentData("/admin/student/delete", {
            id: id
        }, function (result) {
            if (result == 'success') {
                showMsg("删除用户成功!", 0, refreshCurrentPage);
            } else {
                showMsg("删除用户失败，请稍候重试!", 1);
            }
        });
    });

});

function getStudentPageDataAndParse(page, id, name, sex, classId, major, academy) {
    if (page < 0) return;
    getStudentData("/admin/student/query/page", {
        page: page,
        id: id,
        name: name,
        sex: sex,
        classId: classId,
        major: major,
        academy: academy
    }, function (data) {

        $(".table tr:not(:first)").remove();
        if (data == null) {
            return;
        }

        $.each(data.data, function (index, item) {
            var node = "<tr>"
                + "<td>" + item.id + "</td>"
                + "<td>" + item.classId + "</td>"
                + "<td>" + item.name + "</td>"
                + "<td>" + item.sex + "</td>"
                + "<td>" + item.major + "</td>"
                + "<td>" + item.academy + "</td>";

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

        //按钮事件绑定:将当前表格数据显示到打开的模态框
        $(".modify-user-btn").on('click', function () {

            var id = $(this).parent().siblings().eq(0).text();
            var classId = $(this).parent().siblings().eq(1).text();
            var name = $(this).parent().siblings().eq(2).text();
            var sex = $(this).parent().siblings().eq(3).text();
            var major = $(this).parent().siblings().eq(4).text();
            var academy = $(this).parent().siblings().eq(5).text();

            $("#modify-user-modal-dialog").find(".form-id").val(id);
            $("#modify-user-modal-dialog").find(".form-classId").val(classId);
            $("#modify-user-modal-dialog").find(".form-name").val(name);
            $("#modify-user-modal-dialog").find(".form-major").val(major);
            $("#modify-user-modal-dialog").find(".form-academy").val(academy);

            if (sex == "男") {
                $(".btn-state").eq(0).addClass("btn-active");
                $(".btn-state").eq(1).removeClass("btn-active");
            } else {
                $(".btn-state").eq(1).addClass("btn-active");
                $(".btn-state").eq(0).removeClass("btn-active");
            }
        });

        $(".delete-user-btn").on('click', function () {
            var id = $(this).parent().siblings().eq(0).text();
            var username = $(this).parent().siblings().eq(2).text();
            $(".delete-student-id").text(id);
            $(".delete-student-name").text(username);
        });

        //分页
        $(".page-nav .pagination li").remove();

        if (data.totalPages > 1) {//
            var paramStr = "";

            if (typeof(id) == "undefined") {
                id = "";
            }
            if (typeof(name) == "undefined") {
                name = "";
            }
            if (typeof(classId) == "undefined") {
                classId = "";
            }
            if (typeof(major) == "undefined") {
                major = "";
            }
            if (typeof(academy) == "undefined") {
                academy = "";
            }
            if (typeof(sex) == "undefined") {
                sex = "";
            }

            paramStr = ",'" + id + "','" + name + "','" + sex + "','" + classId + "','" + major + "','" + academy + "'";

            var prevPage = "<li><span aria-hidden='true' onclick=getStudentPageDataAndParse(" + parseInt(data.currentPage - 1) + paramStr + ")>&laquo;</span></li>";
            $(".page-nav .pagination").append(prevPage);

            for (var i = data.startPage; i <= data.endPage; i++) {
                var pagenav = "";
                if (data.currentPage == i) {
                    pagenav += "<li class='active'>";
                } else {
                    pagenav += "<li>";
                }
                pagenav += "<a onclick=getStudentPageDataAndParse(" + i + paramStr + ")>" + i + "</a></li>";
                $(".page-nav .pagination").append(pagenav);
            }

            var nextPage = "<li><span aria-hidden='true' onclick=getStudentPageDataAndParse(" + parseInt(data.currentPage + 1) + paramStr + ")>&raquo;</span></li>";
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

function refreshCurrentPage() {
    var currentPage = $(".pagination .active a").text();
    if (currentPage == "") {
        currentPage = 1;
    }
    getStudentPageDataAndParse(currentPage);
}

/**
 * @author: shixing
 * @since : 1.0.0
 */
function getStudentData(url, data, callback) {
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