<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HXY
  Date: 2016/5/31
  Time: 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生信息显示页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

</head>
<body>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-nd-10">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">${proname}</div>
            <table class="table .table-striped">
                <tr>
                    <th>序号</th>
                    <th>学生姓名</th>
                    <th>学院</th>
                    <th>分数</th>
                </tr>
                <c:forEach items="studentlisy" var="item" varStatus="i">
                    <tr>
                        <td>${i}</td>
                        <td>${item.name}</td>
                        <td>${item.academy}</td>
                        <td>${item.score}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="page panel-default">
            <div class="row">
                <div class="col-md-6">
                    <a><button class="btn btn-success">返回查询页面</button></a>
                </div>
                <div class="col-md-6" >
                    <a><button class="btn btn-success">下载成excel文件</button></a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-=1"></div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
