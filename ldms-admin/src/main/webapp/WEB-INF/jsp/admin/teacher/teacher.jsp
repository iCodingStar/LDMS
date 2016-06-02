<%--
  User: star
  Date: 2016/5/22
  Time: 1:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>教师管理</title>

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

    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- 页面内容 -->
            <div class="panel panel-default">
                <div class="panel-heading" id="panel-heading">
                    <h3 class="panel-title">教师管理</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-3">
                        <input type="text" class="form-control search-teacher-input" placeholder="输入选择信息">
                    </div>

                    <!--教师信息选择-->
                    <div class="col-md-2">
                        <div class="btn-group">
                            <button class="btn search-teacher-info btn-default btn-lg md-high dropdown-toggle" type="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <span class="select-name">教师信息</span><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu search-role-select">
                                <li><a>工号</a></li>
                                <li><a>姓名</a></li>
                                <li><a>性别</a></li>
                                <li><a>专业</a></li>
                                <li><a>学院</a></li>
                            </ul>
                        </div>
                    </div>

                    <!---->
                    <div class="col-md-2">
                        <div class="btn-group">
                            <button class="btn search-teacher-sex btn-default btn-lg md-high dropdown-toggle" type="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <sapn class="select-name">性别</sapn>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">男</a></li>
                                <li><a href="#">女</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button id="btn-teacher-search" type="button" class="btn btn-primary btn-lg">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            查询
                        </button>
                    </div>

                    <%--<div class="col-md-2">--%>
                        <%--<button type="button" class="btn btn-primary btn-lg"--%>
                                <%--data-target="#add-user-modal-dialog" data-toggle="modal">--%>
                            <%--<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>--%>
                            <%--添加用户--%>
                        <%--</button>--%>
                    <%--</div>--%>

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">用户列表</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>专业</th>
                            <th>学院</th>
                            <th>操作</th>
                        </tr>
                    </table>

                    <nav class="page-nav">
                        <ul class="pagination pagination-lg">
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
                                       maxlength="16"
                                       required>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-password form-control"
                                       placeholder="密码"
                                       maxlength="16"
                                       required>
                            </div>

                            <div class="dropdown form-item">
                                <button class="btn single-size dropdown-toggle" type="button" id="roleDropdownMenu1"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <span class="select-name">请选择角色</span>
                                    <span class="caret"></span>
                                </button>
                                <div class="dropdown-menu select-role single-width" aria-labelledby="roleDropdownMenu1">
                                </div>
                            </div>
                            <button class="btn btn-single add-user-submit">添加用户</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--修改用户模态框-->
            <div class="modal fade" id="modify-user-modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">教师个人信息修改</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <input id="form-id" type="text" class="form-id form-control" disabled="disabled">
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-name form-control">
                            </div>

                            <div class="form-item">
                                <div class="btn-group single-width" role="group">
                                    <button type="button" class="enable btn btn-triple">性别：</button>
                                    <button type="button" class="btn btn-triple btn-state">男</button>
                                    <button type="button" class="btn btn-triple btn-state">女</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-major form-control">
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-academy form-control">
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
                                <h4 class="delete-user">确认删除用户<span class="delete-teacher-name"></span>(<span class="delete-teacher-id"></span>)？</h4>
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
