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
    <link rel="stylesheet" href="/css/css/hide.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>play</title>
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
<div id="center">
    <input type="search" class="search" placeholder="search">
    <button class="fa fa-search"></button>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked nav-inverse" id="left">
                <li role="presentation"><a href="show/Play">剧目管理</a></li>
                <li role="presentation"><a href="show/Schedule">演出计划管理</a></li>
                <li role="presentation"><a href="show/Seal">销售额管理</a></li>
                <li role="presentation"><a href="show/UserInformation">个人信息</a></li>
            </ul>
        </div>
        <div class="col-md-offset-2">
            <div id="ww">
                <table class="table table-hover" id="play"  onclick="find(this)">
                    <thead>
                    <tr>
                        <th style='text-align: center;width:10%;'>id</th>
                        <th style='text-align: center;width:10%;'>名称</th>
                        <th style='text-align: center;width:10%;'>类型</th>
                        <th style='text-align: center;width:10%;'>语言</th>
                        <th style='text-align: center;width:10%;'>时长</th>
                        <th style='text-align: center;width:30%;'>简介</th>
                        <th style='text-align: center;width:12%;'>价格</th>
                        <th style="text-align: center;width:10%;">状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${playList}" var="play">
                        <tr>
                            <td>${play.playId}</td>
                            <td>${play.playName}</td>
                            <td>${play.playTypeId}</td>
                            <td>${play.playLangId}</td>
                            <td>${play.playLength}</td>
                            <td>${play.playIntroduction}</td>
                            <td>${play.playTicketPrice}</td>
                            <td>${play.playStatus}</td>

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
                                <h4>添加影片</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/addPlay" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">名称:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="playName" id="playName1"
                                            ></label>
                                            <span id="1" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">类型:</label>
                                        <div class="col-sm-8">
                                            <select id="Ptype" name="playTypeId" id="type" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">语言:</label>
                                        <div class="col-sm-8">
                                            <select id= "Plang" name="playLangId" id="language" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">时长:</label>
                                        <div class="col-sm-8">
                                            <select name="playLength" id="long" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">简介:</label>
                                        <div class="col-sm-8">
                                            <label><textarea  rows="4" class="form-control" name="playIntroduction" id="intro"></textarea>
                                            </label>
                                            <span id="4" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">票价:</label>
                                        <div class="col-sm-8">
                                            <select name="playTicketPrice" id="price" class="form-control">

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">状态:</label>
                                        <div class="col-sm-8">
                                            <label>
                                                <input type="radio" name="playStatus" value="0" checked="checked"/><span>未上映</span>
                                                <input type="radio" name="playStatus" value="1"/><span>已上映</span>
                                                <input type="radio" name="playStatus" value="2"/><span>已下映</span>
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
                                <form action="/updatePlay" method="post" class="form-horizontal" role="form">

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">名称:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="nam"
                                            ></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">类型:</label>
                                        <div class="col-sm-8">
                                            <select name="editPtype" id="editPtype" class="form-control">

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">语言:</label>
                                        <div class="col-sm-8">
                                            <select name="editPlang" id="editPlang" class="form-control">

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">时长:</label>
                                        <div class="col-sm-8">
                                            <select name="long1" id="long1" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">简介:</label>
                                        <div class="col-sm-8">
                                            <label><textarea rows="5" class="form-control" id="intro1"></textarea>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">票价:</label>
                                        <div class="col-sm-8">
                                            <select name="price1" id="price1" class="form-control">

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">状态:</label>
                                        <div class="col-sm-8">
                                            <label>
                                                <input type="radio" name="status1" value="0"/><span>未上映</span>
                                                <input type="radio" name="status1" value="1"/><span>已上映</span>
                                                <input type="radio" name="status1" value="2"/><span>已下映</span>
                                            </label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="save"
                                        onclick="save(this)">保存
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function findType() {
        $.post("/selectType",function(data){
            for(i=0;i<data.length;i++){
                $("#Ptype").append("<option value="+data[i].dictId+">"+data[i].dictValue+"</option>");
                $("#editPtype").append("<option value="+data[i].dictId+">"+data[i].dictValue+"</option>");
            }
        });



        $.post("/selectLang",function(data){

            for(i=0;i<data.length;i++){
                $("#Plang").append("<option value="+data[i].dictId+">"+data[i].dictValue+"</option>");
                $("#editPlang").append("<option value="+data[i].dictId+">"+data[i].dictValue+"</option>");
            }
        });
    }
</script>
<script>
    (function(){
        let long = document.getElementById('long');
        for(let i = 90; i < 130; i++){
            long.innerHTML += '<option>' + i  + '</option>'
        }
        let long1 = document.getElementById('long1');
        for(let j = 90; j < 130; j++){
            long1.innerHTML += '<option>' + j + '</option>'
        }
        let price = document.getElementById('price');
        for(let i = 25; i <= 35; i++){
            price.innerHTML += '<option>' + i.toFixed(1) + '</option>'
        }
        let price1 = document.getElementById('price1');
        for(let i = 25; i <= 35; i++){
            price1.innerHTML += '<option>' + i.toFixed(1) + '</option>'
        }
    })()
</script>
<script src="/js/jquery/jq.js"></script>
<script src="/js/jquery/bootstrap.min.js"></script>
<script src="/js/javascript/play.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>