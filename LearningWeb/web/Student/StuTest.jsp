<%--
  Created by IntelliJ IDEA.
  User: 16689
  Date: 2017/7/2
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>学生测试</title>
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

            <c:choose>
                <c:when test="${sessionScope.question.examcount==0}"><h3>该课程的试题还没有上传，你到别处看看！</h3></c:when>
                <c:otherwise>
                    <div class="panel-body">
                        <h3>正在进行章节测试，请将答案填写在右侧答题卡上</h3>
                        <div class="col-md-8 column">
                            <img alt="#" src="${sessionScope.question.usingexampage.address}"/>
                        </div>
                        <div class="col-md-4 column">
                            <form class="form-horizontal" action="/Evaluate" method="post">
                                <ol>
                                    <c:forEach var="i" begin="0" end="${sessionScope.question.count}"
                                               step="1">
                                        <c:if test="${i!=sessionScope.question.count}">
                                            <div class="col-sm-offset-4">

                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label">A <input
                                                            type="radio"
                                                            name="radio${i}"
                                                            class="radio"
                                                            value="A"></label>
                                                    <label class="col-sm-1 control-label">B <input
                                                            type="radio"
                                                            name="radio${i}"
                                                            class="radio"
                                                            value="B"></label>
                                                    <label class="col-sm-1 control-label">C <input
                                                            type="radio"
                                                            name="radio${i}"
                                                            class="radio"
                                                            value="C"></label>
                                                    <label class="col-sm-1 control-label">D <input
                                                            type="radio"
                                                            name="radio${i}"
                                                            class="radio"
                                                            value="D"></label>
                                                </div>
                                            </div>


                                        </c:if>

                                    </c:forEach>
                                </ol>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-10">
                                        <button type="submit" class="btn btn-success">提交</button>
                                        <button type="reset" class="btn btn-danger">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>


                    </div>

                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>
</body>
</html>
