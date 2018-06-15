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
                <table class="table table-hover" id="user" onclick="find(this)">
                    <thead>
                    <tr>
                        <th style='text-align: center;width: 12%;'>编号</th>
                        <th style='text-align: center;width: 12%;'>密码</th>
                        <th style="text-align: center;width: 12%;">类型</th>
                        <th style="text-align: center;width: 15%;">图像</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <td>${user.empNo}</td>
                            <td>${user.empPass}</td>
                            <td>${user.type}</td>
                            <td>'<a class = "view" href="javascript:void(0)"><img style="width: 50;height: 50px;" src ="${user.headPath}"/></a>'</td>
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
                                <h4>添加员工</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/addUser" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">编号:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="number"
                                                          name="empNo" required="required" ></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">密码:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="pass"
                                                          name="empPass" required="required" ></label>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">类型:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="type"
                                                          name="type" required="required" ></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">图像:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="ima"
                                                          name="headPath" required="required" ></label>
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
                                <form action="/updateUser" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">编号:</label>
                                        <div class="col-sm-8">
                                            <label><input name="empNo" type="text" class="form-control" id="num"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">密码:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" name="empPass" class="form-control" id="pass1"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">类型:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" name="type" class="form-control" id="type1"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">图像:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" name="headPath" class="form-control" id="ima1"></label>
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
<script src="/js/javascript/user.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>