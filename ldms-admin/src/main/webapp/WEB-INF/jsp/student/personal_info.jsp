<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.cug.laboratory.service.StudentService" %>
<%@ page import="cn.cug.laboratory.model.persistent.Student" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="cn.cug.laboratory.service.impl.StudentServiceImpl" %>
<%@ page import="cn.cug.laboratory.model.persistent.User" %><%--
  Created by IntelliJ IDEA.
  User: PP
  Date: 2016/5/28
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看个人信息</title>
    <link href="${cacheUrl}/css/messenger.css" rel="stylesheet" />
    <link href="${cacheUrl}/css/messenger-theme-future.css" rel="stylesheet" />
    <script src="${cacheUrl}/js/messenger.js"></script>

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

<script type="text/javascript">
    $._messengerDefaults = {
        extraClasses: 'messenger-fixed messenger-theme-future messenger-on-bottom messenger-on-right'
    }
</script>

<div class="row" style="margin-top: 3%">
    <div class="col-md-2"></div>
    <div class="col-md-8">

        <div id="page-wrapper">

            <div class="container-fluid">
                <!-- 页面内容 -->

                <div class="row">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">个人信息</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="table table-striped ">
                                        <tr>
                                            <td>姓名</td>
                                            <td>
                                                ${student.name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>学号</td>
                                            <td>
                                                ${student.id}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>性别</td>
                                            <td>
                                                ${student.sex}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>专业</td>
                                            <td>
                                                ${student.major}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>班级</td>
                                            <td>
                                                ${student.classId}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>学院</td>
                                            <td>
                                                ${student.academy}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label  class="control-label" style="font-size: 21px">原密码</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <input type="password" id="oldPwd" class="form-control" style="width: 161px" placeholder="请输入原始密码">
                                                </div>
                                            </div><br>
                                            <div class="row">
                                            <div class="col-md-3">
                                                <label  class="control-label" style="font-size: 21px">新密码</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="password" id="newPwd" class="form-control" style="width: 161px" placeholder="请输入新密码">
                                            </div>
                                            </div><br>
                                            <div class="row">
                                            <div class="col-md-3">
                                                <label  class="control-label" style="font-size: 21px">新密码</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="password" id="new2Pwd" class="form-control" style="width: 161px" placeholder="请再次输入新密码">
                                            </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="checkPwd()">确认</button>
                                    </form>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>

        </div>

    </div>
</div>


<script>
    function checkPwd() {
        if(document.getElementById("newPwd")!=document.getElementById("new2Pwd")) {
            alert("hello");
            $.globalMessenger().post({
                message: "操作成功",//提示信息
                type: 'info',//消息类型。error、info、success
            });
        }
    }
</script>


</body>
</html>
