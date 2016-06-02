$(function () {
    getDevicePageDataAndParse(1);

    $(".dropdown-menu li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $("#btn-student-search").on('click', function () {
        var input_info = $(".search-device-input").val();
        var choose_info = $(".search-device-info .select-name").text();

        console.log(input_info + ":" + choose_info);

        var id, name, major, classId, academy;
        if (choose_info == "设备编号") {
            id = input_info;
        }
        if (choose_info == "设备名称") {
            name = input_info;
        }

        getDevicePageDataAndParse(1, id, name);
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
        getDeviceData("/admin/student/update", {
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
    $(".show-device-submit").on('click', function () {
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


        getDeviceData("/admin/student/query/page", {
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
                $("#show-device-modal-dialog .modal-body").children().eq(0).before('<div class="alert alert-danger" role="alert">修改信息出现错误,请重试！</div>');
            }
        });
    });

    $(".delete-device-submit").on('click', function () {
        var id = $("#delete-device-modal-dialog .delete-device").text();

        if (id == null) {
            return;
        }
        alert(id)
        console.log(id)

        getDeviceData("/admin/device/delete/id", {
            id: id
        }, function (result) {
            if (result == 'success') {
                showMsg("删除设备{" + id + "}成功!", 0, refreshCurrentPage);
            } else {
                showMsg("删除设备{" + id + "}失败，请稍候重试!", 1);
            }
        });

    });

});

function getDevicePageDataAndParse(page, id, name) {
    if (page < 0) return;
    getDeviceData("/admin/device/query/page", {
        page: page,
        id: id,
        name: name,
    }, function (data) {

        $(".table tr:not(:first)").remove();
        if (data == null) {
            return;
        }

        $.each(data.data, function (index, item) {
            var node = "<tr>"
                + "<td>" + item.id + "</td>"
                + "<td>" + item.name + "</td>"
                + "<td>" + item.labName + "</td>"
                + "<td>" + item.deviceTypeName + "</td>"
                + "<td>" + item.subjectName + "</td>"
                + "<td>" + item.amount + "</td>"
                + "<td>" + item.amountUsed + "</td>";

            node += "<td><button type='button' class='btn btn-primary btn-sm show-device-btn'"
                + "data-target='#show-device-modal-dialog' data-toggle='modal'>查看详情"
                + "</button>"
                + "<button type='button' class='btn btn-primary btn-sm delete-device-btn'"
                + "data-target='#delete-device-modal-dialog'"
                + "data-toggle='modal'>删除"
                + "</button>"
                + "</td>"
                + "</tr>";
            $(".table").append(node);
        });

        //按钮事件绑定:将当前表格数据显示到打开的模态框
        $(".show-device-btn").on('click', function () {
            var id = $(this).parent().siblings().eq(0).text();
            $("#show-device-modal-dialog").find(".device-id").text(id);
            
        });

        $(".delete-device-btn").on('click', function () {
            var id = $(this).parent().siblings().eq(0).text();
            console.log(id);
            $(".delete-device").text(id);
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

            var prevPage = "<li><span aria-hidden='true' onclick=getDevicePageDataAndParse(" + parseInt(data.currentPage - 1) + paramStr + ")>&laquo;</span></li>";
            $(".page-nav .pagination").append(prevPage);

            for (var i = data.startPage; i <= data.endPage; i++) {
                var pagenav = "";
                if (data.currentPage == i) {
                    pagenav += "<li class='active'>";
                } else {
                    pagenav += "<li>";
                }
                pagenav += "<a onclick=getDevicePageDataAndParse(" + i + paramStr + ")>" + i + "</a></li>";
                $(".page-nav .pagination").append(pagenav);
            }

            var nextPage = "<li><span aria-hidden='true' onclick=getDevicePageDataAndParse(" + parseInt(data.currentPage + 1) + paramStr + ")>&raquo;</span></li>";
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
    getDevicePageDataAndParse(currentPage);
}

/**
 * @author: shixing
 * @since : 1.0.0
 */
function getDeviceData(url, data, callback) {
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