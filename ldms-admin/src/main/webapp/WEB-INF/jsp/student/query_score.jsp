<%--
  Created by IntelliJ IDEA.
  User: PP
  Date: 2016/5/28
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询成绩</title>
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
                            <span class="select-name">教师姓名</span><span class="caret"></span>
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
                    <input type="text" class="form-control project-info-input" required placeholder="张剑波">
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
                <h3 class="panel-title">已预约实验列表</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover project-info-table">
                    <tr>
                        <td>实验编号</td>
                        <td>授课教师</td>
                        <td>实验名称</td>
                        <td>成绩</td>
                    </tr>
                    <tr>
                        <td>P1605001</td>
                        <td>张剑波</td>
                        <td>数据结构综合实习</td>
                        <td>80</td>
                    </tr>
                    <tr>
                        <td>P1605112</td>
                        <td>张剑波</td>
                        <td>数据库综合实习</td>
                        <td>91</td>
                    </tr>
                    </table>
                </div>
        </div>
    </div>

</div>
</body>
</html>
