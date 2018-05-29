<!DOCTYPE html>
<html>
<title>投诉</title>
<head>
    <title></title>
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
                    <a href="#">帮助和反馈</a>
                </li>
                <li class="active">
                    投诉
                </li>
                <div style="float: right;">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>

            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="page-header">
                            <h1>
                                投诉
                                <small>别着急，你的意见是我们进步的动力</small>
                            </h1>
                        </div>
                        <h3>
                            你在这里提交你的诉求，我们会尽快处理，感谢您的支持
                        </h3>
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">投诉诉求</label>
                                <div class="col-sm-10">
                                    <div class="col-sm-2"><input type="radio" name="kind" value="教师投诉"> 教师投诉</div>
                                    <div class="col-sm-2"><input type="radio" name="kind" value="系统错误">系统错误</div>
                                    <div class=class="col-sm-2"><input type="radio" name="kind" value="其他"> 其他</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">投诉连接</label>
                                <div class="col-sm-5">
                                    <input type="email" class="form-control " id="inputEmail3" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">投诉内容</label>
                                <div class="col-sm-10">
                                    <textarea rows="10" cols="56" ></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail5" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-3">
                                    <input type="email" class="form-control " id="inputEmail5" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail4" class="col-sm-2 control-label">联系方式</label>
                                <div class="col-sm-3">
                                    <input type="email" class="form-control " id="inputEmail4" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
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