<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/css/manage.css">
    <link rel="stylesheet" href="/css/css/userInfomation.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="demo/demo.css" rel="stylesheet" type="text/css" />
    <script src="scripts/boot.js" type="text/javascript"></script>
    <script src="https://cdn.bootcss.com/echarts/3.7.1/echarts.min.js"></script>
    <!--<style>
        div{display: inline}
    </style>
    --><title>Sales statistics</title>
</head>
<body>
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>系统管理员</span>
</div>
<div class="image">
    <img src="image/sky.jpg" id="image">
</div>
<!--<style>-->
    <!--.col-md-2{display: inline}-->
<!--</style>-->
<p class="title1">FZN影院管理系统</p>
<div class="container">
    <div class="row">
        <input type="button" value="按销售员统计" onClick="window.open('/showdatatest','_top')"/>
        <input type="button" value="近七天" onClick="window.open('/showweekdata','_top')">
        <input type="button" value="近一个月内销售金额变化"onClick="window.open('/showmonthdata','_top')">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked nav-inverse" id="left">
                <li role="presentation" class="active"><a href="showEmployee">员工管理</a></li>
                <li role="presentation" class="active"><a href="showPlay">剧目管理</a></li>
                <li role="presentation"><a href="/showStudio">演出厅管理</a></li>
                <li role="presentation"><a href="/showSchedule">演出计划管理</a></li>
                <li role="presentation"><a href="/showUser">用户管理</a></li>
                <li role="presentation"><a href="/showuserInformation">个人信息</a></li>
                <li role="presentation"><a href="/showData">销售额统计</a></li>ifc
            </ul>

        </div>
        <div class="col-md-2" id="main" style="height:400px;width: 600px;float:left;margin-top:5%"></div>
    </div>

</div>
  <!--<input type="button" value="OpenChart" onclick="showChartWindow()" style="left: 30px;padding:30px " />-->

   <!-- <div class="div" id="main" style="height:300px;width:400px;left: 30%;"></div>
-->



<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '各销售员销售情况'
        },
        tooltip: {},
        legend: {
            data:['销售金额']
        },
        xAxis: {
            data: ["售票员1号","售票员2号","售票员3号","售票员4号","售票员5号","售票员6号"]
        },
        yAxis: {
            max:3000,
            interval: 200,
        },
        series: [{
            name: '销量',
            type: 'bar',

            data: [500, 1000, 1500, 700, 600, 800]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/employee.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>
