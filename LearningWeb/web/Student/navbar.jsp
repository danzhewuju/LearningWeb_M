<html>
<head>

    <%@include file="config.jsp" %>
    <style type="text/css">

        #topnav {

        }
        #topnav li {
            list-style: none; /* 将默认的列表符号去掉 */
            padding: 10px; /* 将默认的内边距去掉 */
            margin: 10px; /* 将默认的外边距去掉 */
            float: left;
            font-size: 17px;


        }
        #topnav li a:hover {
            background: #1d7db1; /* 变换背景色 */
            color: #fff; /* 变换文字颜色 */
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container" style="width: 100%;height: 7%; background-color: rgb(39,44,52) ;overflow: auto">
    <div class="row clearfix">
        <div class="collapse navbar-collapse" >

            <a class="navbar-brand logo" href="../home.jsp"><img src="../img/logo.png" width="100"></a>
            <ul style="float: right" id="topnav">
                <li><a href="/home.jsp"> <span class="glyphicon glyphicon-home"
                                               style="color: rgb(235, 123, 126); "> 主页</span></a></li>
                <li><a href="/showcourse.jsp"> <span class="glyphicon glyphicon-inbox"
                                                     style="color: rgb(235, 123, 126); "> 课程</span></a>
                </li>
                <li><a href="showteacher.jsp"> <span class="glyphicon glyphicon-user"
                                                     style="color: rgb(235, 123, 126); "> 教师</span></a>
                </li>
                <li><a href="about.jsp"> <span class="glyphicon glyphicon-search"
                                               style="color: rgb(235, 123, 126); "> 关于</span></a></li>
                <li><a href="/home/SafeExit"> <span class="glyphicon glyphicon-log-out"
                                                    style="color: rgb(255, 0, 0); "> 退出</span></a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>