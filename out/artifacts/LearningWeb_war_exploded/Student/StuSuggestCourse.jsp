<%--
  Created by IntelliJ IDEA.
  User: alexanderdan
  Date: 2018/5/24
  Time: 08:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生课程推荐</title>
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
            <h4>内容推荐课程</h4>
            <div id="show_course">
                <c:if test="${sessionScope.course==null}">
                    <p class="text-center">当前数据库还没有完善！敬请期待</p>
                </c:if>
                <div class="container-fluid proj-bottom">

                    <div class="row">
                        <c:forEach var="c" items="${sessionScope.course.suggestcoursepages}" varStatus="Status">
                            <div class="col-md-4 col-sm-6 fh5co-project animate-box"
                                 data-animate-effect="fadeIn">
                                <a href="../ChooseCourse?courseid=${c.id}"><img
                                        src="${c.picture}"
                                        alt="图片丢失" class="img-responsive">
                                    <p> 课程名称： ${c.name}</p>
                                    <p>
                                        课程介绍： ${c.introduction}</p>
                                </a>
                            </div>

                        </c:forEach>
                    </div>

                </div>

            </div>
            <h4>协同过滤推荐</h4>
            <div id="show_course1">
                <c:if test="${sessionScope.course==null}">
                    <p class="text-center">当前数据库还没有完善！敬请期待</p>
                </c:if>
                <div class="container-fluid proj-bottom">

                    <div class="row">
                        <c:forEach var="c" items="${sessionScope.course.suggestcoursebyrelation}" varStatus="Status">
                            <div class="col-md-4 col-sm-6 fh5co-project animate-box"
                                 data-animate-effect="fadeIn">
                                <a href="../ChooseCourse?courseid=${c.id}"><img
                                        src="${c.picture}"
                                        alt="图片丢失" class="img-responsive">
                                    <p> 课程名称： ${c.name}</p>
                                    <p>
                                        课程介绍： ${c.introduction}</p>
                                </a>
                            </div>

                        </c:forEach>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
