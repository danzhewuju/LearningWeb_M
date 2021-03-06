<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2017/6/29
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师主页|淘课-基于知识地图的多元化学习网站</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

    <!-- CSS -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/ad_main.css">
    <script src="https://use.fontawesome.com/61a9ff3a07.js"></script>
    <%@include file="../config.jsp" %>
    <%@include file="../navbar_blue.jsp" %>
</head>
<body>
<div id="wrapper">
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="T-homepage.jsp" class="active"><span>Home</span></a></li>
                    <li>
                        <a href="#subPages1" data-toggle="collapse" class=""><span>Student</span> <i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="subPages1" class="collapse">
                            <ul class="nav">
                                <li><a href="T-display.jsp" class="">查看学生信息</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPages2" data-toggle="collapse" class=""><span>Course</span> <i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="subPages2" class="collapse">
                            <ul class="nav">
                                <li><a href="T-courset.jsp" class="">课程设置</a></li>
                                <li><a href="T-uploadpage.jsp" class="">课程管理</a></li>
                                <li><a href="T-applypage.jsp" class="">课程申请</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="T-info.jsp" class=""><span>Person Center</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <a class="btn btn-danger" style="float: right" href="T-newchapt.jsp">添加新章节</a>
            <div class="container-fluid">
                <h3 class="page-title">课程设置</h3>
                <div class="row">
                    <!-- TABLE -->
                    <div class="panel panel-info">
                        <ul class="breadcrumb">
                            <li>
                                <a href="T-homepage.jsp">主页</a>
                            </li>
                            <li>
                                <a href="#">课程管理</a>
                            </li>
                            <li class="active">
                                课程设置
                            </li>
                        </ul>
                        <div class="panel-body">
                            <form class="form-signin" name="form1" method="post" action="applyclass.do">
                                <fieldset>
                                    <legend>章节列表</legend>
                                    <div>
                                        <div>
                                            <font>${result2}</font>
                                            <table class="table table-hover">
                                                <th>章节ID</th>
                                                <th>章节名</th>
                                                <c:forEach var="as" items="${chlist}"
                                                           varStatus="status">
                                                    <c:if test="${status.count%2==0 }"><tr ></c:if>
                                                    <c:if test="${status.count%2!=0 }"><tr class="info" ></c:if>

                                                    <td> ${as.id} </td>
                                                    <td>${as.name}</td>

                                                    <td><a class="btn btn-success" href="T-courset3.jsp?chaid=${as.id}">添加前序</a>
                                                    </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                        <a class="btn btn-danger" href="T-courset.jsp">返回</a>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
