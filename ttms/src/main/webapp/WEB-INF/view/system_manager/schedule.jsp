<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: dongmengyuan
Date: 17-11-19
Time: 下午2:26
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/css/manage.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="/js/jquery.min.js"></script>
    <link href="/css/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="/css/bootstrap-datetimepicker/js/moment-with-locales.min.js"></script>
    <script src="/css/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <title>schedule</title>
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
<body onload="findType()">
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>经理</span>
</div>
<div class="image">
    <img src="image/sky.jpg" id="image">
</div>
<p class="title">JerryMouse影院管理系统</p>
<div class="container">
    <div class="row">
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
        <div class="col-md-offset-2">
            <div id="ww">
                <table class="table table-hover" id="schedule" onclick="find(this)">
                    <thead>
                    <tr>
                        <th style='text-align: center;width:15%;'>演出ID</th>
                        <th style='text-align: center;width:15%;'>演出厅</th>
                        <th style='text-align: center;width:17%;'>剧目</th>
                        <th style='text-align: center;width:15%;'>演出时间</th>
                        <th style='text-align: center;width:15%;'>票价</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${scheduleList}" var="schedule">
                        <tr>
                            <td>${schedule.schedId}</td>
                            <td>${schedule.studioId}</td>
                            <td>${schedule.playId}</td>
                            <td><fmt:formatDate value="${schedule.schedTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${schedule.schedTicketPrice}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div id="btns">
                    <button class="btn btn-danger" onclick="del(this)" style="float: right;margin: 5px;">删除</button>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float: right;margin: 5px;">添加
                    </button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="model(this)"
                            style="float: right;margin: 5px;">编辑
                    </button>
                </div>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="width:30%;padding:10px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4>添加演出计划</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/addSchedule" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">演出厅:</label>
                                        <div class="col-sm-8">
                                            <select name="studioId" id="studio"  class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">剧目:</label>
                                        <div class="col-sm-8">
                                            <select name="playId" id="play"  class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">演出时间:</label>
                                        <div class="col-sm-8">
                                            <label>
                                                <input type="text" name="schedTime"  id="time"/>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">票价:</label>
                                        <div class="col-sm-8">
                                            <label>
                                                <input type="text" name="schedTicketPrice" id="price" class="form-control"/>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary" >添加</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" style="width:30%;padding:10px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4>编辑</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/updateSchedule" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">演出ID:</label>
                                        <div class="col-sm-8">
                                            <select name="nam" id="nam" class="form-control" readonly="true">

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-3 control-label">演出厅:</label>
                                    <div class="col-sm-8">
                                        <select name="studioId" id="studio1" class="form-control">

                                        </select>
                                    </div>
                                </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">剧目:</label>
                                        <div class="col-sm-8">
                                            <select name="playId" id="play1" class="form-control">

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">演出时间:</label>
                                        <div class="col-sm-8">
                                            <label>
                                                <input type="text" name="schedTime"  id="time1"/>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">票价:</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="schedTicketPrice" id="price1" class="form-control"></input>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">保存
                                        </button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/schedule.js"></script>
<script src="/js/javascript/match.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#time').datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
        $('#time1').datetimepicker({
            format: 'YYYY-MM-DD hh:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });
    function findType() {
        $.post("/selectStudio",function(data){
            for(i=0;i<data.length;i++){
                $("#studio").append("<option value="+data[i].studioId+">"+data[i].studioName+"</option>");
                $("#studio1").append("<option value="+data[i].studioId+">"+data[i].studioName+"</option>");
            }
        });



        $.post("/selectPlay",function(data){

            for(i=0;i<data.length;i++){
                $("#play1").append("<option value="+data[i].playId+">"+data[i].playName+"</option>");
                $("#play").append("<option value="+data[i].playId+">"+data[i].playName+"</option>");
            }
        });
    }
</script>
</body>
</html></html>