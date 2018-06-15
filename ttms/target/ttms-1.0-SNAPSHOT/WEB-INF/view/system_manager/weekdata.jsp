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
    <link href="demo/demo.css" rel="stylesheet" type="text/css" />
    <script src="scripts/boot.js" type="text/javascript"></script>
    <script src="https://cdn.bootcss.com/echarts/3.7.1/echarts.min.js"></script>
  <title>weekData</title>
</head>
<body>
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>系统管理员</span>
</div>
<div class="image">
    <img src="/image/sky.jpg" id="image">
</div>

<p class="title1">FJerryMouse影院管理系统</p>
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
                <li role="presentation"><a href="/showData">销售额统计</a></li>
            </ul>

        </div>
        <div class="col-md-2" id="main" style="height:400px;width: 600px;float:left;margin-top:5%"></div>
    </div>

</div>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例


    var app = echarts.init(document.getElementById('main'));
    app.title = '折柱混合';

    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {
            data:['蒸发量','降水量','平均温度']
        },
        xAxis: [
            {
                type: 'category',
                data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '金额',
                min: 0,
                max: 250,
                interval: 50,
                axisLabel: {
                    formatter: '{value} $'
                }
            },
            {
                type: 'value',
                name: '金额',
                min: 0,
                max: 250,
                interval: 50,
                axisLabel: {
                    formatter: '{value} $'
                }
            }
        ],
        series: [
            {
                name:'销售额',
                type:'bar',
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
            },

            {
                name:'销售额变化曲线',
                type:'line',
                yAxisIndex: 1,
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
            }
        ]
    };


    // 使用刚指定的配置项和数据显示图表。
    app.setOption(option);
</script>
<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/employee.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>
