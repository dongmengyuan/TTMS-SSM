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
<p class="title">FZN影院管理系统</p>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked nav-inverse" id="left">
                <li role="presentation" class="active"><a href="./employee.html">员工管理</a></li>
                <li role="presentation"><a href="/show/Studio">演出厅管理</a></li>
                <li role="presentation"><a href="/show/Seat">座位管理</a></li>
                <li role="presentation"><a href="/show/User">用户管理</a></li>
                <li role="presentation"><a href="/show/UserInformation">个人信息</a></li>
            </ul>
        </div>
        <div class="col-md-offset-3">
            <div id="tab" style="margin: 5px;">
                <ul id="myTab" class="nav nav-tabs" style="height: 50px;">
                    <li class="active">
                        <a href="#seat1" data-toggle="tab">
                            一号演出厅
                        </a>
                    </li>
                    <li><a href="#seat2" data-toggle="tab">二号演出厅</a></li>
                    <li><a href="#seat3" data-toggle="tab">三号演出厅</a></li>
                    <li><a href="#seat4" data-toggle="tab">四号演出厅</a></li>

                </ul>
                <div id="seat">
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade in active" id="seat1" style="margin-left: 50px">
                            <div class="wrapper">
                                <div id="seat-map">
                                    <div class="front-indicator">Front</div>
                                </div>
                                <div class="booking-details">

                                    <div id="legend"></div>
                                    <button class="btn btn-primary" onclick='save()'>保存</button>
                                </div>
                            </div>
                        </div>
                        <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
                        <script src="javascript/jquery.seat-charts.js"></script>
                        <script>
                            //                var firstSeatLabel = 1;
                            $(document).ready(function () {
                                var m = 7, n = 8;
                                var map = new Array();
                                for (var i = 0; i < m; i++) {
                                    map[i] = '';
                                    for (var j = 0; j < n; j++) {
                                        map[i] += 'e';
                                    }
                                    console.log(map[i]);
                                }
                                console.log(map);
                                var $cart = $('#selected-seats'),
                                        sc = $('#seat-map').seatCharts({
                                            /*map: [
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             'eeeeeeee',
                                             ],*/
                                            map: map,
                                            seats: {
                                                f: {
                                                    classes: 'first-class',
                                                    category: 'First Class'
                                                },
                                                e: {
                                                    classes: 'economy-class',
                                                    category: 'Economy Class'
                                                }
                                            },
                                            naming: {
                                                top: false,
//                                    getLabel: function (character, row, column) {
//                                        return firstSeatLabel++;
//                                    },
                                            },
                                            legend: {
                                                node: $('#legend'),
                                                items: [
                                                    ['e', 'available', '正常'],
                                                    ['f', 'selected', '损坏'],
                                                    ['g', 'clear', '过道']
                                                ]
                                            },
                                            click: function () {
                                                if (this.status() == 'available') {
                                                    return 'selected';
                                                }
                                                else if (this.status() == 'selected') {
                                                    return 'clear';
                                                }
                                                else if (this.status() == 'clear') {
                                                    return 'available'
                                                }
                                                else {
                                                    return this.style();
                                                }
                                            }
                                        });
                            });
                        </script>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="javascript/match.js"></script>
</body>
</html>