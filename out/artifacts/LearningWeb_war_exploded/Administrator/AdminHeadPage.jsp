<%@ page import="DAO.TeacherDAO" %>
<%@ page import="DAO.StudentDAO" %>
<%@ page import="DAO.CourseDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Page.TeacherPage" %>
<%@ page import="Page.StudentPage" %>
<%@ page import="Page.CoursePage" %><%--
  Created by IntelliJ IDEA.
  User: Amos
  Date: 2017/6/28
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
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
    <style type="text/css">
        body {
            overflow-x: hidden;
            overflow-y: hidden;
        }
    </style>
</head>
<body>
<%
    TeacherDAO teacherDAO=new TeacherDAO();
    StudentDAO studentDAO=new StudentDAO();
    CourseDAO courseDAO=new CourseDAO();
    ArrayList<TeacherPage> teacherPages= (ArrayList<TeacherPage>) teacherDAO.GetAll();
    ArrayList<StudentPage> studentPages= (ArrayList<StudentPage>) studentDAO.GetAll();
    ArrayList<CoursePage> coursePages= (ArrayList<CoursePage>) courseDAO.GetAll();
    request.getSession().setAttribute("teacherPages",teacherPages);
    request.getSession().setAttribute("studentPages",studentPages);
    request.getSession().setAttribute("coursePages",coursePages);


%>
<div id="wrapper">
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="AdminHeadPage.jsp" class=""><span>主页</span></a></li>
                    <li><a href="Admin-StuSel.jsp" class=""> <span>学生管理</span></a></li>
                    <li>
                        <a href="#menu1" data-toggle="collapse" class="collapsed"><span>课程管理</span><i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="menu1" class="collapse">
                            <ul class="nav">
                                <li><a href="Admin-CouSel.jsp" class="">课程信息管理</a></li>
                                <li><a href="Admin-RelSel.jsp" class="">课程关系管理</a></li>
                                <li><a href="Admin-CouAdd.jsp" class="">添加新课程</a></li>
                                <li><a href="Admin-Verify.jsp" class="">审核新课程</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#menu2" data-toggle="collapse" class="collapsed"><span>教师管理</span><i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="menu2" class="collapse ">
                            <ul class="nav">
                                <li><a href="Admin-TeaSel.jsp" class="">教师信息管理</a></li>
                                <li><a href="Admin-TeaAdd.jsp" class="">添加新教师</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="Admin-VerTab.jsp" class=""><span>记录中心</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-headline">
                    <div class="panel-heading">
                        <h3 class="panel-title">Welcome back!</h3>
                        <p class="panel-subtitle">Last time log out: July 4, 2017</p>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div href="Admin-StuSel.jsp" class="metric">
                                    <span class="icon"><i class="fa fa-user"></i></span>
                                    <p>
                                        <span class="number">${fn:length(sessionScope.studentPages)}</span>
                                        <span class="title">Students</span>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div href="Admin-CouSel.jsp" class="metric">
                                    <span class="icon"><i class="fa fa-th-list"></i></span>
                                    <p>
                                        <span class="number">${fn:length(sessionScope.coursePages)}</span>
                                        <span class="title">Courses</span>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div href="Admin-TeaSel.jsp" class="metric">
                                    <span class="icon"><i class="fa fa-male"></i></span>
                                    <p>
                                        <span class="number">${fn:length(sessionScope.teacherPages)}</span>
                                        <span class="title">Teachers</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END OVERVIEW -->
                <div class="row">
                    <div class="col-md-6">
                        <!-- RECENT CHANGE -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Courses</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i>
                                    </button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>
                            <div class="panel-body no-padding">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>名字</th>
                                        <th>类别</th>
                                        <th>介绍</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="c" items="${sessionScope.coursePages}" varStatus="status">
                                       <c:if test="${status.index<5}">

                                           <tr>
                                               <td><a href="#">${c.id}</a></td>
                                               <td>${c.name}</td>
                                               <td>${c.kind}</td>
                                               <td>${c.introduction}</td>
                                               <td><span class="label label-success">Detail</span></td>
                                           </tr>
                                       </c:if>

                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span>
                                </div>
                                <div class="col-md-6 text-right"><a href="Admin-CouSel.jsp" class="btn btn-success">View All
                                    Courses</a></div>
                            </div>
                        </div>
                        <!-- END RECENT PURCHASES -->
                    </div>
                    <div class="col-md-6">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Page View</h3>
                            </div>
                            <img src="../img/count.png" width="480" height="280">
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END WRAPPER -->
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.js"></script>

</body>

</html>
