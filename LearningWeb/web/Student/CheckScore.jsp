<!DOCTYPE html>
<html>
<title>分数查询</title>
<head>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@include file="../config.jsp" %>
    <%@include file="navbar.jsp" %>
</head>
<body>
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
                <div style="float: right">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>

            <c:forEach var="prosc" items="${sessionScope.progressstucou.progressCourseChapters}" varStatus="statusp">

            <h3 class="text-center">《${prosc.coursePage.name}》</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>
                        章节序号
                    </th>
                    <th>
                        章节名称
                    </th>
                    <th>
                        学生姓名
                    </th>
                    <th>
                        考试结果
                    </th>
                    <th>
                        状态
                    </th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="pcc" items="${prosc.chapterPages}" varStatus="status">

                    <tr>

                        <td>
                                ${pcc.number}
                        </td>
                        <td>
                                ${pcc.name}
                        </td>
                        <td>
                                ${prosc.studentPage.name}
                        </td>
                        <td>
                                ${prosc.scores[status.index]}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${prosc.scores[status.index]>=60}">
                                    <span class="glyphicon glyphicon-ok" style="color: rgb(0, 112, 0);"> 通过</span>
                                </c:when>
                                <c:when test="${prosc.scores[status.index]<60}">
                                    <span class="glyphicon glyphicon-warning-sign"
                                          style="color: rgb(255, 0, 0);"> 再接再厉</span>
                                </c:when>
                            </c:choose>

                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>

            <p>
                </c:forEach>

        </div>
    </div>


</div>
</body>
</html>