<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="applyproject/css/style.css">

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
    <div class="col-md-3"></div>
    <div class="col-md-6" style="margin-top: 10%">
        <!--面板-->
        <div class="panel panel-info">
                <div class="col-md-12">
                    <form enctype="multipart/form-data" >
                        <div class="form-group">
                            <input name="file" id="file-5" class="file" type="file" multiple data-preview-file-type="any" data-upload-url="${pageContext.request.contextPath}/teacher/upload" data-preview-file-icon="">
                        </div>
                        <div>
                            <input type="button" style="display: none" onclick="up">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%--<div class="panel panel-default">--%>
    <%--<div class="panel-body">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-6">--%>
                <%--<button class="btn btn-info" value="上传"></button>--%>
            <%--</div>--%>
            <%--<div>--%>
                <%--<button class="btn btn-info" value="直接完成"></button>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
    <div class="col-md-3"></div>
</div>

<!--设备添加-->><!-- /.modal -->
<script src="${cacheUrl}/assets/applyproject/fileup/jquery.min.js"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.js" type="text/javascript"></script>
<script>
</script>
<script>

</script>
<script>
</script>
</body>
</html>