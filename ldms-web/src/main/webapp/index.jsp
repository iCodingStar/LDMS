<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>SOFTWARE ENGINEEXRING</title>
    <link href="css/index.css" type="text/css" rel="stylesheet">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="bootstrap/js/bootstrap.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
            font-family: '微软雅黑';
            font-weight: 800;
        }
        body{
            background-image: url("images/bg.png");
        }
        .main{
            margin-top: 5px;
            width:1200px;
            margin: auto auto;
            background-color: rgba(95, 158, 160, 0.14);
            box-shadow: 0 0 3px #000;

        }
        .head{
            margin-bottom: 10px;
            height: 200px;
        }
        .head .icon{
            float: left;
        }
        .head .name{
            width: 667px;
            float: right;
            margin-right: 186px;
            margin-top: 70px;

        }
        .search{
            height: 50px;
            margin-bottom: 10px;
        }
        .search .nav ul li{
            list-style: none;
            float: left;
            margin-left:40px;
            margin-top: 16px;
        }
        /*.search .searchbar{*/
            /*float: right;*/
            /*margin-right: 80px;*/
            /*margin-top: 13px;*/
        /*}*/
        .show{
            height: 460px;
            background-color: azure;
        }
        /*.thrD_rotation{*/
            /*height: 250px;*/
            /*width: 50%;*/
            /*border: groove;*/
            /*float: left;*/
            /*margin-left: 24px;*/
            /*margin-top: 20px;*/
          /*}*/
        .latest_info{
            margin-right: 10px;
            height: 400px;
            width: 630px;
            float: right;
            margin-top: 50px;
        }
        .latest_info ul li{
            list-style: none;
            margin: 6px auto;
        }
        .latest_info ul li .time-m{
            float: right;
        }
        .content{
            background-color:#d4d4d4;
            margin: 25px 50px auto 50px;
        }
        .content .panel-group .panel  .panel-collapse  .panel-body ul .panel  .panel-body li{
            list-style: none;
        }
        .content .panel-group .panel  .panel-collapse  .panel-body ul .panel  .panel-body li .time-m{
            float: right;
        }
        .footer{
            height: 50px;
            background-color: #fdc56d;
        }
        .footer ul li{
            margin-top: 12px;
            float: left;
            list-style: none;
        }
        .footer ul li a{
            margin-left: 100px;
            font-size: 20px;
        }
        #banner{
            height: 252px;
            width: 485px;
            float: left;
            margin-left: 10px;
            margin-top: 50px;
            /*border: 1px solid #f00;*/
            /*background: #ffffcc;*/
            perspective: 800px;/*景深*/
        }
        #banner ul li{
            list-style: none;
            width: 120px;
            height: 250px;
            float: left;
            position: relative;
            transform-style: preserve-3d;
            transform: translateZ(-180px) rotateX(0deg);
            transition: 2s;

        }
        #banner ul li div{
            width: 120px;
            height: 250px;
            position: absolute;/*绝对定位，位置调整*/
        }
        #banner ul li div:nth-child(1){
            bottom: 250px;
            transform:translateZ(125px) rotateX(90deg) ;
            transform-origin: bottom;
            background-image: url("images/1.png");
        }#banner ul li div:nth-child(2){
             top:250px;
             transform-origin: top;
             transform:translateZ(125px) rotateX(-90deg) ;
             background-image: url("images/2.png");
         }#banner ul li div:nth-child(3){
              transform:translateZ(125px);
              background-image: url("images/3.png");
          }#banner ul li div:nth-child(4){
               transform: translateZ(-125px) rotateX(180deg);
               background-image: url("images/4.png");
           }
        #banner ul li:nth-child(1) div{background-position: 0px}
        #banner ul li:nth-child(2) div{background-position: -120px}
        #banner ul li:nth-child(3) div{background-position: -240px}
        #banner ul li:nth-child(4) div{background-position: -360px}
        #banner:hover ul li{
            transform:translateZ(-180px) rotateX(180deg);
        }
        .btn{
            margin-left: 140px;
        }
    </style>
    <script type="text/javascript">
        function marque() {
            var t=document.getElementsByClassName("soft").innerHTML;
            var a = t;
            a = a.substr(1, a.length - 1) + a.substr(0, 1);
            t.innerHTML = a;
            var b = setTimeout("abd()", 500);
        }


    </script>
</head>
<body onload="marque()">
<div class="main">
    <div class="head">
        <div class="icon">
            <img src="images/logo.png" style="width: 1200px;height: 213px">
        </div>
    </div>
    <div class="search">
        <nav class="navbar navbar-default" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">软工实验室<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://xgxy.cug.edu.cn/">实验概况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验设备</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验课程或内容</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室开放情况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理制度</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理相关文档</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">遥感实验室<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://xgxy.cug.edu.cn/">实验概况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验设备</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验课程或内容</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室开放情况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理制度</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理相关文档</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">测绘实验室 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://xgxy.cug.edu.cn/">实验概况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验设备</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验课程或内容</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室开放情况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理制度</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理相关文档</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">地信实验室 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://xgxy.cug.edu.cn/">实验概况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验设备</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验课程或内容</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室开放情况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理制度</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理相关文档</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">测绘实验室<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://xgxy.cug.edu.cn/">实验概况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验设备</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验课程或内容</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室开放情况</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理制度</a></li>
                            <li><a href="http://xgxy.cug.edu.cn/">实验室管理相关文档</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                   <a href="${adminUrl}"><button id="tobak" style="width: 100px;height: 36px;margin-top: 4px;text-align: center;padding-top: 4px" class="btn btn-lg btn-info">登录后台</button></a>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>


        <!--<div class="nav">
            <ul>
                <li>专业介绍</li>
                <li>学术动态</li>
                <li>师资力量</li>
                <li>设施设备</li>
            </ul>
        </div>
        -->
        <!--<div class="searchbar">-->
            <!--<input type="text" value="search here" height="20px">-->
        <!--</div>-->
    </div>
    <div class="show">
        <div id="banner">
            <div class="panel panel-default">
                <div class="panel-body">
                    风采展示
                </div>
            </div>
            <ul>
                <li>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </li>

                <li>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </li>
                <li>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </li>
                <li style="z-index: -1">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </li>
            </ul>
        </div>
        <div class="latest_info">
            <div class="panel panel-default">
                <div class="panel-body">
                    最新动态
                </div>
            </div>
            <ul>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3480" rel="bookmark" target="_blank" title="我校机器人足球队获第17届全国机器人锦标赛亚军季军">我校机器人足球队获第17届全国机器人锦标赛亚军季军</a></span>
                    <span class="time-m">2015 / 09 / 28</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3257" rel="bookmark" target="_blank" title="信息工程学院2015年软件工程专业教师岗位招聘信息">信息工程学院2015年软件工程专业教师岗位招聘信息</a></span>
                    <span class="time-m">2015 / 09 / 21</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3233" rel="bookmark" target="_blank" title="2015全国博士生学术论坛（测绘科学与技术）征文通知（第一轮）">2015全国博士生学术论坛（测绘科学与技术）征文通知（第一轮）</a></span>
                    <span class="time-m">2015 / 09 / 18</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3122" rel="bookmark" target="_blank" title="信工学院2015级新生开学典礼暨入学教育">信工学院2015级新生开学典礼暨入学教育</a></span>
                    <span class="time-m">2015 / 09 / 11</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3105" rel="bookmark" target="_blank" title="送关爱、传温情——信工学院领导走访新生宿舍">送关爱、传温情——信工学院领导走访新生宿舍</a></span>
                    <span class="time-m">2015 / 09 / 10</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3099" rel="bookmark" target="_blank" title="聚焦信工学院2015级新生家长会">聚焦信工学院2015级新生家长会</a></span>
                    <span class="time-m">2015 / 09 / 10</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=2928" rel="bookmark" target="_blank" title="任千山万水，愿一“信”一“忆”——信工学院2015届毕业典礼暨毕业生晚会">任千山万水，愿一“信”一“忆”——信工学院2015届毕业典礼暨毕业生晚会</a></span>
                    <span class="time-m">2015 / 06 / 25</span>
                </li>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3480" rel="bookmark" target="_blank" title="我校机器人足球队获第17届全国机器人锦标赛亚军季军">我校机器人足球队获第17届全国机器人锦标赛亚军季军</a></span>
                    <span class="time-m">2015 / 09 / 28</span>
                </li>
                <div class="clear"></div>
                <li>
                    <span class="tlist-m tlist-m-t"><a href="http://xgxy.cug.edu.cn/?p=3257" rel="bookmark" target="_blank" title="信息工程学院2015年软件工程专业教师岗位招聘信息">信息工程学院2015年软件工程专业教师岗位招聘信息</a></span>
                    <span class="time-m">2015 / 09 / 21</span>
                </li>
                <div class="clear"></div>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            科研学术动态
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse ">
                    <div class="panel-body">
                        <ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2831" rel="bookmark" target="_blank" title="信工学术论坛第52期-青年教师学术沙龙">信工学术论坛第52期-青年教师学术沙龙</a></span>
                                        <span class="time-m">2015 / 05 / 19</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2745" rel="bookmark" target="_blank" title="信工学术论坛第51期">信工学术论坛第51期</a></span>
                                        <span class="time-m">2015 / 04 / 16</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2409" rel="bookmark" target="_blank" title="信工学术论坛第50期-名家论坛">信工学术论坛第50期-名家论坛</a></span>
                                        <span class="time-m">2015 / 03 / 05</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2184" rel="bookmark" target="_blank" title="信工学术论坛第49期—青年教师学术沙龙">信工学术论坛第49期—青年教师学术沙龙</a></span>
                                        <span class="time-m">2014 / 12 / 04</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2166" rel="bookmark" target="_blank" title="信工学术论坛第48期-名家论坛">信工学术论坛第48期-名家论坛</a></span>
                                        <span class="time-m">2014 / 11 / 27</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2135" rel="bookmark" target="_blank" title="第二次全国土地调查及土地变更调查监测学术报告">第二次全国土地调查及土地变更调查监测学术报告</a></span>
                                        <span class="time-m">2014 / 11 / 21</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m-d"><a href="http://xgxy.cug.edu.cn/?p=2087" rel="bookmark" target="_blank" title="信工学术论坛第47期—青年教师学术沙龙">信工学术论坛第47期—青年教师学术沙龙</a></span>
                                        <span class="time-m">2014 / 11 / 12</span>
                                    </li>
                                </div>
                            </div>
                        </ul>
                        </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            本科教学信息
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse ">
                    <div class="panel-body">
                        <ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3376" rel="bookmark" target="_blank" title="关于补缴2015年下半年CET报名费的紧急通知">关于补缴2015年下半年CET报名费的紧急通知</a></span>
                                        <span class="time-m">2015 / 09 / 24</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3196" rel="bookmark" target="_blank" title="关于2015年下半年全国大学英语四六级考试缴费的通知">关于2015年下半年全国大学英语四六级考试缴费的通知</a></span>
                                        <span class="time-m">2015 / 09 / 17</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3154" rel="bookmark" target="_blank" title="2016届免试推荐研究生综合成绩排名公示">2016届免试推荐研究生综合成绩排名公示</a></span>
                                        <span class="time-m">2015 / 09 / 14</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3139" rel="bookmark" target="_blank" title="信工学院2016届免试推荐研究生名额分配">信工学院2016届免试推荐研究生名额分配</a></span>
                                        <span class="time-m">2015 / 09 / 11</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3137" rel="bookmark" target="_blank" title="信工学院2016届免试推荐研究生面试&amp;能力测试时间及地点">信工学院2016届免试推荐研究生面试&amp;能力测试时间及地点</a></span>
                                        <span class="time-m">2015 / 09 / 11</span>
                                    </li>
                                </div>
                            </div>
                        </ul>
                        </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                            研究生管理信息
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3283" rel="bookmark" target="_blank" title="2015年信息工程学院硕士研究生学业奖学金评定通知">2015年信息工程学院硕士研究生学业奖学金评定通知</a></span>
                                        <span class="time-m">2015 / 09 / 22</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3260" rel="bookmark" target="_blank" title="信息工程学院接收2016级推免硕士研究生复试录取工作方案">信息工程学院接收2016级推免硕士研究生复试录取工作方案</a></span>
                                        <span class="time-m">2015 / 09 / 21</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=2944" rel="bookmark" target="_blank" title="信息工程学院2015年研招校园开放日活动入围名单">信息工程学院2015年研招校园开放日活动入围名单</a></span>
                                        <span class="time-m">2015 / 06 / 26</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=2918" rel="bookmark" target="_blank" title="中国地质大学（武汉）信息工程学院2015年研招校园开放日活动通知">中国地质大学（武汉）信息工程学院2015年研招校园开放日活动通知</a></span>
                                        <span class="time-m">2015 / 06 / 16</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=2875" rel="bookmark" target="_blank" title="信息工程学院2015届优秀毕业研究生评选结果公示">信息工程学院2015届优秀毕业研究生评选结果公示</a></span>
                                        <span class="time-m">2015 / 06 / 01</span>
                                    </li>
                                </div>
                            </div>
                        </ul>
                        </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                            招生就业信息
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3488" rel="bookmark" target="_blank" title="武汉光庭信息技术股份有限公司2016校园招聘">武汉光庭信息技术股份有限公司2016校园招聘</a></span>
                                        <span class="time-m">2015 / 09 / 28</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3482" rel="bookmark" target="_blank" title="汇丰软件2016年校园招聘">汇丰软件2016年校园招聘</a></span>
                                        <span class="time-m">2015 / 09 / 28</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3475" rel="bookmark" target="_blank" title="天恒昕业2016校园招聘简章">天恒昕业2016校园招聘简章</a></span>
                                        <span class="time-m">2015 / 09 / 25</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3464" rel="bookmark" target="_blank" title="南方数码2016年度校园招聘简章">南方数码2016年度校园招聘简章</a></span>
                                        <span class="time-m">2015 / 09 / 25</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3457" rel="bookmark" target="_blank" title="华勤通讯技术有限公司校招">华勤通讯技术有限公司校招</a></span>
                                        <span class="time-m">2015 / 09 / 25</span>
                                    </li>
                                </div>
                            </div>
                        </ul>
                        </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                            学生工作动态
                        </a>
                    </h4>
                </div>
                <div id="collapseFive" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3453" rel="bookmark" target="_blank" title="信工学院 2015级新生入学教育系列活动顺利有效开展">信工学院 2015级新生入学教育系列活动顺利有效开展</a></span>
                                        <span class="time-m">2015 / 09 / 25</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3447" rel="bookmark" target="_blank" title="信工学院第二十六届研究生科技论文报告会圆满结束">信工学院第二十六届研究生科技论文报告会圆满结束</a></span>
                                        <span class="time-m">2015 / 09 / 25</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3443" rel="bookmark" target="_blank" title="精准定位，布局未来——信工学院2013级本科生年级大会">精准定位，布局未来——信工学院2013级本科生年级大会</a></span>
                                        <span class="time-m">2015 / 09 / 25</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3235" rel="bookmark" target="_blank" title="积极向党组织汇报，接受党组织的考验  ——记信工学院入党积极分子拟发展为预备党员考核答辩">积极向党组织汇报，接受党组织的考验  ——记信工学院入党积极分子拟发展为预备党员考核答辩</a></span>
                                        <span class="time-m">2015 / 09 / 18</span>
                                    </li>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <li>
                                        <span class="tlist-m"><a href="http://xgxy.cug.edu.cn/?p=3177" rel="bookmark" target="_blank" title="信息工程学院2015年奖助学金评选通知">信息工程学院2015年奖助学金评选通知</a></span>
                                        <span class="time-m">2015 / 09 / 15</span>
                                    </li>
                                </div>
                            </div>
                        </ul>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <ul>
            <li><a target="_blank" href="http://www.cug.edu.cn">地大主页</a></li>
            <li><a target="_blank" href="http://jwc.cug.edu.cn">教务处</a></li>
            <li><a target="_blank" href="http://www.lib.cug.edu.cn/">图书馆</a></li>
            <li><a target="_blank" href="http://portal.cug.edu.cn/">数字信息平台</a></li>
        </ul>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">登陆页面</h4>
            </div>

            <div class="modal-body">
                <div class="input-group">
                    <span class="input-group-addon">姓名</span>
                    <input type="text" class="form-control" placeholder="Username">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">学号</span>
                    <input type="text" class="form-control" placeholder="Id">
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                    <span class="input-group-addon">
                    <input type="checkbox">
                        </span>
                        <input type="text" class="form-control" readonly="true" value="记住密码">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
                <a href="#">忘记密码</a>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabe2">readme</h4>
            </div>
            <div class="modal-body">
                <p>
                    这次作业做得有些仓促，刚开始是苦于想着设计一个好看的页面出来，结果发现自己想象力不行，就老老实实的
                    按照学院的主页来做的，最后是和老师的要求偏离一定要求，老师要求用js来控制效果，我快做完的时候发现用的很多搜是css
                    ,然后时间，我的整个作业是模块化拼接起来的，3D旋转什么的都是先做好一个工程在放进来的，一些组件用的都BootStrap组件，
                    是为了界面的好看。web这一块其实还是有很多要学习的，想做出好看的界面要一定的基本功，而且自己对这一块也感兴趣，希望在这实习过程中
                    锻炼自己。
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>