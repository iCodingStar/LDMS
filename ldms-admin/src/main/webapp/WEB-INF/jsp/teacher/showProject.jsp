<%@page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!--IE 兼容-->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--自适应:移动设备优先-->


    <link href="${cacheUrl}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cacheUrl}/css/admin/admin-base.css" rel="stylesheet">

    <link href="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${cacheUrl}/assets/applyproject/fileup/default.css">
    <link href="${cacheUrl}/assets/applyproject/fileup/fileinput.css" media="all" rel="stylesheet" type="text/css">
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>

</head>

<body>

<div id="page-wrapper">

    <div class="container-fluid">
        <!-- 页面内容 -->
        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">实验查询</h3>
            </div>

            <div class="panel-body">

                <div class="col-md-4">
                    <input type="text" class="form-control project-info-input" placeholder="请输入项目信息" required>
                </div>
                <div class="col-md-2 col-md-offset-1">
                    <div class="btn-group">
                        <button class="btn project-info btn-default btn-lg md-high dropdown-toggle" type="button"
                                data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <span class="select-name">项目信息</span><span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu project-info-select">
                            <li><a>无筛选</a></li>
                            <li><a>项目编号</a></li>
                            <li><a>主题</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-md-offset-1">
                    <div class="btn-group">

                        <button class="btn project-state btn-default btn-lg md-high dropdown-toggle" type="button"
                                data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            <sapn class="select-name">项目状态</sapn>
                            <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu project-state-select">
                            <li><a href="#">无筛选</a></li>
                            <li><a href="#">提交</a></li>
                            <li><a href="#">未审核</a></li>
                            <li><a href="#">已通过</a></li>
                            <li><a href="#">已拒绝</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-1 col-md-offset-1" style="margin-left: 10px">
                    <button id="btn-search" type="button" class="btn btn-primary btn-lg">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        查询
                    </button>
                </div>
            </div>
        </div>

        <!--标题栏-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">实验列表</h3>
            </div>
            <div class="panel-body">
                <table class="table project-info-table table-hover">
                    <tr>
                        <th>项目编号</th>
                        <th>实验名称</th>
                        <th>状态</th>
                        <th>已选人数</th>
                        <th>处理时间</th>
                        <th>操作</th>
                    </tr>

                </table>
            </div>

        </div>
        <div id="result_area"></div>
    </div>
</div>

<!-- /.container-fluid -->
</div>
<div class="modal fade" id="show-project-modal-dialog" style="margin-top: 5%">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">项目详情</h4>
            </div>
            <div class="modal-body" style="padding: 5px">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td><strong>项目属性</strong></td>
                        <td><strong>详细信息</strong></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>申请人</td>
                        <td id="teacherName">黄旭阳</td>
                    </tr>
                    <tr>
                        <td>申请时间</td>
                        <td id="submitTime">2016-6-28</td>
                    </tr>
                    <tr>
                        <td>实验室</td>
                        <td id="labName">信息楼805</td>
                    </tr>
                    <tr>
                        <td>学分</td>
                        <td id="credit">3.5</td>
                    </tr>
                    <tr>
                        <td>容量</td>
                        <td id="capacity">57</td>
                    </tr>
                    <tr>
                        <td>实验开始时间</td>
                        <td id="startTime">2016-9</td>
                    </tr>
                    <tr>
                        <td>实验结束时间</td>
                        <td id="endTime">2016-12</td>
                    </tr>
                    <tr>
                        <td>实验处理时间</td>
                        <td id="passTime">2016-12</td>
                    </tr>
                    <tr>
                        <td>实验资料</td>
                        <td id="files"><a id="lin"></a></td>
                    </tr>
                    </tbody>
                </table>

                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    实验所申请的设备信息
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body" style="background-color: aliceblue">
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead>
                                    <td>编号</td>
                                    <td>设备名称</td>
                                    <td>借用数量</td>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>戴尔服务器</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>硬盘</td>
                                        <td>5</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="fileup-modal-dialog" style="margin-top: 5%">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            </div>
            <div class="modal-body" style="padding: 5px">
                <div class="col-md-12">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input name="file" id="file-5" class="file" type="file" multiple
                                   data-preview-file-type="any"
                                   data-upload-url="${pageContext.request.contextPath}/teacher/upload"
                                   data-preview-file-icon="">
                        </div>
                        <div>
                            <input type="button" style="display: none">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${cacheUrl}/assets/applyproject/fileup/jquery.min.js"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${cacheUrl}/js/teacher/admin-base.js"></script>
<script type="text/javascript" src="${cacheUrl}/js/teacher/jquery.min.js"></script>

<script type="text/javascript" src="${cacheUrl}/js/teacher/teacher_project.js"></script>

<script>

    var id, name, state;

    function initdata() {
        //获取查询条件
        var query_input = $(".project-info-input").val();
        var project_state = $(".project-state .select-name").text();

        //alert(project_info + "---" + project_state);

        if (project_info == "项目编号") {
            id = query_input;
        } else if (project_info == "主题") {
            name = query_input;
        } else {
            id = null;
            name = null;
        }

        if (project_state == "提交") {
            state = 0;
        } else if (project_state == "已通过") {
            state = 1;
        } else if (project_state == "拒绝") {
            state = 2;
        } else if (project_state == "已完成") {
            state = 3;
        } else {

            state = null;
        }
    }
</script>
<script>
</script>
</body>
</html>