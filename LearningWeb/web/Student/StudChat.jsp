<!DOCTYPE html>
<html>
<title>论坛讨论</title>
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
                    <div class="col-md-4 column">
                        <img alt="140x140" src="${sessionScope.studentpage.picture}" />
                        <ul class="list-unstyled">
                            <li>
                                ${sessionScope.studentpage.name}
                            </li>


                        </ul>
                    </div>
                    <div class="col-md-8 column">
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
                                    产品
                                </th>
                                <th>
                                    交付时间
                                </th>
                                <th>
                                    状态
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                                    <td>
                                        1
                                    </td>
                                    <td>
                                        TB - Monthly
                                    </td>
                                    <td>
                                        01/04/2012
                                    </td>
                                    <td>
                                        Default
                                    </td>
                            </tr>
                            <tr class="success">
                                <td>
                                    1
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    01/04/2012
                                </td>
                                <td>
                                    Approved
                                </td>
                            </tr>
                            <tr class="error">
                                <td>
                                    2
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    02/04/2012
                                </td>
                                <td>
                                    Declined
                                </td>
                            </tr>
                            <tr class="warning">
                                <td>
                                    3
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    03/04/2012
                                </td>
                                <td>
                                    Pending
                                </td>
                            </tr>
                            <tr class="info">
                                <td>
                                    4
                                </td>
                                <td>
                                    TB - Monthly
                                </td>
                                <td>
                                    04/04/2012
                                </td>
                                <td>
                                    Call in to confirm
                                </td>
                            </tr>
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