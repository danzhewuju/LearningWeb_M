<%--
  Created by IntelliJ IDEA.
  User: 16689
  Date: 2017/7/1
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>章节学习</title>
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
                <li >
                    课程学习
                </li>
                <li class="active">
                    章节学习
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>
            <div class="panel-body">
                <div class="row clearfix">
                    <div class="col-md-3 column">
                        <h3>
                            视频学习
                        </h3>
                        <div class="panel panel-success">
                            <c:if test="${sessionScope.learningdata.mp4count==0}">
                                <div class="panel-heading">
                                    <h3 class="panel-title text-danger">当前资料等待上传</h3>
                                </div>
                            </c:if>
                            <c:forEach var="i" begin="0" end="${sessionScope.learningdata.mp4count}"
                                       step="1">
                                <c:if test="${i!=sessionScope.learningdata.mp4count}">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <a href="../Play?address=${sessionScope.learningdata.learningmp4[i].address}&kind=视频">${sessionScope.learningdata.learningmp4[i].name}</a>
                                        </h3>
                                    </div>


                                </c:if>

                            </c:forEach>


                        </div>
                    </div>
                    <div class="col-md-3 column">
                        <h3>
                            PPT学习
                        </h3>
                        <div class="panel panel-danger">

                            <h3 class="panel-title">
                                <c:if test="${sessionScope.learningdata.pptcount==0}">
                                    <div class="panel-heading">
                                            <h3 class="panel-title text-danger">当前资料等待上传</h3>
                                    </div>
                                </c:if>
                                <c:forEach var="i" begin="0" end="${sessionScope.learningdata.pptcount}"
                                           step="1">
                                    <c:if test="${i!=sessionScope.learningdata.pptcount}">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                <a href="../Play?address=${sessionScope.learningdata.learningppt[i].address}&kind=PPT">${sessionScope.learningdata.learningppt[i].name}</a>
                                            </h3>
                                        </div>


                                    </c:if>

                                </c:forEach>
                            </h3>
                        </div>
                    </div>
                    <div class="col-md-3 column">
                        <h3>
                            文档学习
                        </h3>
                        <div class="panel panel-danger">

                            <h3 class="panel-title">
                                <c:if test="${sessionScope.learningdata.pdfcount==0}">
                                    <div class="panel-heading">
                                        <h3 class="panel-title text-danger">当前资料等待上传</h3>
                                    </div>
                                </c:if>
                                <c:forEach var="i" begin="0" end="${sessionScope.learningdata.pdfcount}"
                                           step="1">
                                    <c:if test="${i!=sessionScope.learningdata.pdfcount}">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                <a href="../Play?address=${sessionScope.learningdata.learningpdf[i].address}&kind=pdf">${sessionScope.learningdata.learningppt[i].name}</a>
                                            </h3>
                                        </div>


                                    </c:if>

                                </c:forEach>
                            </h3>
                        </div>
                    </div>
                    <div class="col-md-3 column">
                        <h3>
                            拓展练习
                        </h3>
                        <div class="panel panel-danger">

                            <h3 class="panel-title">
                                <c:if test="${sessionScope.learningdata.papercount==0}">
                                        <div class="panel-heading">
                                            <h3 class="panel-title text-danger">当前资料等待上传</h3>
                                        </div>
                                </c:if>
                                <c:forEach var="i" begin="0" end="${sessionScope.learningdata.papercount}"
                                           step="1">
                                    <c:if test="${i!=sessionScope.learningdata.papercount}">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                <a href="../Play?address=${sessionScope.learningdata.learningpaper[i].address}&kind=paper">${sessionScope.learningdata.learningppt[i].name}</a>
                                            </h3>
                                        </div>


                                    </c:if>

                                </c:forEach>
                            </h3>
                        </div>
                    </div>

                </div>


            </div>
            <center>
                <h4 class="color-picker"> 课后测验</h4>
                <h4><a class="btn btn-success" href="../StuTest"> 开始测试</a></h4>
            </center>
        </div>
    </div>
</div>
</body>
</html>
