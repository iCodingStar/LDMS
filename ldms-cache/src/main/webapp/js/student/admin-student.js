
$(function () {
    //选择特定的按钮
    $(".project-info-select li a,.project-state-select li a,.dropdown-menu span.label").on('click', function () {
        $(this).parents(".dropdown-menu").prev(".dropdown-toggle").find(".select-name").text($(this).text());
    });

    //根据输入查询条件和查询值进行查询已发布的实验
    $("#btn-project-search").on('click', function () {

        //获取查询条件
        var search_condition = $(".project-info .select-name").text();
        var search_value = $(".project-info-input").val();
        var pro_id, tea_name, pro_name;

        if (search_condition == "实验编号") {
            pro_id = search_value;
        } else if (search_condition == "教师姓名") {
            tea_name = search_value;
        } else if (search_condition == "实验主题") {
            pro_name = search_value;
        } else {
            pro_id = null;
            tea_name = null;
            pro_name = null;
        }

        //根据实验编号(pro_id),教师姓名(tea_name),实验主题(pro_name)进行综合查询
        getProPageDataAndParse(0, pro_id, tea_name, pro_name);
    });

    //根据输入查询条件和查询值进行查询已预约的实验【成绩】
    $("#btn-order-project-search").on('click', function () {

        //获取查询条件
        var search_condition = $(".project-info .select-name").text();
        var search_value = $(".project-info-input").val();
        var pro_id, tea_name, pro_name;

        if (search_condition == "实验编号") {
            pro_id = search_value;
        } else if (search_condition == "教师姓名") {
            tea_name = search_value;
        } else if (search_condition == "实验主题") {
            pro_name = search_value;
        } else {
            pro_id = null;
            tea_name = null;
            pro_name = null;
        }

        //根据实验编号(pro_id),教师姓名(tea_name),实验主题(pro_name)进行综合查询
        getOrderProPageDataAndParse(0, pro_id, tea_name, pro_name);
    });

    //根据输入查询条件和查询值进行查询已预约的实验【记录】
    $("#btn-order-record-project-search").on('click', function () {

        //获取查询条件
        var search_condition = $(".project-info .select-name").text();
        var search_value = $(".project-info-input").val();
        var pro_id, tea_name, pro_name;

        if (search_condition == "实验编号") {
            pro_id = search_value;
        } else if (search_condition == "教师姓名") {
            tea_name = search_value;
        } else if (search_condition == "实验主题") {
            pro_name = search_value;
        } else {
            pro_id = null;
            tea_name = null;
            pro_name = null;
        }

        //根据实验编号(pro_id),教师姓名(tea_name),实验主题(pro_name)进行综合查询
        getRecordOrderProPageDataAndParse(0, pro_id, tea_name, pro_name);
    });

    //框架左侧搜索框
    $("#search-btn").on('click', function () {
        showMsg("暂未实现",2);
    });

    //更新密码
    $("#update-student-password").on("click",function () {
        var oldPwd = $("#oldPwd").val();
        var newPwd = $("#newPwd").val();
        var new2Pwd = $("#new2Pwd").val();
        alert(oldPwd+"--"+newPwd+"--"+new2Pwd);
        if(oldPwd=="" ||newPwd==""||new2Pwd==""){
            alert("null");
            showMsg("输入不能为空!",1);
            return;
        }
        if(newPwd != new2Pwd){
            showMsg("两次输入密码不一致！",1);
            return;
        }
        $.ajax({
        url: "/student/updatePwd",
        method: "POST",
        data:{
            "oldPwd":oldPwd,
            "newPwd":newPwd
        },
        success: function (data) {
            console.log(data);
            if(data=='1')
                showMsg("修改成功！",0);
            else
                showMsg("原密码错误！",1);
        },
        error: function () {
            alert("ajax-error");
        }
    });

    })
});


// function queryproject() {
//
//     $(".project-info-table tr:not(:first)").remove();
//     var data=$("#search_value").val();
//     $.ajax({
//         url: "/student/queryproject",
//         method: "get",
//         data:{search_value:data},
//         success: function (data) {
//             appenddata(data);
//         },
//         error: function () {
//             alert("ajax-error");
//         }
//     });
// }

// function appenddata(data) {
//     $.each(data, function (index, item) {
//         var node = "<tr>"
//             + "<td>" + item.id + "</td>"
//             +"<td>"+item.teacherName+"</td>"
//             +"<td>"+item.labName+"</td>"
//             +"<td>"+item.name+"</td>"
//             +"<td>"+(new Date(item.startTime)).Format("yyyy-MM-dd")+"</td>"
//             +"<td>"+(new Date(item.endTime)).Format("yyyy-MM-dd")+"</td>"
//             +"<td>"+item.capacity+"</td>"
//             +"<td>"+item.leftCapacity+"</td>"
//             +"<td><button type='button' class='btn btn-primary btn-sm'>"
//             + "预约"
//             + "</button>"
//             + "</td>"
//             + "</tr>";
//
//         $(".project-info-table").append(node);
//     })};
//////

//获取数据
function getData(url, data, callback) {
    $.ajax({
        method: 'POST',
        url: url,
        data: data,
        success: function (response) {
            // console.log(data);
            callback(response);
        },
        error: function () {
            alert("No!");
        },
        dataType: "json"//预期服务器返回数据类型
    });
}

//获取已发布的实验的分页数据并解析
function getProPageDataAndParse(page, pro_id, tea_name, pro_name) {
    if (page < 0) return;
    //从服务器获取数据并显示
    alert(page+"--"+pro_id+"--"+tea_name+"--"+pro_name);
    getData("/student/queryproject/page",
        {
            "page": page,
            "id": pro_id,
            "teacherName": tea_name,
            "name": pro_name
        },
        function (data){
            // alert("here");
            //移除非表头栏的所有条目
            $(".project-info-table tr:not(:first)").remove();
            //遍历json数据，将数据显示出来
            $.each(data.data, function (index, item) {
               console.log(item);
                var node = "<tr>"
                    + "<td>" + item.id + "</td>"
                    +"<td>"+item.teacherName+"</td>"
                    +"<td>"+item.labName+"</td>"
                    +"<td>"+item.name+"</td>"
                    +"<td>"+(new Date(item.startTime)).Format("yyyy-MM-dd")+"</td>"
                    +"<td>"+(new Date(item.endTime)).Format("yyyy-MM-dd")+"</td>"
                    +"<td>"+item.capacity+"</td>"
                    +"<td>"+item.leftCapacity+"</td>"
                    +"<td><button type='button' class='btn btn-primary btn-sm show-project-btn'>"
                    + "预约"
                    + "</button>"
                    + "</td>"
                    + "</tr>";

                $(".project-info-table").append(node);
                document.getElementById("count").style.display="";
                document.getElementById("count").innerHTML="总记录数："+data.totalRecords;
            });

            //预约按钮事件绑定
            $(".show-project-btn").on('click', function () {
                // 获取id值
                var data = $(this).parent().siblings().eq(0).text();
                $.ajax({
                url: "/student/queryproject/orderbyid",
                method: "get",
                data:{pro_id:data},
                success: function (data) {
                    showMsg("预约成功！",0);
                },
                error: function () {
                    showMsg("ajax-error！",1);
                }
            });
            }
            );


            //移除上一次分页结果
            $(".page-nav .pagination li").remove();
            var totalPages = data.totalPages;
            var currentPage = data.currentPage;

            if (totalPages > 1) {
                var parameter = "," + pro_id + "," + tea_name + "," + pro_name ;
                var prevPage = "<li><span aria-hidden='true' onclick= getProPageDataAndParse(" + (currentPage-1) + parameter + ") >&laquo;</span></li>";
                $(".page-nav .pagination").append(prevPage);
                currentPage

                for (var i = data.startPage; i <= data.endPage; i++) {
                    var pagenav = "";
                    if (data.currentPage == i) {
                        pagenav += "<li class='active'>";
                    } else {
                        pagenav += "<li>";
                    }
                    pagenav += "<a onclick=getProPageDataAndParse(" + i + parameter + ")>" + i + "</a></li>";
                    $(".page-nav .pagination").append(pagenav);
                }

                var nextPage = "<li><span aria-hidden='true' onclick=getProPageDataAndParse(" + (currentPage+1) + parameter + ")>&raquo;</span></li>";

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

//获取已预约的实验的分页数据[项目编号，教师名称，实验名称，成绩]并解析
function getOrderProPageDataAndParse(page, pro_id, tea_name, pro_name) {
    if (page < 0) return;
    //从服务器获取数据并显示
    alert(page+"--"+pro_id+"--"+tea_name+"--"+pro_name);
    getData("/student/queryorderproject/page",
        {
            "page": page,
            "proId": pro_id,
            "teacherName": tea_name,
            "proName": pro_name
        },
        function (data){
            // alert("here");
            //移除非表头栏的所有条目
            $(".order-project-info-table tr:not(:first)").remove();
            //遍历json数据，将数据显示出来
            $.each(data.data, function (index, item) {
                console.log(item);
                var node = "<tr>"
                    + "<td>" + item.proId + "</td>"
                    +"<td>"+item.teacherName+"</td>"
                    +"<td>"+item.proName+"</td>"
                    +"<td>"+item.score+"</td>"
                    + "</tr>";

                $(".order-project-info-table").append(node);
                document.getElementById("score-count").style.display="";
                document.getElementById("score-count").innerHTML="总记录数："+data.totalRecords;
            });

            //移除上一次分页结果
            $(".page-nav .pagination li").remove();
            var totalPages = data.totalPages;
            var currentPage = data.currentPage;

            if (totalPages > 1) {
                var parameter = "," + pro_id + "," + tea_name + "," + pro_name ;
                var prevPage = "<li><span aria-hidden='true' onclick= getOrderProPageDataAndParse(" + (currentPage-1) + parameter + ") >&laquo;</span></li>";
                $(".page-nav .pagination").append(prevPage);
                // currentPage

                for (var i = data.startPage; i <= data.endPage; i++) {
                    var pagenav = "";
                    if (data.currentPage == i) {
                        pagenav += "<li class='active'>";
                    } else {
                        pagenav += "<li>";
                    }
                    pagenav += "<a onclick=getOrderProPageDataAndParse(" + i + parameter + ")>" + i + "</a></li>";
                    $(".page-nav .pagination").append(pagenav);
                }

                var nextPage = "<li><span aria-hidden='true' onclick=getOrderProPageDataAndParse(" + (currentPage+1) + parameter + ")>&raquo;</span></li>";

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

//获取已预约的实验的分页数据并解析[实验编号,授课教师,	实验名称,开始时间,结束时间]
function getRecordOrderProPageDataAndParse(page, pro_id, tea_name, pro_name) {
    if (page < 0) return;
    //从服务器获取数据并显示
    alert(page+"--"+pro_id+"--"+tea_name+"--"+pro_name);
    getData("/student/queryorderrecordproject/page",
        {
            "page": page,
            "proId": pro_id,
            "teacherName": tea_name,
            "proName": pro_name
        },
        function (data){
            // alert("here");
            //移除非表头栏的所有条目
            $(".record-order-project-info-table tr:not(:first)").remove();
            //遍历json数据，将数据显示出来
            $.each(data.data, function (index, item) {
                console.log(item);
                var node = "<tr>"
                    + "<td>" + item.proId + "</td>"
                    +"<td>"+item.teacherName+"</td>"
                    +"<td>"+item.proName+"</td>"
                    +"<td>"+item.startTime+"</td>"
                    +"<td>"+item.endTime+"</td>"
                    +"<td><button type='button' class='btn btn-primary btn-sm download-files'>"
                    +"资料下载"
                    +"</button></td>"
                    +"<td><button type='button' class='btn btn-primary btn-sm delete-order-btn'>"
                    +"退选"
                    +"</button></td>"
                    + "</tr>";

                $(".record-order-project-info-table").append(node);
                document.getElementById("order-record-count").style.display="";
                document.getElementById("order-record-count").innerHTML="总记录数："+data.totalRecords;
            });

            //[退选]按钮事件绑定
            $(".delete-order-btn").on('click', function () {
                    var data = $(this).parent().siblings().eq(0).text();
                    $.ajax({
                        url: "/student/queryorderproject/deleteorderbyid",
                        method: "get",
                        data:{proId:data},
                        success: function (data) {
                            alert("返回的数据"+data);
                            if(data=='1')
                                showMsg("退选成功！",0);
                            else
                                showMsg("实验已经开始，不能退选！",1);
                        },
                        error: function () {
                            showMsg("ajax-error！",1);
                        }
                    });
                }
            );

            //[资料下载]按钮事件绑定
            $(".download-files").on('click', function () {
                   showMsg("该项功能正在建设中...",2);
                }
            );

            //移除上一次分页结果
            $(".page-nav .pagination li").remove();
            var totalPages = data.totalPages;
            var currentPage = data.currentPage;

            if (totalPages > 1) {
                var parameter = "," + pro_id + "," + tea_name + "," + pro_name ;
                var prevPage = "<li><span aria-hidden='true' onclick= getRecordOrderProPageDataAndParse(" + (currentPage-1) + parameter + ") >&laquo;</span></li>";
                $(".page-nav .pagination").append(prevPage);
                // currentPage

                for (var i = data.startPage; i <= data.endPage; i++) {
                    var pagenav = "";
                    if (data.currentPage == i) {
                        pagenav += "<li class='active'>";
                    } else {
                        pagenav += "<li>";
                    }
                    pagenav += "<a onclick=getRecordOrderProPageDataAndParse(" + i + parameter + ")>" + i + "</a></li>";
                    $(".page-nav .pagination").append(pagenav);
                }

                var nextPage = "<li><span aria-hidden='true' onclick=getRecordOrderProPageDataAndParse(" + (currentPage+1) + parameter + ")>&raquo;</span></li>";

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

