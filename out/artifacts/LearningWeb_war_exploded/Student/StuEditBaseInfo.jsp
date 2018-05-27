<%--
  Created by IntelliJ IDEA.
  User: ycbhci
  Date: 2017/6/27
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>基本信息修改</title>

    <script type="text/javascript">
        function setDate() {//js正常日期的拆分
            var bir = "${sessionScope.studentpage.birthday}"
            document.getElementById("birthday").value = bir;
        }

        window.onload = setDate;
    </script>
    <%@include file="../config.jsp" %>

</head>
<body>

<!-- LEFT SIDEBAR -->
<div>

    <jsp:include page="navbar.jsp"></jsp:include>
</div>
<div class="leftnav">

    <jsp:include page="leftside.jsp"></jsp:include>
</div>
<!-- MAIN -->
<div class="container fixmain">
    <div class="row clearfix">
        <div class="col-md-12 column ">
            <h3 class="page-title">个人信息</h3>
            <div class="row">
                <!-- TABLE -->
                <div class="panel panel-info">

                    <ul class="breadcrumb">

                        <li>
                            <a href="#">基本信息</a>
                        </li>
                        <li class="active">
                            基本信息修改
                        </li>
                        <div style="float: right">
                            <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                            <img src="../Student/img/PC.png" width="40">
                        </div>
                    </ul>
                    <div class="panel-body">
                        <div class="col-md-2 column">
                        </div>
                        <form action="/StuEditInfo" method="post" >
                            <div class="col-md-5 column">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">昵称</label>
                                    <input type="text" id="name" class="form-control" name="name"
                                           value="${sessionScope.studentpage.name}"/>
                                    <br/>
                                    <label class="col-sm-2 control-label">生日</label>
                                    <input type="date" id="birthday" class="form-control" name="birthday"
                                           value=" "/>
                                    <br/>
                                    <label class="col-sm-2 control-label"> 学历</label>
                                    <input type="text" id="status" class="form-control" name="status"
                                           value="${sessionScope.studentpage.status}"/>
                                    <br/>
                                    <label class="col-sm-2 control-label"> 年级</label>
                                    <input type="text" id="gradar" class="form-control" name="grade"
                                           value="${sessionScope.studentpage.grade}"/>
                                    <br/>
                                    <label class="col-sm-2 control-label"> 邮箱</label>
                                    <input type="text" id="eamil" class="form-control" name="email"
                                           value="${sessionScope.studentpage.email}"/>
                                    <label class="col-sm-2 control-label"> 专业</label>
                                    <input type="text" id="major" class="form-control" name="major"
                                           value="${sessionScope.studentpage.major}"/>
                                    <input type="submit" value="确认"
                                           class="btn btn-success "/>

                                    <input type="reset" value="重置"
                                           class="btn btn-danger "/>

                            </div>

                            <%--<div class="col-md-3 column">
                                <img src="${sessionScope.studentpage.picture}"
                                     class="img-circle im" alt="头像">
                                <br/>
                                <input type="file" class="form-control" name="picurl"/>
                            </div>--%>




                            </div>

                        </form>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
