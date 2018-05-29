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

</head>
<body>
<div></div>

            <a href="data/链表.ppt">在线预览</a>

<form method="post" action="/ServletTest" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="submit" class="btn btn-primary" value="提交">
</form>

</body>
</html>
