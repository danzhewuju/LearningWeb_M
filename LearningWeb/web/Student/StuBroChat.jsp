<!DOCTYPE html>
<html>
<title>学习交流</title>
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
                    学习交流
                </li>
                <div style="float: right">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>

            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <h3>
                            ${sessionScope.chat.coursePage.name} 版块
                        </h3>
                        <div class="row clearfix">
                            <div class="col-md-6 column">
                                <c:if test="${sessionScope.chat.chatPapersBycid==null}">
                                    <div class="well">
                                        <h3>现在没有人发帖，赶紧占个沙发！</h3>

                                    </div>

                                </c:if>
                                <c:forEach var="c" items="${sessionScope.chat.chatPapersBycid}" varStatus="status">

                                    <div class="well">
                                        <p class="small">${status.index+1}楼</p>
                                        <h3 class="text-success" >
                                               主题： ${c.titles}
                                        </h3>
                                        <p >
                                                ${c.content}
                                        </p>
                                        <p class="text-right"> 发帖人:${c.studentPage.name} 发帖时间：${c.time}</p>

                                    </div>

                                </c:forEach>


                            </div>
                            <div class="col-md-6 column">
                                <form role="form" method="post" action="../StuBroChat" >

                                    <div class="form-group">
                                        <input type="text" class="form-control text-danger " id="exampleInputPassword1"
                                               name="title" placeholder="请输入标题"/>
                                        <textarea name="content" id="" cols="30" rows="20" class="form-control"
                                                  style="margin-top: 3%;" placeholder="请输入正文内容"></textarea>
                                    </div>

                                    <button type="submit" class="btn btn-success col-md-offset-10">Submit</button>
                                </form>
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