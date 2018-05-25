<%--
  Created by IntelliJ IDEA.
  User: Amos
  Date: 2017/6/27
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的课程|淘课-基于知识地图的多元化学习网站</title>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="x-ua-compatible" content="IE=9"/><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MAPS|淘课-基于知识地图的多元化学习网站</title>

    <!-- CSS -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/chartist-custom.css">
    <link rel="stylesheet" href="../css/ad_main.css">
    <script src="https://use.fontawesome.com/61a9ff3a07.js"></script>
    <%@include file="../config.jsp" %>
    <%@include file="../navbar_blue.jsp" %>

</head>
<body>
<div id="wrapper">
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
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div style="float: right">
                <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                <img src="../Student/img/PC.png" width="40">
            </div>
            <div class="container-fluid">
                <h3 class="page-title">我的课程</h3>
                <div class="row">
                    <!-- TABLE -->
                    <div class="panel panel-info">
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">我的课程</a>
                            </li>
                            <li class="active">
                                正在学习
                            </li>
                        </ul>
                        <div id="show_course">
                            <div class="container-fluid proj-bottom">

                                <div class="row">
                                    <c:forEach var="i" begin="0" end="${sessionScope.selectedcourses.count}" step="1">
                                        <c:if test="${i!=sessionScope.selectedcourses.count}">
                                            <div class="col-md-4 fh5co-project animate-box"
                                                 data-animate-effect="fadeIn">
                                                <a href="../ChooseCourse?courseid=${sessionScope.selectedcourses.coursePages[i].id}"><img
                                                        src="${sessionScope.selectedcourses.coursePages[i].picture}"
                                                        alt="#" class="img-responsive">
                                                    <p> 课程名称： ${sessionScope.selectedcourses.coursePages[i].name}</p>
                                                    <p>
                                                        课程介绍： ${sessionScope.selectedcourses.coursePages[i].introduction}</p>
                                                    <%--<div class="col-md-10 ">--%>

                                                        <div class="progress" style="width: 300px">
                                                            <div class="progress-bar " role="progressbar"
                                                                 aria-valuenow="100"
                                                                 aria-valuemin="0" aria-valuemax="100"
                                                                 style="width: ${sessionScope.selectedcourses.finishpersentage[i]}%">
                                                            </div>
                                                        </div>
                                                    <%--</div>--%>

                                                </a>

                                                    <%--<p> 进度:${sessionScope.selectedcourses.finishpersentage[i]}%</p>--%>
                                                </a>
                                            </div>

                                        </c:if>

                                    </c:forEach>


                                </div>
                                <center>
                                    <ul class="pagination">
                                        <li>
                                            <a href="#">Prev</a>
                                        </li>
                                        <li>
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <a href="#">4</a>
                                        </li>
                                        <li>
                                            <a href="#">5</a>
                                        </li>
                                        <li>
                                            <a href="#">Next</a>
                                        </li>
                                    </ul>
                                </center>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>


</body>
</html>
