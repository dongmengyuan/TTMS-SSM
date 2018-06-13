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
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>stdio</title>
</head>
<body>
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>系统管理员</span>
</div>
<div class="image">
    <img src="image/sky.jpg" id="image">
</div>
<p class="title">FZN影院管理系统</p>
<div id="center">
    <input type="text" class="search" placeholder="search">
    <button class="fa fa-search"></button>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked nav-inverse" id="left">
                <li role="presentation"><a href="/show/Employee">员工管理</a></li>
                <li role="presentation"><a href="/show/Studio">演出厅管理</a></li>
                <li role="presentation"><a href="/show/Seat">座位管理</a></li>
                <li role="presentation"><a href="/show/User">用户管理</a></li>
                <li role="presentation"><a href="/show/UserInformation">个人信息</a></li>
            </ul>
        </div>
        <div class="col-md-offset-2">
            <div id="ww">
                <table class="table table-hover" id="stdio" onclick="find(this)">
                    <thead>
                    <tr>
                        <th style='text-align: center;width:15%;'>ID</th>
                        <th style='text-align: center;width:15%;'>名称</th>
                        <th style='text-align: center;width:17%;'>行</th>
                        <th style='text-align: center;width:15%;'>列</th>
                        <th style='text-align: center;width:15%;'>介绍</th>
                        <th style="text-align: center;width:20%;">状态</th>
                    </tr>
                    </thead>

                    <tbody>

                    <c:forEach items="${studioList}" var="studio">
                        <tr>
                            <td>${studio.studioId}</td>
                            <td>${studio.studioName}</td>
                            <td>${studio.studioRowCount}</td>
                            <td>${studio.studioColCount}</td>
                            <td>${studio.studioIntroduction}</td>
                            <td>${studio.studioFlag}</td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
                <div id="btns">
                    <button class="btn btn-danger" onclick="dels(this)" style="float: right;margin: 5px;">删除</button>
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
                                <h4>添加演出厅</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/addStudio" method="post" class="form-horizontal" role="form">

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">名称:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="name"
                                                          name="studioName" ></label>
                                            <span id="1" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">行数:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="type"
                                                          name="studioRowCount" ></label>
                                            <span id="2" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">列数:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="row"
                                                          name="studioColCount"></label>
                                            <span id="3" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">介绍:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="col"
                                                          name="studioIntroduction" >
                                            </label>
                                            <span id="4" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">状态:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="status"
                                                          name="studioFlag" >
                                            </label>
                                            <span id="5" style="color:red;"></span>
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
                                <form action="./updateStudio" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ID:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" readonly="true" name="studioId" id="ID"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">名称:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="studioName" id="nam"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">行数:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" readonly="true" name="studioRowCount" id="typ"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">列数:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" readonly="true" name="studioColCount" id="rows"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">介绍:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="studioIntroduction" id="cols"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">状态:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="studioFlag" id="statu"></label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary" >保存</button>
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



<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/stdio.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>