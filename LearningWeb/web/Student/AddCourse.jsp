<%--
  Created by IntelliJ IDEA.
  User: 16689
  Date: 2017/7/1
  Time: 21:22
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
    <%--<script src="https://use.fontawesome.com/61a9ff3a07.js"></script>--%>
    <%@include file="../config.jsp" %>
    <%@include file="../navbar_blue.jsp" %>

</head>
<body>
<%--<script src="js/jquery-2.1.1.js"></script>--%>
<%--<!-- Include all compiled plugins (below), or include individual files as needed -->--%>
<%--<script src="js/bootstrap.min.js"></script>--%>
<div id="wrapper">

    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="stu_home.jsp" class=""><span>主页</span></a></li>
                    <li>
                        <a href="#menu1" data-toggle="collapse" class="collapsed"><span>基本信息</span><i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="menu1" class="collapse">
                            <ul class="nav">
                                <li><a href="StuBaseInfo.jsp" class="">基本信息查询</a></li>
                                <li><a href="StuEditBaseInfo.jsp" class="">基本信息修改</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#menu2" data-toggle="collapse" class="collapsed"><span>安全信息</span><i
                                class="icon-submenu fa fa-angle-double-right"></i></a>
                        <div id="menu2" class="collapse ">
                            <ul class="nav">
                                <li><a href="StuEditSecurityInfo.jsp" class="">修改密码</a></li>
                                <li><a href="StuSecurityInfo.jsp" class="">找回密码</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <!-- MAIN -->
    <div  class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <div class="row">
                <h3 class="page-title">选课中心</h3>

                    <div class="col-md-2 column" style="color: #00a0f0">
                        <h3>已选课程</h3>
                        <c:if test="${sessionScope.course.choosedcount==0}">
                            <h3>快添加右侧课程</h3>
                        </c:if>
                        <c:if test="${sessionScope.course.choosedcount!=0}">
                            <ul>
                                <c:forEach var="i" begin="0" end="${sessionScope.course.choosedcount}" step="1">
                                    <c:if test="${i!=sessionScope.course.choosedcount}">
                                        <li>
                                            <a href="../ChooseCourse?courseid=${sessionScope.course.choosedcourses[i].id}">${sessionScope.course.choosedcourses[i].name}</a>
                                        </li>
                                    </c:if>

                                </c:forEach>
                            </ul>
                        </c:if>

                    </div>
                    <div class="col-md-8 column" >
                        <h3>
                            可选课程
                        </h3>
                        <c:if test="${sessionScope.course.canchoosecount==0}">
                            <h2>
                                系统资源库故障，等待恢复
                            </h2>

                        </c:if>
                        <c:if test="${sessionScope.course.canchoosecount!=0}">

                            <table class="table table-bordered">
                                <c:set var="count" value="0" > </c:set>

                                <c:forEach var="i" begin="0" end="${sessionScope.course.canchoosecount/3+1}" step="1">
                                    <tr>
                                        <c:forEach var="j"  begin="0" end="3" step="1">
                                            <c:if test="${count<sessionScope.course.canchoosecount}">
                                                <td>
                                                    this is : ${count+1}
                                                    <c:if test="${i!=sessionScope.course.canchoosecount}">
                                                        <ul>
                                                            <li> 名称：${sessionScope.course.canchoosecourses[count].name}</li>
                                                            <li>教师： ${sessionScope.course.canteacherPages[count].name}</li>



                                                            <c:if test="${sessionScope.course.suggestCourses[count].suggestcount>0}">

                                                                <c:forEach var="j" begin="0"
                                                                           end="${sessionScope.course.suggestCourses[count].suggestcount-1}"
                                                                           step="1">
                                                                    <li>
                                                                        <a href="../AddCourseToDb?courseid=${sessionScope.course.suggestCourses[count].suggestcourse[j].id}">前驱课程:${sessionScope.course.suggestCourses[count].suggestcourse[j].name}</a>
                                                                    </li>
                                                                </c:forEach>

                                                            </c:if>
                                                            <c:if test="${sessionScope.course.suggestCourses[count].suggestcount==0}"> <li>前驱课程:暂无</li> </c:if>
                                                            <a class="btn btn-success"
                                                               href="../AddCourseToDb?courseid=${sessionScope.course.canchoosecourses[count].id}">添加</a>
                                                        </ul>

                                                    </c:if>


                                                </td>
                                            </c:if>
                                            <c:set var="count" value="${count+1}"></c:set>




                                        </c:forEach>

                                    </tr>

                                </c:forEach>





                            </table>

                        <%--<c:forEach var="i" begin="0" end="${sessionScope.course.canchoosecount}" step="1">--%>
                        <%----%>
                    <%--</c:forEach>--%>
                    </c:if>
                    </div>

                    <div class="col-md-2 column"  style="color: red">
                        <h3>
                            推荐课程
                        </h3>
                        <p>
                            名称：${sessionScope.course.suggestcoursepage.name}
                        </p>

                        <a class="btn btn-success"
                           href="../AddCourseToDb?courseid=${sessionScope.course.suggestcoursepage.id}">添加课程</a>
                    </div>

            </div>
            </div>
</div>

    </div>
</div>

</body>
</html>
