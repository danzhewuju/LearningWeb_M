<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 0:04
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
    <style>
        body {
            overflow-x: hidden;
        }
    </style>

</head>
<body>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="DAO.*" %>
<%@page import="Entity.*" %>
<%@page import="Page.*" %>
<%@ page import="java.util.List" %>

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
            <a class="btn btn-danger" style="float: right" href="Admin-RelAdd.jsp">添加课程关系</a>

            <div class="container-fluid">
                <h3 class="page-title">课程关系管理</h3>
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
                                课程关系管理
                            </li>
                        </ul>

                        <div class="panel-body">

                            <div class="container-fluid">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>课程号</th>
                                                <th>课程名称</th>
                                                <th>先修课程号</th>
                                                <th>先修课程名称</th>
                                                <th>修改</th>
                                                <th>删除</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                response.setContentType("text/html;charset=UTF-8");
                                                request.setCharacterEncoding("UTF-8");
                                                RelationDAO dao = new RelationDAO();
                                                List<RelationPage> list = dao.GetAll();
                                                int t = list.size();
                                                request.getSession().setAttribute("relationlist", list);
                                                CourseDAO courseDAO =new CourseDAO();
                                                ArrayList<CoursePage> coursepages1 = new ArrayList<>();
                                                ArrayList<CoursePage> coursepages2 = new ArrayList<>();
                                                for (int i=0;i<t;i++)
                                                {
                                                    CoursePage coursePage1 = courseDAO.GetByColumn("id",list.get(i).getCourseid());
                                                    CoursePage coursePage2 = courseDAO.GetByColumn("id",list.get(i).getFrontcourseid());
                                                    coursepages1.add(coursePage1);
                                                    coursepages2.add(coursePage2);
                                                }
                                                request.getSession().setAttribute("coursepage1",coursepages1);
                                                request.getSession().setAttribute("coursepage2",coursepages2);


                                            %>
                                            <c:forEach var="r" items="${sessionScope.relationlist}" varStatus="status">
                                                <tr class="success">
                                                    <td>${r.id}</td>
                                                    <td>${r.courseid}</td>
                                                    <td>${sessionScope.coursepage1[status.index].name}</td>
                                                    <td>${r.frontcourseid}</td>
                                                    <td>${sessionScope.coursepage2[status.index].name}</td>

                                                    <td><a href="Admin-RelUpd.jsp?ID=${status.index}"
                                                           class="btn btn-info"
                                                           role="button">修改</a></td>
                                                    <td><a href="../AdminDelete?ID=${status.index}&type=4"
                                                           class="btn btn-danger" role="button">删除</a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
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
