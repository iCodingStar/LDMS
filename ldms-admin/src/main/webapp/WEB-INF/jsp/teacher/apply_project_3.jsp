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
                    <td>黄旭阳</td>
                </tr>
                <tr>
                    <td>申请时间</td>
                    <td>2016-6-28</td>
                </tr>
                <tr>
                    <td>实验室</td>
                    <td>信息楼805</td>
                </tr>
                <tr>
                    <td>学分</td>
                    <td>3.5</td>
                </tr>
                <tr>
                    <td>容量</td>
                    <td>57</td>
                </tr>
                <tr>
                    <td>实验开始时间</td>
                    <td>2016-9</td>
                </tr>
                <tr>
                    <td>实验结束时间</td>
                    <td>2016-12</td>
                </tr>
                <tr>
                    <td>实验资料</td>
                    <td>信息工程学院设备管理细则.doc</td>
                </tr>
                </tbody>
            </table>
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
                                        <td>借用数量</td>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>戴尔服务器</td>
                                    <td>3</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <label>确认信息无误，提交审核</label>
            <input type="button" class="btn btn-primary btn-lg" value="提交"><span>申请信息</span>
        </div>

    </div>
</div>
<div class="col-md-3"></div>
</div>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
