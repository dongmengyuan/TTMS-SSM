<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/css/manage.css">
    <link rel="stylesheet" href="/css/css/hide.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>sale_play</title>

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
                <table class="table table-hover" id="play" onclick="find(this)">
                    <thead>
                    <tr>
                        <th style='text-align: center;width:12%;'>剧目ID</th>
                        <th style='text-align: center;width:12%;'>剧目名称</th>
                        <th style='text-align: center;width:12%;'>剧目类型</th>
                        <th style='text-align: center;width:12%;'>语言类型</th>
                        <th style='text-align: center;width:12%;'>剧目时长</th>
                        <th style='text-align: center;width:12%;'>剧目简介</th>
                        <th style='text-align: center;width:12%;'>价格</th>
                        <th style='text-align: center;width:12%;'>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${salePlayList}" var="salePlay">
                        <tr>
                            <td>${salePlay.playId}</td>
                            <td>${salePlay.playName}</td>
                            <td>${salePlay.playTypeId}</td>
                            <td>${salePlay.playLangId}</td>
                            <td>${salePlay.playLength}</td>
                            <td>${salePlay.playIntroduction}</td>
                            <td>${salePlay.playTicketPrice}</td>
                            <td>${salePlay.playStatus}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="btns">
                    <button class="btn btn-primary" type="submit" style="float: right;margin: 5px;">确认
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/sale_play.js"></script>
</body>
</html>