<%@page language="java" contentType="text/html; charset=utf-8" %>
</<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>学生登录主页</title>
  <link href="${cacheUrl}/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<div  style="margin-top: 3%">

      <div class="container-fluid">
        <!-- 页面内容 -->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">操作</h3>
          </div>
          <div class="panel-body">
            <div class="col-md-2">

              <div class="btn-group">
                <button class="btn project-info btn-default btn-lg md-high dropdown-toggle" type="button"
                        data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"
                        style="line-height: 0.8">
                  <span class="select-name">查询条件</span><span class="caret"></span>
                </button>
                <ul class="dropdown-menu project-info-select">
                  <li><a>无条件</a></li>
                  <li><a>实验编号</a></li>
                  <li><a>教师姓名</a></li>
                  <li><a>实验主题</a></li>
                </ul>
              </div>

            </div>

              <div class="col-md-3">
                <input type="text" class="form-control project-info-input" required>
              </div>

              <div class="col-md-2">
                <button id="btn-project-search" class="btn btn-primary btn-lg" style="line-height: 0.8">
                  查询
                </button>
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
            <%--分页显示区--%>
            <nav class="page-nav">
              <ul class="pagination pagination-lg">
              </ul>
            </nav>
          </div>
          <div class="panel-footer">
            <div id="count" style="display: none;font-family: 微软雅黑;font-size: 16px;margin-right: 10px;text-align: right"></div>
          </div>
        </div>
      </div>
  <!--消息框-->
      <div id="msg-modal" class="message modal">
        <div class="msg-dialog modal-dialog">
          <%--<div class="modal-content">--%>
          <div class="message-body modal-body">

          </div>
          <%--</div>--%>
        </div>
      </div>

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


</body>
</html>
