<%--
  Created by IntelliJ IDEA.
  User: alexanderdan
  Date: 2018/5/20
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>登录窗口</title>
    <link rel="stylesheet" href="login_css/login.css" />
    <script type="text/javascript" src="login_js/jquery-3.2.1.min.js"></script>
</head>
<body>
<input type="button" class="click" value="点击登录" />
<div class="login">
    <div class="title">登陆窗口<span></span></div>
    <div class="user">
        <span class="user-logo">&nbsp;</span>
        <form action="post" class="form">
            <input type="text" placeholder="请输入用户名" name="userNum" id="userNum" />
        </form>
        <span class="user-reset"></span>
    </div>
    <div class="password">
        <span class="password-logo">&nbsp;</span>
        <form action="post" class="form">
            <input type="password" placeholder="请输入密码" name="passwordNum" id="passwordNum" />
        </form>
        <span class="password-reset"></span>
    </div>
    <p class="word"></p>
    <input class="loginBtn" type="button" name="login" value="登陆">
</div>

<script type="text/javascript" src="login_js/login.js"></script>
</body>
</html>
