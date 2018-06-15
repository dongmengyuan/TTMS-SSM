<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/Bootstrap/bs.css">
    <link rel="stylesheet" href="./css/css/login.css">
    <title>login</title>
</head>
<body>
    <h1>${emp.empName}</h1>
    <div class="container">
        <h1>欢迎使用JerryMouse影院管理系统</h1>
        <div id="login">
            <div id="alert"></div>
            <form role="form" method="post" action="/login" onsubmit="return confirm()">
                <div class="form-group">
                    <p align="center">用户名</p>
                    <input type="text" class="form-control" name="username" id="name" placeholder="请输入账号" required="required" autofocus>
                </div>
                <div class="form-group">
                    <p align="center">密码</p>
                    <input type="password" class="form-control" name="password" id="pass" placeholder="请输入密码" required="required">
                </div>
                <div id="but">
                    <button type="submit" class="btn btn-primary  btn-block" onclick="confirm()">登陆</button>
                </div>
            </form>
        </div>
    </div>

<script src="./js/javascript/login.js"></script>
</body>

</html>