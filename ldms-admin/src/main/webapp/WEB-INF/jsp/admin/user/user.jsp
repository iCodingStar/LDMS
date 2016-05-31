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

    <title>用户管理中心</title>
</head>

<body>
<div id="wrapper">
    <!--消息框-->
    <div id="msg-modal" class="message modal">
        <div class="msg-dialog modal-dialog">
            <div class="modal-content">
                <div class="message-body modal-body">

                </div>
            </div>
        </div>
    </div>
    <!--主题内容-->
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- 页面内容 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">操作</h3>
                </div>
                <div class="panel-body">

                    <div class="col-md-3">
                        <input type="text" class="form-control search-input-username" placeholder="用户名">
                    </div>

                    <div class="col-md-2">
                        <div class="btn-group">
                            <button class="btn search-role btn-default btn-lg md-high dropdown-toggle" type="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <span class="select-name">用户角色</span><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu search-role-select">
                                <li><a>所有角色</a></li>
                                <li><a>学生</a></li>
                                <li><a>教师</a></li>
                                <li><a>管理员</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <button id="btn-search-user" type="button" class="btn btn-primary btn-lg">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            查询
                        </button>
                    </div>

                    <div class="col-md-1">
                        <button type="button" class="btn btn-primary btn-lg"
                                data-target="#add-user-modal-dialog" data-toggle="modal">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            添加用户
                        </button>
                    </div>

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">用户列表</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>角色</th>
                            <th>操作</th>
                        </tr>
                    </table>

                    <nav class="page-nav">
                        <ul id="user" class="pagination pagination-lg">
                        </ul>
                    </nav>
                </div>
            </div>

            <!--添加用户-->
            <div class="modal fade" id="add-user-modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">添加用户</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" class="form-username form-control"
                                       placeholder="用户名"
                                       maxlength="11"
                                       required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-password form-control"
                                       placeholder="密码"
                                       maxlength="11"
                                       required>
                            </div>

                            <div class="dropdown form-item">
                                <button class="btn single-size dropdown-toggle" type="button" id="roleDropdownMenu1"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <span class="select-name">请选择角色</span>
                                    <span class="caret"></span>
                                </button>
                                <div class="dropdown-menu select-role single-width" aria-labelledby="roleDropdownMenu1">
                                    <li><a>学生</a></li>
                                    <li><a>教师</a></li>
                                    <li><a>管理员</a></li>
                                </div>
                            </div>
                            <button class="btn btn-single add-user-submit">添加用户</button>
                        </div>
                    </div>
                </div>
            </div>


            <!--修改用户-->
            <div class="modal fade" id="modify-user-modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">修改用户</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" class="form-username form-control">
                            </div>

                            <div class="dropdown form-item">
                                <button class="btn single-size dropdown-toggle" type="button" id="roleDropdownMenu2"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <span class="select-name">请选择角色</span>
                                    <span class="caret"></span>
                                </button>
                                <div class="dropdown-menu select-role single-width" aria-labelledby="roleDropdownMenu1">
                                    <li><a>学生</a></li>
                                    <li><a>教师</a></li>
                                    <li><a>管理员</a></li>
                                </div>
                            </div>

                            <button class="btn modify-user-submit btn-single">确认修改</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--删除确认-->
            <div id="delete-user-modal-dialog" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">删除警告</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-item">
                                <h4>确认删除用户<span class="delete-username"></span>？</h4>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn delete-user-submit btn-primary btn-double">确认</button>
                            <button class="btn btn-default btn-double" data-target="#delete-user-modal-dialog"
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
