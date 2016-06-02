$(function () {
    getTeacherPageDataAndParse(1);
    $(".dropdown-menu li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $("#btn-teacher-search").on('click', function () {
        var input_info = $(".search-teacher-input").val();
        var choose_info = $(".search-teacher-info .select-name").text();
        var sex = $(".search-teacher-sex .select-name").text() + "";

        var id, name, major, classId, academy;
        if (choose_info == "工号") {
            id = input_info;
        }
        if (choose_info == "姓名") {
            name = input_info;
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

        getTeacherPageDataAndParse(1, id, name, sex, major, academy);
    });


    $(".btn-state").on('click', function () {
        $(".btn-state.btn-active").removeClass("btn-active");
        $(this).addClass("btn-active");
    });

    $(".modify-user-submit").on('click', function () {
        var id = $(this).siblings().eq(0).find(".form-id").val().trim();
        var name = $(this).siblings().eq(1).find(".form-name").val().trim();
        var sex = $(this).siblings().eq(2).find(".btn-active").text().trim();
        var major = $(this).siblings().eq(3).find(".form-major").val().trim();
        var academy = $(this).siblings().eq(4).find(".form-academy").val().trim();

        $(".modal-body .alert").remove();

        if (id == "") {
            $(this).siblings().eq(0).before('<div class="alert alert-danger" role="alert">请输入工号！</div>');
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

        getTeacherData("/admin/teacher/update", {
            id: id,
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
        var id = $("#delete-user-modal-dialog .delete-teacher-id").text();
        if (id == null) {
            return;
        }
        getTeacherData("/admin/teacher/delete", {
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

function getTeacherPageDataAndParse(page, id, name, sex, major, academy) {
    if (page < 0) return;
    getTeacherData("/admin/teacher/query/page", {
        page: page,
        id: id,
        name: name,
        sex: sex,
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
        //按钮事件绑定
        $(".modify-user-btn").on('click', function () {
            var id = $(this).parent().siblings().eq(0).text();
            var name = $(this).parent().siblings().eq(1).text();
            var sex = $(this).parent().siblings().eq(2).text();
            var major = $(this).parent().siblings().eq(3).text();
            var academy = $(this).parent().siblings().eq(4).text();

            $("#modify-user-modal-dialog").find(".form-id").val(id);
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
            var username = $(this).parent().siblings().eq(1).text();
            $(".delete-teacher-id").text(id);
            $(".delete-teacher-name").text(username);
        });

        //分页
        $(".page-nav .pagination li").remove();
        if (data.totalPages > 1) {
            var paramStr = "";

            if (typeof(id) == "undefined") {
                id = "";
            }
            if (typeof(name) == "undefined") {
                name = "";
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

            paramStr = ",'" + id + "','" + name + "','"+ sex + "','"  + major + "','" + academy + "'";

            var prevPage = "<li><span aria-hidden='true' onclick=getTeacherPageDataAndParse(" + parseInt(data.currentPage - 1) + paramStr + ")>&laquo;</span></li>";
            $(".page-nav .pagination").append(prevPage);

            for (var i = data.startPage; i < data.endPage; i++) {
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