<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.cug.laboratory.model.persistent.Device" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.cug.laboratory.model.persistent.User" %>
<%@ page import="cn.cug.laboratory.model.persistent.Teacher" %>
<%@page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

</head>
<body>
<%
     SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
%>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
    <div class="panel panel-info" style="margin-top: 10%">
        <div class="panel-heading">实验申请信息核对</div>
        <div class="panel-body">
            <table class="table table-striped">
                <thead>
                <th>
                    <tr>
                        <td><strong>属性</strong></td>
                        <td><strong>信息</strong></td>
                    </tr>
                </th>
                </thead>
                <tbody>
                <tr>
                    <td>申请人</td>
                    <td><%=((Teacher)session.getAttribute("teacher")).getName()%></td>
                </tr>
                <tr>
                    <td>申请时间</td>
                    <td><%=df.format(new Date())%></td>
                </tr>
                <tr>
                    <td>实验室</td>
                    <td>${sessionScope.applyprojectinfo.labId}</td>
                </tr>
                <tr>
                    <td>学分</td>
                    <td>${sessionScope.applyprojectinfo.credit}</td>
                </tr>
                <tr>
                    <td>容量</td>
                    <td>${sessionScope.applyprojectinfo.capacity}</td>
                </tr>
                <tr>
                    <td>实验开始时间</td>
                    <td>${sessionScope.applyprojectinfo.startTime}</td>
                </tr>
                <tr>
                    <td>实验结束时间</td>
                    <td>${sessionScope.applyprojectinfo.endTime}</td>
                </tr>
                </tbody>
            </table>
            <div class="panel-group" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingtne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" aria-expanded="true" aria-controls="collapseOne">
                                备注信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapsetwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <textarea style="height: 200px" class="form-control" type="" id="decp" placeholder="备注信息">${sessionScope.applyprojectinfo.description}</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                实验所申请的设备信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed">
                                <thead>
                                    <tr>
                                        <td>编号</td>
                                        <td>设备名称</td>
                                        <td>设备型号</td>
                                        <td>借用数量</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<String> num=(List<String>)session.getAttribute("num");
                                    List<Device> devicelist=(List<Device>)session.getAttribute("devicelist");
                                %>
                                <%
                                    for (int i = 0; i < devicelist.size(); i++) {
                                        %>

                                        <tr>
                                            <td><%=i%></td>
                                            <td><%=devicelist.get(i).getName()%></td>
                                            <td><%=devicelist.get(i).getModelId()%></td>
                                            <td><%=num.get(i)%></td>
                                        </tr><%
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-8">
                    <form action="/jump/applyproject2">
                        <input style="margin-left: 60%" type="submit" class="btn btn-primary btn-lg" value="修改">
                    </form>
                </div>
                <div class="col-md-4">
                    <form action="/teacher/confirmapply">
                        <input style="margin-left: 40%" type="submit" class="btn btn-primary btn-lg" value="提交">
                    </form>
                </div>
            </div>


        </div>

    </div>
</div>
<div class="col-md-3"></div>
</div>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

<script>
</script>
</html>
