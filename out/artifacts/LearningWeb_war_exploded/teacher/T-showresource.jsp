<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2017/7/2
  Time: 21:48
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
<% String address = request.getParameter("add");
    String kind = request.getParameter("kind");
    request.getSession().setAttribute("address", address);
    request.getSession().setAttribute("kind", kind);
%>
<div id="wrapper">
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="T-homepage.jsp" class="active"><span>主页</span></a></li>
                    <li>
                        <a href="#subPages1" data-toggle="collapse" class=""><span>学生</span> <i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="subPages1" class="collapse">
                            <ul class="nav">
                                <li><a href="T-display.jsp" class="">查看学生信息</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPages2" data-toggle="collapse" class=""><span>课程</span> <i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="subPages2" class="collapse">
                            <ul class="nav">
                                <li><a href="T-courset.jsp" class="">课程设置</a></li>
                                <li><a href="T-uploadpage.jsp" class="">课程管理</a></li>
                                <li><a href="T-applypage.jsp" class="">课程申请</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="T-info.jsp" class=""><span>个人中心</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <h3 class="page-title">资源管理</h3>
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
                                资源查看
                            </li>
                        </ul>

                        <c:choose>
                            <c:when test="${sessionScope.kind=='pdf'}">
                                <a href="${sessionScope.address}" class="center-block">点击预览</a>

                            </c:when>
                        <c:when test="${sessionScope.kind=='ppt'}" >
                            <a href="${sessionScope.address} " class="center-block">点击预览</a>
                        </c:when>

                            <c:when test="${sessionScope.kind=='视频'}">
                                <fieldset>
                                    <legend>${cd.chname}</legend>

                                    <video width="320" height="240" controls="controls">
                                        <source src=${sessionScope.address} type="video/mp4"/>
                                        <source src=${sessionScope.address} type="video/ogg"/>
                                        <source src=${sessionScope.address} type="video/webm"/>
                                        <object data=${sessionScope.address} width="320" height="240">
                                            <embed src=${sessionScope.address} width="320" height="240"/>
                                        </object>
                                    </video>
                                </fieldset>
                            </c:when>

                        </c:choose>

                        <%--<div class="panel-body">
                            <form class="form-signin" name="form1" method="post" action="../upload.do">
                                <fieldset>
                                    <legend>${cd.chname}</legend>

                                    <video width="320" height="240" controls="controls">
                                        <source src=${sessionScope.address} type="video/mp4"/>
                                        <source src=${sessionScope.address} type="video/ogg"/>
                                        <source src=${sessionScope.address} type="video/webm"/>
                                        <object data=${sessionScope.address} width="320" height="240">
                                            <embed src=${sessionScope.address} width="320" height="240"/>
                                        </object>
                                    </video>
                                </fieldset>
                            </form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
