<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/25
  Time: 21:16
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

</head>
<body>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="DAO.*" %>
<%@page import="Entity.*" %>
<%@page import="Page.*" %>
<%@ page import="Database.AddCourseDao" %>

<!-- WRAPPER -->
<div id="wrapper">
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="AdminHeadPage.jsp" class=""><span>Home</span></a></li>
                    <li><a href="Admin-StuSel.jsp" class=""> <span>Student</span></a></li>
                    <li>
                        <a href="#menu1" data-toggle="collapse" class="collapsed"><span>Course</span><i
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
                        <a href="#menu2" data-toggle="collapse" class="collapsed"><span>Teacher</span><i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="menu2" class="collapse ">
                            <ul class="nav">
                                <li><a href="Admin-TeaSel.jsp" class="">教师信息管理</a></li>
                                <li><a href="Admin-TeaAdd.jsp" class="">添加新教师</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="Admin-VerTab.jsp" class=""><span>Record</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <h3 class="page-title">课程管理</h3>
                <div class="row">
                    <!-- TABLE -->
                    <div class="panel panel-info">
                        <ul class="breadcrumb">
                            <li>
                                <a href="AdminHeadPage.jsp">主页</a>
                            </li>
                            <li>
                                <a href="#">课程管理</a>
                            </li>
                            <li class="active">
                                课程审核
                            </li>
                        </ul>
                        <div class="panel-body">
                            <%
                                response.setContentType("text/html;charset=UTF-8");
                                request.setCharacterEncoding("UTF-8");
                                AddCourseDao dao = new AddCourseDao();
                                List<Course> list = dao.findTeacherCourse("未查看");

                                request.getSession().setAttribute("teacoulist", list);
                                if (list == null || list.size()==0) {
                            %>
                            <p class="text-center">
                                暂无教师申请新的课程
                            </p>

                            <%
                            } else {
                            %>
                            <table class="table">
                                <thead>
                                <tr>


                                    <th>课程名</th>
                                    <th>教师用户名</th>
                                    <th>任课教师</th>
                                    <th>先修课程号</th>
                                    <th>同意</th>
                                    <th>不同意</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${sessionScope.teacoulist}" varStatus="status">
                                    <tr class="warning">
                                        <td>${c.coursename}</td>
                                        <td>${c.tusername}</td>
                                        <td>${c.tname}</td>
                                        <td>${c.precourse1} ${c.precourse2} ${c.precourse3} ${c.precourse4}</td>
                                        <td><a href="../AdminVerApp?ID=${status.index}&type=1" class="btn btn-info"
                                               role="button">同意</a></td>
                                        <td><a href="../AdminVerApp?ID=${status.index}&type=2" class="btn btn-danger"
                                               role="button">不同意</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%
                                }
                            %>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
