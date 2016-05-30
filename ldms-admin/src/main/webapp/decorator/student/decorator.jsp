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

    <link  rel="stylesheet" href="${cacheUrl}/css/admin/admin-base.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">LDMS</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>CUG实验室管理中心</b></span>
        </a>


        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">

            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">切换</span>
            </a>

        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${cacheUrl}/images/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><%=session.getAttribute("stu_name")%></p>
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
                <li class="header"></i>学生系统主菜单</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="">
                    <a href="/student/order">
                        <i class="fa fa-crosshairs fa-lg" style="margin-right: 30px"></i>
                        <span>预约实验</span>
                        <i class="fa fa-angle-right pull-right"></i>
                    </a>
                </li>

                <li>
                    <a href="/student/record">
                        <i class="fa fa-desktop fa-lg" style="margin-right: 30px"></i>
                        <span>查看已预约实验</span>
                        <i class="fa fa-angle-right pull-right"></i>
                    </a>
                </li>

                <li class="treeview">
                    <a href="/student/score">
                        <i class="fa fa-users fa-lg" style="margin-right: 30px"></i>
                        <span>查询成绩</span>
                        <i class="fa fa-angle-right pull-right"></i>
                    </a>
                </li>
                <li class="treeview">
                    <a href="/student/info">
                        <i class="fa fa-cube fa-lg" style="margin-right: 30px"></i>
                        <span>查看个人信息</span>
                        <i class="fa fa-angle-right pull-right"></i>
                    </a>
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
                <li >
                    <sitemesh:write property='title'/></li>
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
                        <a href="javascript::;">
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


<script src="${cacheUrl}/js/student/admin-student.js" type="text/javascript"></script>
<script type="text/javascript" src="${cacheUrl}/js/admin/admin-base.js" ></script>
<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>