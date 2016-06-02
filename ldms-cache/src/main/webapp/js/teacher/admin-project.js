/**
 * Created by FengYang on 2016-05-12.
 */
function toLoginPage() {
    window.location = "../index.do";
}

$(function () {
    //选择特定的按钮
    $(".project-info-select li a,.project-state-select li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    $("#btn-search").on('click', function () {

        //获取查询条件
        var project_info = $(".project-info .select-name").text();
        var query_input = $(".project-info-input").val();
        var project_state = $(".project-state .select-name").text();

        //alert(project_info + "---" + project_state);

        var id, teacherName, name, state;

        if (project_info == "项目编号") {
            id = query_input;
        } else if (project_info == "申请人") {
            teacherName = query_input;
        } else if (project_info == "主题") {
            name = query_input;
        } else {
            id = null;
            teacherName = null;
            name = null;
        }

        if (project_state == "提交") {
            state = 0;
        } else if (project_state == "未审核") {
            state = 1;
        } else if (project_state == "已通过") {
            state = 2;
        } else if (project_state == "已拒绝") {
            state = 3;
        } else {
            state = null;
        }
        //根据项目编号(id),申请人(teacherName),主题(name),状态(state)进行综合查询
        getPageDataAndParse(0, id, teacherName, name, state);

    });
});


function getData(url, data, callback) {
    $.ajax({
        method: 'POST',
        url: url,
        data: data,
        success: function (response) {
            showMsg("服务器发生错误,操作失败!", 1);
            callback(response);
        },
        error: function () {
            showMsg("服务器发生错误,操作失败!", 1);
        },
        dataType: "json"//预期服务器返回数据类型
    });
}

function getPageDataAndParse(page, id, teacherName, name, state) {
    if (page < 0) return;
    //从服务器获取数据并显示
    getData("/admin/project/query/page",
        {
            "page": page,
            "id": id,
            "teacherName": teacherName,
            "name": name,
            "state": state
        },
        function (data) {
            //移除非表头栏的所有条目
            $(".project-info-table tr:not(:first)").remove();

            //遍历json数据，将数据显示出来
            $.each(data.data, function (index, item) {
                var node = "<tr>"
                    + "<td id='project_id'>" + item.id + "</td>"
                    + "<td>" + new Date(item.startTime).Format("yyyy-MM-dd") + "</td>"
                    + "<td>" + item.teacherName + "</td>"
                    + "<td>" + item.name + "</td>"
                    + "<td>";
                if (item.state == 0) {
                    node += "提交";
                } else if (item.state == 1) {
                    node += "未审核";
                } else if (item.state == 2) {
                    node += "已通过";
                } else if (item.state == 3) {
                    node += "已拒绝";
                }
                node += "</td>"
                    + "<td><button type='button' class='btn btn-primary btn-sm show-project-btn'"
                    + ">查看详情"
                    + "</button>"
                    + "</td>"
                    + "</tr>";

                $(".project-info-table").append(node);
            });


            //按钮事件绑定
            $(".show-project-btn").on('click', function () {
                // 获取id值
                var id = $(this).parent().siblings().eq(0).text();
                alert(id);
                getData("/admin/project/queryById", {id: id}, function (data) {
                    $("#teacherName").text(data.teacherName);
                    $("#submitTime").text(new Date(data.submitTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#labName").text(data.labName);
                    $("#credit").text(data.capacity);
                    $("#startTime").text(new Date(data.startTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#endTime").text(new Date(data.endTime).Format("yyyy-MM-dd hh:mm:ss"));
                    $("#files").text(data.files);
                    $("#show-project-modal-dialog").modal('show');
                });

            });

            //取消操作
            $(".project-cancel").on('click', function () {
                $("#show-project-modal-dialog").modal('hide')
            });

            //通过操作
            $(".project-pass").on('click', function () {
                $("#project-pass-modal-dialog").modal('show')
            });

            //拒绝操作
            $(".project-refuse").on('click', function () {
                $("#project-refuse-modal-dialog").modal('show')
            });

            //通过确认
            $(".project-pass").on('click', function () {
                $(".project-pass-submit").modal('show')
            });

            //拒绝确认
            $(".project-refuse").on('click', function () {
                $(".project-refuse-submit").modal('show')
            });

            //移除上一次分页结果
            $(".page-nav .pagination li").remove();
            var totalPages = data.totalPages;
            var currentPage = data.currentPage;

            if (totalPages > 1) {
                var parameter = "," + id + "," + teacherName + "," + name + "," + state;
                var prevPage = "<li><span aria-hidden='true' onclick= getPageDataAndParse(" + (currentPage-1) + parameter + ") >&laquo;</span></li>";
                $(".page-nav .pagination").append(prevPage);
                currentPage

                for (var i = data.startPage; i <= data.endPage; i++) {
                    var pagenav = "";
                    if (data.currentPage == i) {
                        pagenav += "<li class='active'>";
                    } else {
                        pagenav += "<li>";
                    }
                    pagenav += "<a onclick=getPageDataAndParse(" + i + parameter + ")>" + i + "</a></li>";
                    $(".page-nav .pagination").append(pagenav);
                }

                var nextPage = "<li><span aria-hidden='true' onclick=getPageDataAndParse(" + (currentPage+1) + parameter + ")>&raquo;</span></li>";

                $(".page-nav .pagination").append(nextPage);

                if (data.currentPage == 1) {
                    $(".page-nav .pagination li:first").remove();
                }
                if (data.currentPage == data.endPage || data.totalPages == 1) {
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
    getPageDataAndParse(currentPage);
}