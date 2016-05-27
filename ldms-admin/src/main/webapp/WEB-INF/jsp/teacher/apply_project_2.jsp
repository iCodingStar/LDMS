<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <link rel="stylesheet" href="${cacheUrl}/assets/applyproject/css/style.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

    <link href="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${cacheUrl}/assets/applyproject/fileup/default.css">
    <link href="${cacheUrl}/assets/applyproject/fileup/fileinput.css" media="all" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->

</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <!--面板-->
        <div class="panel panel-info">
            <div class="panel-heading">试验申请信息填写</div>
            <div class="panel-body row">
                <div class="col-md-6">
                    <div class="input-group"  id="chose_lab">
                        <span class="input-group-addon" style="padding:0;border:0;">
                             <button style="background-color: #ededed" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">实验室<span class="caret"></span></button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="#">信息楼805</a></li>
                                <li><a href="#">mac笔记本</a></li>
                                <li><a href="#">SSD固态硬盘</a></li>
                            </ul></span>
                        <input id="input_lab_name" type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon" id="input_lab_theme">输入实验主题</span>
                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon" id="lab_score">学分</span>
                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon" id="lab_capacity">容量</span>
                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon" id="lab_start_time">开始时间</span>
                        <input type="date" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon" id="lab_end_time">结束时间</span>
                        <input type="date" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <div class="col-md-12">
                    <form enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="file-5" class="file" type="file" multiple data-preview-file-type="any" data-upload-url="#" data-preview-file-icon="">
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel-body row">
                <div class="col-lg-12">
                    <button type="button" id="chose_device"data-toggle="modal" data-target="#adddevice" class="btn btn-primary btn-lg">选择实验所需设备</button>
                </div>
            </div>
            <div class="panel-body row">
                <form class="form-horizontal">
                    <div class="form-group form-group-lg">
                        <div class="col-lg-12" style="margin-right: 5px">
                            <textarea style="height: 200px" class="form-control" type="" id="" placeholder="备注信息"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-body row">
                <div class="col-lg-12">
                    <button id="saveinfo" type="button"class="btn btn-success btn-lg" onclick="saveinfo()">提交信息</button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<!--设备添加-->
<div id="adddevice" class="modal fade" style="display:none;margin-top: 20%;position: absolute" role="dialog" aria-labelledby="...">
    <div class="modal-dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">选择实验所需设备</h4><div id="add_Btn" onclick="addDevice();">+</div>
            </div>
            <div class="modal-body">
                <!--添加设备-->
                <table class="table table-striped" id="bo">
                    <thead>
                    <th>
                        <tr>
                            <td style="width: 50%">&nbsp;&nbsp;设备类型</td>
                            <td style="width: 25%">&nbsp;&nbsp;余量</td>
                            <td style="width: 25%">&nbsp;&nbsp;输入数量</td>
                        </tr>
                    </th>
                    </thead>
                    <tbody>
                    <tr class="base_add">
                        <td>
                            <div class="input-group">
                                <input type="text" class="form-control" aria-label="...">
                                <div class="input-group-btn myshow">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设备类型<span class="caret"></span></button>
                                    <ul class="dropdown-menu dropdown-menu-right" onclick="showLiText(event);">
                                        <li><a href="#">戴尔服务器</a></li>
                                        <li><a href="#">mac笔记本</a></li>
                                        <li><a href="#">SSD固态硬盘</a></li>
                                    </ul>
                                </div><!-- /btn-group -->
                            </div><!-- /input-group -->
                        </td>
                        <td>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email" disabled="disabled">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">选定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="${cacheUrl}/assets/applyproject/fileup/jquery.min.js"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.js" type="text/javascript"></script>
<script>
    $("#chose_lab ul li").each(function(){
        $(this).on("click",function(){
            var liValue = this.firstChild.innerHTML;
            document.querySelector("#input_lab_name").value= liValue;
        })
    })
</script>
<script>
    function getData(url,querydata,method,successbackcall) {
        $.ajax({
            url: url,
            method: method,
            data: querydata,
            success: successbackcall,
            error:function(){
                alert("信息未提交成功,请尝试重新")
            }
        });
    }
</script>
<script>
    function saveinfo() {
        var lab_name=$("#input_lan_name").val(),
                pro_name=$("#input_lab_theme").val(),
                pro_capacity=$("#lab_capacity").val(),
                pro_score=$("#lab_score").val(),
                pro_start_time=$("#lab_start_time").val(),
                pro_end_time=$("#lab_end_time").val();

        var querydata={lab_id:lab_name,name:pro_name,starttime:pro_start_time,endtime:pro_end_time,capacity:pro_capacity,credit:pro_score}

        getData("/saveprojectinfo",querydata,"get",function (data) {
            if(data=='sucess')
                    window.location.href="/jump/applyproject3";
            else
                    alert("信息有误");
        })
    }
</script>
<script>
    //    $("#add_Btn").click(function() {
    //        addDevice();
    //    })

    function addDevice() {
        var temp = document.getElementsByClassName("base_add")[0].innerHTML,//.clone(true)
                table = document.getElementById("bo").childNodes[3];

        var _tablerow = '<tr class="base_add"><td><div class="input-group"><input type="text" class="form-control" aria-label="..."><div class="input-group-btn myshow"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设备类型<span class="caret"></span></button><ul class="dropdown-menu dropdown-menu-right" onclick="showLiText(event);"><li><a href="#">戴尔服务器</a></li><li><a href="#">mac笔记本</a></li><li><a href="#">SSD固态硬盘</a></li></ul></div><!-- /btn-group --></div><!-- /input-group --></td><td><div class="form-group"><input type="email" class="form-control" placeholder="Email" disabled="disabled"></div></td><td><div class="form-group"><input type="email" class="form-control" placeholder="Email"></div></td></tr>';
        console.log(temp.outerHTML);
        //_tablerow += temp;
        //_tablerow += '</tr>';
        //$("#bo").append(temp);
        console.log(table.childNodes[3]);
        table.innerHTML += _tablerow;

    }

    function showLiText() {
        var that = this.event.target,
                _text = that.innerHTML;
        //console.log(_text,that.parentNode.parentNode.parentNode.parentNode.firstElementChild.value);
        that.parentNode.parentNode.parentNode.parentNode.firstElementChild.value = _text;
        //console.log("0",that.parentNode.parentNode.parentNode.parentNode.firstElementChild.value);
    }
    $("#adddevice").display="none";
    $("#file-3").fileinput({
        showUpload: false,
        showCaption: false,
        browseClass: "btn btn-primary btn-lg",
        fileType: "any",
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
    });
</script></body>
</html>