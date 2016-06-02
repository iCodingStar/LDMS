<%--
  Created by IntelliJ IDEA.
  User: HXY
  Date: 2016/6/2
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传实验资料</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/libs/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/libs/ajaxUploadFile/ajaxfileupload.js"></script>
    <script type="text/javascript">
        function uploadFile() {
            $.ajaxFileUpload({
                url: '/teacher/upload',
                fileElementId: 'file',
                success: function (data, status) {
                    if(data=="success"){
                        alert("123");
                    }
                    else if(data=="false"){
                        window.location.href="/teacher/home";
                        alert("成功");
                    }
                },
                error: function (data, status) {
                    alert("456");
                }
            });
        }
    </script>
</head>
<body>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <input type="file" id="file" name="file">
        <button  onclick="uploadFile()">上传文件</button>
        <div><a href="/teacher/home">返回首页</a></div>
    </div>
    <div class="col-md-4"></div>
</div>

</body>
</html>
