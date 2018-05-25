<%--
  Created by IntelliJ IDEA.
  User: alexanderdan
  Date: 2018/5/25
  Time: 08:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .fixmain{
            position: fixed;
            left: 15%;
            top: 10%;
            width: 84%;
            height: 100%
        }
        .leftnav{
            position: fixed;
            width: 15%;
            height: 100%;
            background-color: rgb(39,44,52);
        }

    </style>
    <%@include file="../config.jsp" %>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/chartist-custom.css">
    <link rel="stylesheet" href="../css/ad_main.css">
    <script src="https://use.fontawesome.com/61a9ff3a07.js"></script>

</head>
<body>

<div id="sidebar-nav" class="sidebar">
    <div class="sidebar-scroll">
        <nav>
            <ul class="nav">
                <li><a href="stu_home.jsp" class=""><span>主页</span></a></li>
                <li>
                    <a href="#menu1" data-toggle="collapse" class="collapsed "><span>基本信息</span><i
                            class="icon-submenu fa fa-angle-double-right"></i></a>
                    <div id="menu1" class="collapse">
                        <ul class="nav">
                            <li><a href="StuBaseInfo.jsp" class="">基本信息查询</a></li>
                            <li><a href="StuEditBaseInfo.jsp" class="">基本信息修改</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#menu2" data-toggle="collapse" class="collapsed"><span>安全信息</span><i
                            class="icon-submenu fa fa-angle-double-right"></i></a>
                    <div id="menu2" class="collapse ">
                        <ul class="nav">
                            <li><a href="StuEditSecurityInfo.jsp" class="">修改密码</a></li>
                            <li><a href="StuSecurityInfo.jsp" class="">找回密码</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#menu3" data-toggle="collapse" class="collapsed"><span>课程中心</span><i
                            class="icon-submenu fa fa-angle-double-right"></i></a>
                    <div id="menu3" class="collapse ">
                        <ul class="nav">
                            <li><a href="stu_home.jsp" class="active ">正在学习课程</a></li>
                            <li><a href="../AddCourseServlet" class="">选择课程</a></li>
                            <li><a href="../SuggestCourse" class="">课程推荐</a></li>
                            <li><a href="#" class="">课程学习</a></li>
                            <li><a href="../StuCheckScore" class="">成绩查询</a></li>
                            <li><a href="#" class="">学习交流</a></li>
                            <li><a href="#" class="">资源分享</a></li>

                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#menu4" data-toggle="collapse" class="collapsed"><span>帮助和反馈</span><i
                            class="icon-submenu fa fa-angle-double-right"></i></a>
                    <div id="menu4" class="collapse ">
                        <ul class="nav">
                            <li><a href="#" class="">投诉</a></li>
                            <li><a href="#" class="">系统通知</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
