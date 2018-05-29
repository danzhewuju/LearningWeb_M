<!DOCTYPE html>
<html>
<title>学习界面</title>
<head>
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
            <div style="float: right">
                <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                <img src="../Student/img/PC.png" width="40">
            </div>
            <div class="container-fluid">
                <h3 class="page-title">我的课程</h3>
                <div class="row">
                    <!-- TABLE -->
                    <div class="panel panel-info">
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">我的课程</a>
                            </li>
                            <li class="active">
                                正在学习
                            </li>
                        </ul>
                        <div id="show_course">
                            <div class="container-fluid proj-bottom">

                                <div class="row">
                                    <c:forEach var="i" begin="0" end="${sessionScope.selectedcourses.count}" step="1">
                                        <c:if test="${i!=sessionScope.selectedcourses.count}">
                                            <div class="col-md-4 fh5co-project animate-box"
                                                 data-animate-effect="fadeIn">
                                                <a href="../ChooseCourse?courseid=${sessionScope.selectedcourses.coursePages[i].id}"><img
                                                        src="${sessionScope.selectedcourses.coursePages[i].picture}"
                                                        alt="#" class="img-responsive">
                                                    <p> 课程名称： ${sessionScope.selectedcourses.coursePages[i].name}</p>
                                                    <p>
                                                        课程介绍： ${sessionScope.selectedcourses.coursePages[i].introduction}</p>
                                                    <%--<div class="col-md-10 ">--%>

                                                        <div class="progress progress-striped active" style="width: 300px">
                                                            <div class="progress-bar " role="progressbar"
                                                                 aria-valuenow="100"
                                                                 aria-valuemin="0" aria-valuemax="100"
                                                                 style="width: ${sessionScope.selectedcourses.finishpersentage[i]}%">
                                                            </div>
                                                        </div>
                                                    <%--</div>--%>

                                                </a>

                                                    <%--<p> 进度:${sessionScope.selectedcourses.finishpersentage[i]}%</p>--%>
                                                </a>
                                            </div>

                                        </c:if>

                                    </c:forEach>


                                </div>
                                <center>
                                    <ul class="pagination">
                                        <li>
                                            <a href="#">Prev</a>
                                        </li>
                                        <li>
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <a href="#">4</a>
                                        </li>
                                        <li>
                                            <a href="#">5</a>
                                        </li>
                                        <li>
                                            <a href="#">Next</a>
                                        </li>
                                    </ul>
                                </center>
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
