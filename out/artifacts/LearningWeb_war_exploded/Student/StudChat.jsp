<!DOCTYPE html>
<html>
<title>论坛讨论</title>
<head>
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
                    课后讨论
                </li>
                <div style="float: right">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="${sessionScope.studentpage.picture}" width="40">
                </div>
            </ul>

            <div class="container">
                <div class="row clearfix">

                    <div class="col-md-3 column">
                        <div class="col-md-4  ">
                            <img alt="图片暂时丢失" src="${sessionScope.studentpage.picture}" class="img-rounded  " href=""
                                 style="width: 100px;height: 100px"/>
                        </div>
                        <div class="col-md-8 ">

                            <ul>
                                <li>
                                    ${sessionScope.studentpage.name}
                                </li>
                                <li>
                                    ${sessionScope.studentpage.gendar}
                                </li>
                                <li>
                                    ${sessionScope.studentpage.major}
                                </li>
                                <li>
                                    ${sessionScope.studentpage.status}
                                </li>
                                <li>
                                    ${sessionScope.studentpage.birthday}
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-12">
                            <h3>
                                拓展讨论群组
                            </h3>
                            <table class="table table-hover table-striped table-condensed">
                                <tbody>
                                <c:forEach var="c" items="${sessionScope.course.canchoosecourses}" varStatus="status">
                                    <tr class="success">


                                        <td>
                                            <img src="${c.picture}" width="40" >
                                                ${c.name}
                                        </td>


                                        <td>
                                            <a href="../StuBroChat?index=${status.index}&kind=left" ><button class="btn btn-primary">进入</button></a>
                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>
                            </table>

                        </div>

                    </div>
                    <div class="col-md-9 column">
                        <h3>
                            欢迎进入课后的习题讨论
                        </h3>
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>
                                    编号
                                </th>
                                <th>
                                    课程
                                </th>
                                <th>
                                    课程介绍
                                </th>
                                <th>
                                    进入围观
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${sessionScope.course.choosedcourses}" varStatus="status">
                                <tr class="success">

                                    <td>
                                        ${status.index+1}
                                    </td>
                                    <td>
                                        <img src="${c.picture}" width="70" >
                                        ${c.name}
                                    </td>
                                    <td>
                                        ${c.introduction}
                                    </td>

                                    <td>
                                        <a href="../StuBroChat?index=${status.index}&kind=main" ><button class="btn btn-danger">进入</button></a>
                                    </td>
                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>