<%--
  User: star
  Date: 2016/5/22
  Time: 1:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE 兼容-->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--自适应:移动设备优先-->

    <title>设备管理中心</title>
</head>

<body>
<div id="wrapper">
    <!--消息框-->
    <div id="msg-modal" class="message modal">
        <div class="msg-dialog modal-dialog">
            <div class="modal-content">

            </div>
            <div class="message-body modal-body">

            </div>
        </div>
    </div>
    <!--主题内容-->
    <div id="page-wrapper">
        <div class="container-fluid">

            <!-- 头部内容 -->
            <div class="panel panel-default">

                <div class="panel-heading"  id="panel-heading">
                    <h3 class="panel-title">设备管理</h3>
                </div>

                <div class="panel-body">
                    <div class="col-md-4">
                        <input type="text" class="form-control search-device-input" placeholder="输入选择信息">
                    </div>

                    <div class="col-md-3">
                        <div class="btn-group">
                            <button class="btn search-device-info btn-default btn-lg md-high dropdown-toggle" type="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <span class="select-name">设备信息</span><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu search-role-select">
                                <li><a href="#">无筛选</a></li>
                                <li><a>设备编号</a></li>
                                <li><a>设备名称</a></li>
                            </ul>
                        </div>
                    </div>


                    <div class="col-md-3">
                        <button id="btn-student-search" type="button" class="btn btn-primary btn-lg">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            查询
                        </button>
                    </div>

                </div>
            </div>

            <!--显示设备列表-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">设备列表</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>实验室</th>
                            <th>设备类型</th>
                            <th>学科</th>
                            <th>设备数量</th>
                            <th>设备余量</th>
                            <th>操作</th>
                        </tr>
                    </table>

                    <nav class="page-nav">
                        <ul id="device" class="pagination pagination-lg">
                        </ul>
                    </nav>

                </div>
            </div>

            <!--添加设备-->
            <div class="modal fade" id="add-device-modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">添加设备</h4>
                        </div>

                        <div class="modal-body">

                            <div class="form-group">
                                <input type="text" class="form-id form-control"
                                       placeholder="学号/工号"
                                       maxlength="11"
                                       required>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-password form-control"
                                       placeholder="请输入密码"
                                       maxlength="11"
                                       required>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-password-confirm form-control"
                                       placeholder="请重复输入密码"
                                       maxlength="11"
                                       required>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-name form-control" placeholder="姓名">
                            </div>

                            <div class="form-item">
                                <div class="btn-group single-width" role="group">
                                    <button type="button" class="enable btn btn-triple">性别：</button>
                                    <button type="button" class="btn btn-triple btn-state">男</button>
                                    <button type="button" class="btn btn-triple btn-state">女</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-major form-control" placeholder="信息工程学院" disabled>
                            </div>

                            <div class="dropdown form-item">

                                <button class="btn  select-major single-size dropdown-toggle" type="button" id="roleDropdownMenuMajor"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <span class="select-name">请选择专业</span>
                                    <span class="caret"></span>
                                </button>

                                <div id="select-major" class="dropdown-menu select-role single-width" aria-labelledby="roleDropdownMenuMajor">
                                    <li><a>软件工程</a></li>
                                    <li><a>遥感科学与技术</a></li>
                                    <li><a>地理信息科学</a></li>
                                    <li><a>测绘科学技术</a></li>
                                    <li><a>信息工程</a></li>
                                </div>
                            </div>

                            <div class="dropdown form-item">

                                <button class="btn single-size dropdown-toggle" type="button" id="roleDropdownMenuClass"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <span class="select-name select-class">请选择班级</span>
                                    <span class="caret"></span>
                                </button>

                                <div id="select-class" class="dropdown-menu select-role single-width" aria-labelledby="roleDropdownMenuClass">
                                    <ul>
                                        <li><a>111131</a></li>
                                        <li><a>111132</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-classId form-control" placeholder="班级">
                            </div>

                            <div class="dropdown form-item">

                                <button class="btn single-size dropdown-toggle" type="button" id="roleDropdownMenu1"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <span class="select-name select-auth">请选择角色</span>
                                    <span class="caret"></span>
                                </button>

                                <div class="dropdown-menu select-role single-width" aria-labelledby="roleDropdownMenu1">
                                    <li><a>学生</a></li>
                                    <li><a>教师</a></li>
                                </div>
                            </div>

                            <button class="btn btn-single add-user-submit">添加用户</button>
                        </div>
                    </div>
                </div>
            </div>


            <!--显示详细设备信息-->
            <div class="modal fade device" id="show-device-modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"><span class="device-id" style="color:dimgrey;font-size: 20px"></span>--设备详情</h4>
                        </div>

                        <div class="modal-body">

                            <div class="form-group">
                                <input type="text" class="form-control">
                            </div>

                            <button class="btn show-device-back btn-single">返回</button>

                        </div>
                    </div>
                </div>
            </div>

            <!--删除确认-->
            <div id="delete-device-modal-dialog" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">删除警告</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-item">
                                <h4>确认删除设备<span class="delete-device" style="font-size: 24px;color: red;"></span>？</h4>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn delete-device-submit btn-primary btn-double">确认</button>
                            <button class="btn btn-default btn-double" data-target="#delete-device-modal-dialog"
                                    data-toggle="modal">取消
                            </button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
</div>
</body>
</html>
