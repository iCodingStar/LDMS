<%--
  User: star
  Date: 2016/6/2
  Time: 10:11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<<title>文件上传</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/libs/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/libs/ajaxUploadFile/ajaxfileupload.js"></script>

<script type="text/javascript">
    function uploadFile() {
        $.ajaxFileUpload({
            url: '/action/file.do',
            fileElementId: 'uFile',
            success: function (data, status) {
                alert("123");
            },
            error: function (data, status) {
                alert("456");
            }
        });
    }
</script>

</head>
<body>
<input type="file" id="uFile" name="uFile"/>
<button onclick="uploadFile()">点击</button>
</body>
</html>