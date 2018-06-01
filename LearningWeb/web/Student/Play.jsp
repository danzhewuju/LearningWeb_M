<!DOCTYPE html>
<html>
<head>
    <title>课程学习</title>
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
                    <a href="#">课程中心</a>
                </li>
                <li class="">
                    课程学习
                </li>
                <li class="">
                    章节学习
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>
            <c:choose>
                <c:when test="${sessionScope.kind=='视频'}">
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

                </c:when>
                <c:when test="${sessionScope.kind=='ppt'}">
                    <div class="text-center">
                        <jsp:include page="${sessionScope.address}"></jsp:include>
                    </div>

                </c:when>
                <c:when test="${sessionScope.kind=='pdf'}">
                    <div class="text-center">
                        <a href="${sessionScope.address}">在线预览</a>
                    </div>

                </c:when>
                <c:when test="${sessionScope.kind=='paper'}">
                    <div class="text-center">
                       <img src="${sessionScope.address}" class="img-responsive">
                    </div>

                </c:when>

            </c:choose>




        </div>
    </div>
</div>
</body>
</html>