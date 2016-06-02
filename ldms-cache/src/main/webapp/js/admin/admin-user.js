$(function () {

    getUserPageDataAndParse(1, null, null);

    $(".dropdown-menu li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $(".btn-state:first").addClass("btn-active");
    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:查询用户
     */
    $("#btn-search-user").on('click', function () {
        var username = $(".search-input-username").val();
        var rolename = $(".search-role .select-name").text();

        if (rolename == "用户角色" || rolename == "所有角色") {
            rolename = "";
        }

        getUserPageDataAndParse(1, username, rolename);
    });

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:添加用户时，根据选择专业动态显示相应的班级
     */
    $("#add-user-modal-dialog #select-major").on("click", function () {
        //复原提示信息
        $(".select-class").text("请选择班级");

        //移除先前所有的班级信息
        $("#add-user-modal-dialog #select-class li").remove();

        //获取专业信息
        var major = $("#add-user-modal-dialog .select-major").text();

        //根据对应的专业动态添加相应的班级信息
        if (major == "软件工程") {
            var data = new Array();
            data[0] = "111131";
            data[1] = "111132";
            addClassInfo(data)
        } else if (major == "遥感科学技术") {
            var data = new Array();
            data[0] = "113131";
            data[1] = "113132";
            addClassInfo(data)
        } else if (major == "地理信息科学") {
            var data = new Array();
            data[0] = "114131";
            data[1] = "114132";
            data[2] = "114133";
            addClassInfo(data)
        } else if (major == "测绘科学技术") {
            var data = new Array();
            data[0] = "115131";
            data[1] = "115132";
            data[2] = "115133";
            addClassInfo(data)
        } else if (major == "信息工程") {
            var data = new Array();
            data[0] = "116131";
            data[1] = "116132";
            addClassInfo(data)
        }
    });


    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:添加具体班级信息
     */
    function addClassInfo(data) {
        //获取班级节点
        var select_class = $("#add-user-modal-dialog #select-class");
        //移除先前所有的班级信息
        $("#add-user-modal-dialog #select-class li").remove();

        console.log(data);

        for (var temp in data) {
            select_class.append("<li ><a onclick=choseClassId()>" + data[temp] + "</a></li>")
        }
    }


    $(".add-user-submit").on('click', function () {
        $(".modal-body .alert").remove();

        var id = $("#add-user-modal-dialog .form-id").val();
        var password = $("#add-user-modal-dialog .form-password").val();
        var password_confirm = $("#add-user-modal-dialog .form-password-confirm").val();
        var name = $("#add-user-modal-dialog .form-name").val();
        var sex = $("#add-user-modal-dialog .btn-active").text();
        var academy = $("#add-user-modal-dialog .form-academy").val();
        var major = $("#add-user-modal-dialog .select-major").text();
        var classId = $("#add-user-modal-dialog .select-class").text();
        var auth = $("#add-user-modal-dialog .select-auth").text();

        if (id == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入学号/工号！</div>');
            return;
        }
        if (password == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入密码！</div>');
            return;
        }
        if (password_confirm == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入确认密码！</div>');
            return;
        }
        if (password != password_confirm) {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">两次密码不一致！</div>');
            return;
        }
        if (name == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入名字！</div>');
            return;
        }
        if (sex == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请选择性别！</div>');
            return;
        }
        if (academy == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请填写学院！</div>');
            return;
        }
        if (major == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请填写专业！</div>');
            return;
        }
        if (classId == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入班级！</div>');
            return;
        }

        console.log( "id : " + id  + "password : " + password + "name : " + name + "sex : " + sex + "academy : " +academy + "major : " + major + "classId : " + classId);

        var btn_this = $(this);

        console.log(btn_this);

        getUserData("/admin/user/add", {
            id: id,
            password: password,
            classId: classId,
            name: name,
            sex: sex,
            major: major,
            academy: academy,
            auth: auth,
            username: id
        }, function (result) {
            if (result == 'success') {
                showMsg("添加用户成功!", 0, refreshCurrentPage);
            } else if (result == '-1') {
                btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">用户名已存在！</div>');
            } else if (result == '-2') {
                alert(result);
                btn_this.siblings().eq(0).before('<div class="alert alert-danger" role="alert">输入信息有误！</div>');
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

function choseClassId() {
    var that = this.event.target;//获取的
    console.log(that);
    $(".select-class").text(that.innerHTML);
}
/**
 * @author: shixing
 * @since : 1.0.0
 * @function:
 */

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
            var paramStr = "";
            if (username == null) {
                username = "";
            }
            if (rolename == null) {
                rolename = "";
            }
            paramStr += ",'" + username + "'";
            paramStr += ",'" + rolename + "'";

            var prevPage = "<li><span aria-hidden='true' onclick=getUserPageDataAndParse(" + parseInt(data.currentPage - 1) + paramStr + ")>&laquo;</span></li>";
            $(".page-nav #user").append(prevPage);

            for (var i = data.startPage; i < data.endPage; i++) {
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