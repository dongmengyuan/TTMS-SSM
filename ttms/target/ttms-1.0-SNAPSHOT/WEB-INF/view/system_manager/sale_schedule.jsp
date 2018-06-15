<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/css/manage.css">
    <link rel="stylesheet" href="/css/css/hide.css">
    <link rel="stylesheet" href="/css/css/sale_schedule.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>sale_schedule</title>
    <style>
        input[type='radio'] {
            margin: 0 3px 0 16px;
            font-size: 15px;
            vertical-align: middle;
        }
        select {
            width: 60px;
            height: 30px;
        }
    </style>
</head>
<body>
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>经理</span>
</div>
<div class="image">
    <img src="image/sky.jpg" id="image">
</div>
<p class="title">JerryMouse售票管理</p>
<div id="center">
    <input type="text" class="search" placeholder="search">
    <button class="fa fa-search"></button>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-offset-1">
            <div id="ww">
                <table class="table table-hover" id="schedule" onclick="find(this)">
                    <thead>
                    <tr>
                        <th style='text-align: center;width:12%;'>演出ID</th>
                        <th style='text-align: center;width:12%;'>演出厅</th>
                        <th style='text-align: center;width:12%;'>上映时间</th>
                        <th style='text-align: center;width:12%;'>价格</th>
                        <th style='text-align: center;width:12%;'>价格</th>
                        <th style='text-align: center;width:12%;'>价格</th>
                        <th style='text-align: center;width:12%;'>价格</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${scheduleByPlayId1List}" var="scheduleByPlayId">
                        <tr>
                            <td>${scheduleByPlayId.schedId}</td>
                            <td>${scheduleByPlayId.studioId}</td>
                            <%--<td>${scheduleByPlayId.schedTime}</td>--%>
                            <td><fmt:formatDate value="${scheduleByPlayId.schedTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${scheduleByPlayId.schedTicketPrice}</td>
                            <td>${scheduleByPlayId.studioRow}</td>
                            <td>${scheduleByPlayId.studioCol}</td>
                            <td>${scheduleByPlayId.playName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="btns">
                    <button class="btn btn-primary" style="float: right;margin: 5px;">确认
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/sale_schedule.js"></script>
</body>
</html>