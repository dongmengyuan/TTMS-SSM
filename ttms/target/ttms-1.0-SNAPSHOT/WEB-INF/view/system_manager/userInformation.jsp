<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/css/manage.css">
    <link rel="stylesheet" href="/css/css/userInfomation.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>employee</title>
</head>
<body>
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>系统管理员</span>
</div>
<div class="image">
    <img src="image/sky.jpg" id="image">
</div>
<p class="title1">FZN影院管理系统</p>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked nav-inverse" id="left">
                <li role="presentation" class="active"><a href="./employee.html">员工管理</a></li>
                <li role="presentation"><a href="/show/Studio">演出厅管理</a></li>
                <li role="presentation"><a href="/show/Seat">座位管理</a></li>
                <li role="presentation"><a href="/show/User">用户管理</a></li>
                <li role="presentation"><a href="/show/UserInformation">个人信息</a></li>
            </ul>
        </div>
        <div class="col-md-offset-4">
            <div class="box">
                <table>
                    <thead>
                    <tr>
                        <th style="width:125px;height:0px;"></th>
                        <th style="width:360px;height:0px;"></th>
                    </tr>
                    </thead>
                    <tbody class="base">
                    <tr>
                        <td class="top-line">
                            <div style="border-radius: 100%;width:100px;height:100px;margin-right: 5px;">
                                <img src="image/sky.jpg">
                            </div>
                        </td>
                        <td class="top-line">
                            <a class="btn btn-hollow">
                                <input  type="file" class="hide">更改头像
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">姓名
                        </td>
                        <td><input type="text" placeholder="请输入姓名" id="name"></td>
                    </tr>
                    <tr>
                        <td class="title">电话
                        </td>
                        <td><input type="text" placeholder="请输入电话" id="tel"></td>
                    </tr>
                    <tr>
                        <td class="title">住址
                        </td>
                        <td><input type="text" placeholder="请输入住址" id="address"></td>
                    </tr>
                    <tr>
                        <td class="title">邮箱
                        </td>
                        <td><input type="text" placeholder="请输入邮箱" id="emil"></td>
                    </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-success setting-save" value="保存" id="btn">
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/employee.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>