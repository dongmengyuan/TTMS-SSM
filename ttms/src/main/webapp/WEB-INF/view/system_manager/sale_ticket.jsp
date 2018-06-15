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
    <script src="jquery/jq.js"></script>
    <script src="jquery/bootstrap.min.js"></script>
    <script src="javascript/seat.js"></script>
    <link rel="stylesheet" href="Bootstrap/bs.css">
    <link rel="stylesheet" href="css/jquery.seat-charts.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
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
        /*.front{*/
        /*width: 10%;*/
        /**/
        /*background: transparent;*/
        /*border: 1px solid grey;*/
        /*border-radius: 10px;*/
        /*}*/
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
<p class="title">JerryMouse售票管理系统</p>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3">
            <div id="tab" style="margin: 5px;">
                <div class="wrapper">
                    <ul id="legend">
                    </ul>
                    <div class="default" id="ok"><span>可选</span></div>
                    <div class="select" id="wrong"><span>已选</span></div>
                    <button id="otn" class="btn btn-primary">购票</button>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    function create(m, n){
        var seat = document.querySelector('#legend');
        var a = '';
        for(var i = 1; i <= m; i++){
            for(var j = 1; j <= n; j++){
                a += '<li style="top: '+ i*50 +'px;left: '+ j*50 +'px; " class="default">' + '</li>'
            }
        }
        seat.innerHTML = a;
    }
    create(7, 8);
    (function(){
        var seat = document.querySelector('#legend');
        var lis = seat.querySelectorAll('li');
        for(var i = 0; i < lis.length; i++){
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
                    var column = j % 8;
                    var row = parseInt(j / 8);
                    console.log(lis[j].index, row+1, column+1);
                }
            }
        };
    })()
</script>
<script src="/js/avascript/match.js"></script>
</body>
</html>