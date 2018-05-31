<%--
  Created by IntelliJ IDEA.
  User: 16689
  Date: 2017/7/1
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>视频播放</title>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@include file="../config.jsp" %>

</head>
<body>
<div>

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
                    <a href="#">课程中心</a>
                </li>
                <li class="active">
                    成绩查询
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>
            </ul>

            <div class="panel-body">
                <div>
                    <video width="943" height="547" controls="controls">
                        <source src="${sessionScope.address}" type="video/mp4"/>
                        <source src="${sessionScope.address}" type="video/ogg"/>
                        <source src="${sessionScope.address}" type="video/webm"/>
                        <object data="${sessionScope.address}" width="943" height="547">
                            <embed src="${sessionScope.address}" width="943" height="547"/>
                        </object>
                    </video>
                </div>
            </div>
            <center>
                <a class="btn btn-danger btn-sm" href="StuChapterLearning.jsp">返回学习界面</a>
            </center>
        </div>
    </div>
</div>
</body>
</html>
