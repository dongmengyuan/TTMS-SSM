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
    <script src="/js/jquery/jq.js"></script>
    <script src="/js/jquery/bootstrap.min.js"></script>
    <script src="/js/javascript/seat.js"></script>
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/css/jquery.seat-charts.css">
    <link rel="stylesheet" href="/css/css/style.css">
    <link rel="stylesheet" href="/css/css/manage.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <title>seat</title>
    <style>
        .row {
            margin-top: 41px;
        }
         #legend{
             position: relative;
             top: -30px;
             left: -30px;
             list-style: none;
         }
        #legend li{
            width: 35px;
            height: 35px;
            border-radius: 5px;
            position: absolute;
        }
        #otn{
            position: relative;
            top: 220px;
            left: 170px;
        }
        .default{
            background: #B9DEA0;
        }
        .select{
            background: #333;
        }
        .selected{
            background: green;
        }
        #ok, #wrong{
            width: 35px;
            height: 35px;
            border-radius: 5px;
            position: relative;
            left: 550px;
            top: 200px;
            margin-bottom: 10px;
        }
        #ok span, #wrong span{
            position: relative;
            left: 50px;
            top: 5px
        }
    </style>
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
        <div class="col-md-offset-3">
            <div id="tab" style="margin: 5px;">
                <h3>座位管理</h3>
                <div class="wrapper">
                    <ul id="legend">
                    </ul>
                    <div class="default" id="ok"><span>正常</span></div>
                    <div class="select" id="wrong"><span>损坏</span></div>
                    <button id="otn" class="btn btn-primary">保存</button>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    function getSeat(){
        var xht= new XMLHttpRequest();
        xht.onreadystatechange = function(){
            if(xht.readyState == 4 && xht.status == 200){
                var a = xht.responseText;
                var arr = JSON.parse(a);
                var status = [];
                for(var i = 0; i < arr.length; i++){
                    status.push(arr[i].seatStatus);
                }
                var obj = arr.pop();
                var row = obj.seatRow;
                var column = obj.seatColumn;

                create(row, column, status);

            }
        };
        xht.open('GET', '/seat/'+${id}, true);
        xht.send();
    }
    getSeat();
    function create(m, n, status){
        var seat = document.querySelector('#legend');
        var a = '';
        for(var i = 1; i <= m; i++){
            for(var j = 1; j <= n; j++){
                a += '<li style="top: '+ i*50 +'px;left: '+ j*50 +'px; " class="default">' + '</li>'
            }
        }
        seat.innerHTML = a;
        (function(){
            var seat = document.querySelector('#legend');
            var lis = seat.querySelectorAll('li');
            for(var i = 0; i < lis.length; i++){
                if(status[i] != '1'){
                    lis[i].classList.add('select')
                }
                (function(num){
                    lis[num].onclick = function(){
                        console.log(num+1);
                        lis[num].classList.toggle('select');
                    }
                })(i)
            }



            var otn = document.querySelector('#otn');
            otn.onclick = function(){
                for(var j = 0; j < lis.length; j++){
                    lis[j].index = j + 1;
                    if(lis[j].classList.contains('select')){
                        var column = j % n;
                        var row = parseInt(j / n);
                        console.log(lis[j].index, row+1, column+1);
                    }
                }
            };
        })()
    }

</script>
<script src="/js/javascript/match.js"></script>
</body>
</html>