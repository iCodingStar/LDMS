<%--

    Copyright 2002-2016 the original author or authors.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%--
  User: hxy
  Time:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台登录</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="${cacheUrl}/assets/login/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cacheUrl}/assets/login/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${cacheUrl}/assets/login/css/form-elements.css">
    <link rel="stylesheet" href="${cacheUrl}/assets/login/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${cacheUrl}/assets/login/js/jquery-1.11.1.min.js"></script>
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${cacheUrl}/assets/login/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${cacheUrl}/assets/login/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${cacheUrl}/assets/login/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${cacheUrl}/assets/login/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${cacheUrl}/assets/login/ico/apple-touch-icon-57-precomposed.png">
</head>
<style>
    body{
        background-image: url("${cacheUrl}/assets/login/img/backgrounds/1.jpg");
    }
</style>

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${cacheUrl}/assets/login/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${cacheUrl}/assets/login/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${cacheUrl}/assets/login/ico/apple-touchF-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="${cacheUrl}/assets/login/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${cacheUrl}/assets/login/ico/apple-touch-icon-57-precomposed.png">
    <style type="text/css">
        body {
            background-image: url("${cacheUrl}/assets/login/img/backgrounds/1.jpg");
        }
    </style>
</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>信息管理系统</strong></h1>
                    <div class="description">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>登入系统</h3>
                            <p>输入用户名密码登录</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form id="loginform" role="form" action="login" method="post">
                            <div class="form-group">
                                <label class="sr-only" for="username">用户名</label>
                                <input type="text" id="loginusername" name="username" placeholder="Username..." class="form-username form-control" id="username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">密码</label>
                                <input type="password" id="loginpassword" name="password" placeholder="Password..." class="form-password form-control" id="password">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="auth"></label>
                                <input style="visibility: hidden" type="text" id="userauth" name="auth" placeholder="" class="form-username form-control" >
                            <div class="form-group">
                                <label>选择角色</label>
                                <div class="input-group">
                                    <input type="text" id="auth" class="form-control" aria-label="...">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default dropdown-toggle"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            身份<span class="caret"></span></button>
                                        <ul id="cc" class="dropdown-menu dropdown-menu-right">
                                            <li><a href="#">管理员</a></li>
                                            <li><a href="#">教师</a></li>
                                            <li><a href="#">学生</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                </div><!-- /input-group -->
                            </div>
                            <button type="button" id="login" class="btn">登录</button>
                            <button type="button" class="btn-primary btn-lg btn-block regist-btn">注册</button>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Javascript -->
<script src="${cacheUrl}/assets/login/js/jquery-1.11.1.min.js"></script>
<script src="${cacheUrl}/assets/login/bootstrap/js/bootstrap.min.js"></script>
<script src="${cacheUrl}/assets/login/js/jquery.backstretch.min.js"></script>
<script src="${cacheUrl}/assets/login/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="${cacheUrl}/assets/login/js/placeholder.js"></script>
<![endif]-->
<script>
    var a_s= document.getElementsByTagName("a");
    for(var i=0;i<a_s.length;i++){
        a_s[i].onclick=function(event){
            console.log(event.target.innerHTML)
            document.getElementById("auth").value=event.target.innerHTML;
            document.getElementById("userauth").value=event.target.innerHTML;
        }
    }
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#login").click(function(){
            crunchifyAjax();
        });
    });
    function crunchifyAjax() {
        var username=$("#loginusername").val();
        var password=$("#loginpassword").val();
        var auth=$("#auth").val();


        $.ajax({
            url : '/validateuser',
            method: 'GET',
            data: {username:username,password:password,auth:auth},
            success : function(data) {
                if(data=='success')
                    $("#loginform").submit();
                else
                    alert("信息有误，请检查登录信息");
            }
        });
    }
</script>

</body>

</html>

