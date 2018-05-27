<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>修改密码</title>
    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@include file="../config.jsp" %>

    <script type="text/javascript">
        function Clear() {
            var ex = document.getElementById("explain");
            ex.innerHTML = "";


        }

        function Check() {

            var ps1, ps2;

            ps1 = document.getElementById("password1").value;
            ps2 = document.getElementById("password2").value;
            if (ps1 != ps2) {
                var h1 = "<p>两次密码不一致,请重新输入</p>";
                document.getElementById("explain").innerHTML = h1;
                document.getElementById("password1").value = "";
                document.getElementById("password2").value = "";
                document.getElementById("password1").onfocus;
            }
        }


    </script>

</head>
<body>

<div >

    <jsp:include page="navbar.jsp"></jsp:include>
</div>
<div class="leftnav">

    <jsp:include page="leftside.jsp"></jsp:include>
</div>

    <!-- MAIN -->
<div class="container fixmain">
    <div class="row clearfix">
        <div class="col-md-12 column ">
            <ul class="breadcrumb">

                <li>
                    <a href="#">安全信息</a>
                </li>
                <li class="active">
                    修改密码
                </li>
                <div style="float: right">
                    <a href="StuInfo.jsp"> 欢迎 ${studentpage.name}</a>
                    <img src="../Student/img/PC.png" width="40">
                </div>
            </ul>
                        <div class="panel-body">
                            <table class="table table-hover table-striped">
                                <form class="form-horizontal" action="../StuEditSecurityInfo" method="post">
                                    <div class="col-md-3 column">
                                    </div>
                                    <div class="col-md-9 column">

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">用户名</label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control"
                                                       value="${sessionScope.studentpage.username}" readonly>
                                            </div>
                                        </div>
                                        <br/><br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"> 新密码</label>
                                            <div class="col-sm-5">
                                                <input type="password" id="password1" class="form-control"
                                                       name="password"
                                                       placeholder="Please input new password" onfocus="Clear()">
                                            </div>
                                        </div>
                                        <br><br>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"> 重复密码</label>
                                            <div class="col-sm-5">
                                                <input type="password" id="password2" class="form-control"
                                                       name="password"
                                                       placeholder="Please copy new password" onchange="Check()">
                                                <div id="explain"><p></div>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="form-group">

                                            <div class="col-sm-offset-4 col-sm-2">
                                                <input type="submit" value="提交" class="btn btn-success">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </table>
                        </div>
        </div>
    </div>

                    </div>



</body>
</html>
