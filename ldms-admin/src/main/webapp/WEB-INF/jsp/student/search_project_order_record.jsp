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
    <title>查看已预约实验</title>
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
                        <td>实验室</td>
                        <td>实验名称</td>
                        <td>上课开始时间</td>
                        <td>上课结束时间</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>P1605001</td>
                        <td>张剑波</td>
                        <td>软件工程专业实验室</td>
                        <td>数据结构综合实习</td>
                        <td>2015-04-09</td>
                        <td>2015-06-30</td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>资料下载</button></td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>退选</button></td>
                    </tr>
                    <tr>
                        <td>P1605112</td>
                        <td>张剑波</td>
                        <td>软件工程专业实验室</td>
                        <td>数据库综合实习</td>
                        <td>2015-10-10</td>
                        <td>2015-12-10</td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>资料下载</button></td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>退选</button></td>
                    </tr>
                    <tr>
                        <td>P1605233</td>
                        <td>张剑波</td>
                        <td>软件工程专业实验室</td>
                        <td>软件测试实习</td>
                        <td>2016-03-05</td>
                        <td>2016-04-28</td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>资料下载</button></td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>退选</button></td>
                    </tr>
                    <tr>
                        <td>P1605333</td>
                        <td>张剑波</td>
                        <td>软件工程专业实验室</td>
                        <td>软件工程综合大实习</td>
                        <td>2016-05-04</td>
                        <td>2016-05-31</td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>资料下载</button></td>
                        <td><button type='button' class='btn btn-primary btn-sm show-project-btn'>退选</button></td>
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
</body>
</html>
