<html>
<head>

    <%@include file="config.jsp"%>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container" style="width: 100%;height: 5%; background-color: rgb(39,44,52)">
    <div class="row clearfix" >
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <a class="navbar-brand logo" href="../home.jsp"><img src="../img/logo.png" width="80"></a>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/home.jsp"> <span class="glyphicon glyphicon-th-large" style="color: rgb(235, 123, 126); font-size: 15px;"> 主页</span></a></li>
                <li><a href="/showcourse.jsp"> <span class="glyphicon glyphicon-inbox" style="color: rgb(235, 123, 126); font-size: 15px;"> 课程</span></a></li>
                <li><a href="showteacher.jsp"> <span class="glyphicon glyphicon-user" style="color: rgb(235, 123, 126); font-size: 15px;"> 教师</span></a></li>
                <li><a href="about.jsp"> <span class="glyphicon glyphicon-search" style="color: rgb(235, 123, 126); font-size: 15px;"> 关于</span></a></li>
                <li><a href="/home/SafeExit"> <span class="glyphicon glyphicon-log-out" style="color: rgb(255, 0, 0); font-size: 15px;"> 退出</span></a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>