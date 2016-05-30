<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><sitemesh:write property='title'/></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${cacheUrl}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${cacheUrl}/css/ldms.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${cacheUrl}/css/skin-blue.min.css">

    <!--checkProject-->
    <link  rel="stylesheet" href="${cacheUrl}/css/admin/admin-base.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<body class="skin-blue sidebar-mini">

<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">LDMS</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>信工学院实验中心</b></span>
        </a>


        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">

            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">切换</span>
            </a>

            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">

                <ul class="nav navbar-nav">
                    <!-- 消息提示: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <!-- Menu toggle button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有四条短消息</li>
                            <li>
                                <!-- inner menu: contains the messages -->
                                <ul class="menu">
                                    <li><!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <!-- User Image -->
                                                <img src="${cacheUrl}/images/user2-160x160.jpg" class="img-circle"
                                                     alt="User Image">
                                            </div>
                                            <!-- Message title and timestamp -->
                                            <h4>
                                                支持团队
                                                <small><i class="fa fa-clock-o"></i> 5 分钟</small>
                                            </h4>
                                            <!-- The message -->
                                            <p>为什么不买一个牛逼的主题呢?</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                </ul>
                                <!-- /.menu -->
                            </li>
                            <li class="footer"><a href="#">查看所有短消息</a></li>
                        </ul>

                    </li>
                    <!-- /.messages-menu -->

                    <!-- Notifications Menu -->
                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有10条通知</li>
                            <li>
                                <!-- Inner Menu: contains the notifications -->
                                <ul class="menu">
                                    <li><!-- start notification -->
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5个新会员加入
                                        </a>
                                    </li>
                                    <!-- end notification -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">查看多有</a></li>
                        </ul>
                    </li>
                    <!-- Tasks Menu -->
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你还有9项工作</li>
                            <li>
                                <!-- Inner menu: contains the tasks -->
                                <ul class="menu">
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <!-- Task title and progress text -->
                                            <h3>
                                                设计一些按钮
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <!-- The progress bar -->
                                            <div class="progress xs">
                                                <!-- Change the css width attribute to simulate progress -->
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%"
                                                     role="progressbar" aria-valuenow="20" aria-valuemin="0"
                                                     aria-valuemax="100">
                                                    <span class="sr-only">20% 完成</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">你还有9项工作</a>
                            </li>
                        </ul>
                    </li>
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">

                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="${cacheUrl}/images/user2-160x160.jpg" class="user-image" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">${user.username}</span>
                        </a>

                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="${cacheUrl}/images/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    ${pageContext.session.getAttribute("user").username} - 管理员
                                    <small>会员注册时间 09. 2012</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">年龄</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">男</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">1993.08.18</a>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-default btn-flat">注销</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">修改</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar" style="font-family: 微软雅黑;font-size: 20px">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${cacheUrl}/images/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${pageContext.session.getAttribute("user").username}</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>

            <!-- search form (Optional) -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="搜索">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="header">
                <li style="color: lemonchiffon;font-size: 18px;width: 100%;text-align: center;display: block;">
                    功能导航
                </li>
                </i>
                <!-- Optionally, you can add icons to the links -->
                <li>
                    <a href="#">
                        <i class="fa fa-crosshairs fa-lg" style="margin-right: 30px"></i>
                        <span>日常办公</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" style="text-align: center"><i class="fa fa-question fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;公告管理</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-line-chart fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;课件管理</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;在线答疑</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-spinner fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;在线资源</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-crosshairs fa-lg" style="margin-right: 30px"></i>
                        <span>教学实验</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" style="text-align: center"><i class="fa fa-question fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;实验查询</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-line-chart fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;成绩报表</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;项目安排</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/admin/project/" style="text-align: center"><i class="fa fa-spinner fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;实验审核</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-crosshairs fa-lg" style="margin-right: 30px"></i>
                        <span>开放实验</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" style="text-align: center"><i class="fa fa-question fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;实验查询</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-line-chart fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;成绩报表</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;项目安排</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/admin/project/" style="text-align: center"><i class="fa fa-spinner fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;实验审核</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-desktop fa-lg" style="margin-right: 30px"></i>
                        <span>设备管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" style="text-align: center"> <i class="fa fa-list fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;设备申请</a>
                        </li>
                        <li><a href="#" style="text-align: center"> <i class="fa fa-wrench fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;设备报修</a>
                        </li>
                        <li><a href="#" style="text-align: center"> <i class="fa fa-cc-paypal fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;设备申购</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-laptop fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设备管理</a>
                        </li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-users fa-lg" style="margin-right: 30px"></i>
                        <span>人员管理</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" style="text-align: center"><i class="fa fa-user fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户管理</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-user fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学生管理</a>
                        </li>
                        <li><a href="#" style="text-align: center"><i class="fa fa-user-secret fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教师管理</a>
                        </li>
                    </ul>
                </li>

            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="min-height: 844px;">
        <!-- Content Header (Page header) -->
        <section class="content-header" style="background-color:ghostwhite;height: 50px">
            <h1 style="text-align: center"></h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-map-marker fa-lg"></i> Page</a></li>
                <li class="active"><sitemesh:write property='title'/></li>
            </ol>

        </section>


        <!-- Main content -->
        <section class="content">
            <h1>
                <sitemesh:write property='body'/>
            </h1>
            <!-- Your Page Content Here -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Design By Star
        </div>
        <!-- Default to the left -->
        <div>
            <strong>Copyright © 2015 <a href="http://blog.codingstar.cn">iCodingStar</a>.</strong> All rights reserved.
        </div>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a
                    href="#"
                    data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#"
                   data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">最近活动</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="#">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">石星的生日</h4>

                                <p>将在8.16举行</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">任务进度</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="#">
                            <h4 class="control-sidebar-subheading">
                                原型设计
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">一些杂乱的内容</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">设置</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            报告panel用途
                            <input type="checkbox" class="pull-right" checked="">
                        </label>

                        <p>
                            一些关于这个设置选项的描述
                        </p>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg" style="position: fixed; height: auto;"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.0 -->
<script src="${cacheUrl}/js/jquery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${cacheUrl}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${cacheUrl}/bootstrap/js/app.min.js"></script>

<script type="text/javascript" src="${cacheUrl}/js/admin/admin-base.js"></script>
<script type="text/javascript" src="${cacheUrl}/js/admin/admin-student.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>