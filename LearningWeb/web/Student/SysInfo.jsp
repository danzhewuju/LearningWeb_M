<!DOCTYPE html>
<html>
<title>系统通知</title>
<head>
    <title></title>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@include file="../config.jsp" %>

</head>
<body>
<div >

    <jsp:include page="navbar.jsp"></jsp:include>
</div>
<div class="leftnav">

    <jsp:include page="leftside.jsp"></jsp:include>
</div>


<div class="container fixmain">
    <div class="row clearfix">
        <div class="col-md-12 column ">
            <ul class="breadcrumb">

                <li>
                    <a href="#">帮助反馈</a>
                </li>
                <li class="active">
                    系统通知
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>
<div class="col-md-12">
    <h4 class="text-center">目前没有通知</h4>

</div>

        </div>
    </div>
</div>
</body>
</html>