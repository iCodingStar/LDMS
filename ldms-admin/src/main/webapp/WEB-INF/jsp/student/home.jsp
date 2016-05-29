<%@page language="java" contentType="text/html; charset=utf-8" %>
</<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>学生登录主页</title>
  <!-- 新 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <!-- 可选的Bootstrap主题文件（一般不用引入） -->
  <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
  <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</head>
<body>
<div class="row" style="margin-top: 3%">
  <div class="col-md-1"></div>
  <div class="col-md-10">

    <div id="page-wrapper">

      <div class="container-fluid">
        <!-- 页面内容 -->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">操作</h3>
          </div>
          <div class="panel-body">
            <div class="col-md-2">

              <div class="btn-group">
                <button class="btn search-state btn-default btn-lg md-high dropdown-toggle"
                        type="button"
                        data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"
                style="line-height: 0.8">
                  <span class="select-name" >查询条件</span>
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="#">实验编号</a></li>
                  <li><a href="#">教师姓名</a></li>
                  <li><a href="#">实验主题</a></li>
                </ul>
              </div>

            </div>

              <div class="col-md-3">
                <input type="text" id="search_value" class="form-control ">
              </div>

              <div class="col-md-2">
                <button id="btn-search" onclick="queryproject()" class="btn btn-primary btn-lg" style="line-height: 0.8">
                  查询
                </button>
                  <%--<span class="glyphicon glyphicon-search" aria-hidden="true" style="font-size: 23px">--%>

                  </span>
                </input>
              </div>

          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">发布实验列表</h3>
          </div>
          <div class="panel-body">
            <table class="table table-hover project-info-table">
              <tr>
                <td>实验编号</td>
                <td>授课教师</td>
                <td>实验室</td>
                <td>实验名称</td>
                <td>上课开始时间</td>
                <td>上课结束时间</td>
                <td>容量</td>
                <td>余量</td>
                <td></td>
              </tr>
            </table>
            <nav class="page-nav">
              <ul class="pagination pagination-lg">
              </ul>
            </nav>
          </div>
          <div class="panel-footer">
            <form class="form-inline">
              <%--<div class="form-group">--%>
                <%--<div class="input-group">--%>

                <div class="row">
                  <div class="col-md-8">
                    <nav>
                      <ul class="pagination pagination-lg">
                        <li>
                          <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                          </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                          <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                  <div class="col-md-4" >
                    <label style="font-size: 20px;padding-right:0px;margin-top: 28px">    总记录：3 条</label>
                  </div>
                </div>
                <%--</div>--%>
              <%--</div>--%>
            </form>
          </div>
        </div>


      </div>
      <!-- /.container-fluid -->
    </div>

  </div>
  <div class="col-md-1"></div>
</div>

<script>
  // 对Date的扩展，将 Date 转化为指定格式的String
  // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
  // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
  // 例子：
  // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
  // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
  Date.prototype.Format = function(fmt)
  { //author: meizz
    var o = {
      "M+" : this.getMonth()+1,                 //月份
      "d+" : this.getDate(),                    //日
      "h+" : this.getHours(),                   //小时
      "m+" : this.getMinutes(),                 //分
      "s+" : this.getSeconds(),                 //秒
      "q+" : Math.floor((this.getMonth()+3)/3), //季度
      "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
      fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
      if(new RegExp("("+ k +")").test(fmt))
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
  }
</script>
<script>
  function queryproject() {

    $(".project-info-table tr:not(:first)").remove();
    var data=$("#search_value").val();
    $.ajax({
      url: "/student/queryproject",
      method: "get",
      data:{search_value:data},
      success: function (data) {
        appenddata(data);
      },
      error: function () {
        alert("ajax-error");
      }
    });
  }

  function appenddata(data) {
  $.each(data, function (index, item) {
    var node = "<tr>"
            + "<td>" + item.id + "</td>"
            +"<td>"+item.teacherName+"</td>"
            +"<td>"+item.labName+"</td>"
            +"<td>"+item.name+"</td>"
            +"<td>"+(new Date(item.startTime)).Format("yyyy-MM-dd")+"</td>"
            +"<td>"+(new Date(item.endTime)).Format("yyyy-MM-dd")+"</td>"
            +"<td>"+item.capacity+"</td>"
            +"<td>"+item.leftCapacity+"</td>"
            +"<td><button type='button' class='btn btn-primary btn-sm'>"
            + "预约"
            + "</button>"
            + "</td>"
            + "</tr>";

  $(".project-info-table").append(node);
    })};
</script>


</body>
</html>
