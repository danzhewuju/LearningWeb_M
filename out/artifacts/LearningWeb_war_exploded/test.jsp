<%--
  Created by IntelliJ IDEA.
  User: alexanderdan
  Date: 2018/5/29
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="config.jsp"%>
    <script  type="text/javascript">
        function reset() {
            var url = document.getElementById("yzm_img_real").getAttribute("src");
            var randomnum = Math.random();
            document.getElementById("yzm_img_real").setAttribute("src",url+"?"+randomnum);}
    </script>
</head>
<body>
<div id="yzm_img" ><img src="/ServletTest" width="100px" id="yzm_img_real" onclick="reset()"></div>

</body>
</html>
