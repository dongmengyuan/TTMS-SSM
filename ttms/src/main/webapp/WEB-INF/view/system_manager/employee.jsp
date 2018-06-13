<%--
  Created by IntelliJ IDEA.
  User: dongmengyuan
  Date: 17-11-19
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/Bootstrap/bs.css">
    <link rel="stylesheet" href="/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/css/manage.css">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>

    <link href="/css/Bootstrap/site.css" rel="stylesheet">
    <link href="/css/Bootstrap/bootstrap-responsive.css" rel="stylesheet">
    <script src="/js/bootstrap-table/bootstrap-table.min.js"></script>
    <link href="/js/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
    <script src="/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <title>employee</title>
</head>
<body>
<div id="header">
    <a href="./login.html" id="link">&nbsp;退出</a>
    <span>系统管理员</span>
</div>
<div class="image">
    <img src="/image/sky.jpg" id="image">
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
            <div class="col-md-10">

                <div class="page-header">
                    <h1>Employees <small>所有员工</small></h1>
                    <div class="input-group">
                        <input type="text" class="form-control"  id="empName" placeholder="请输入检索关键字" />
                        <span class="input-group-btn">
					<button class="btn btn-primary" id="search_btn" onclick="Search()">检索</button>
				</span>
                    </div>
                <table  id="employeetable" ></table>


                <div id="btns">
                    <button class="btn btn-danger" onclick="del()" style="float: right;margin: 5px;">删除</button>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float: right;margin: 5px;">添加
                    </button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#myModal1" onclick="Update()"
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
                                <form action="/addEmployee" method="post" class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">编号:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="number"
                                                          name="empNo" required="required" onblur="checkNum('number')"></label>
                                            <span id="1" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">名字:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="name"
                                                          name="empName" required="required" onblur="checkName('name')"></label>
                                            <span id="2" style="color:red;"></span>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">电话:</label>

                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="tel"
                                                          name="empTelNum" required="required" onblur="checkTel('tel')"></label>
                                            <span id="5" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">地址:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="job"
                                                          required="required" onblur="checkJob('addr')"></label>
                                            <span id="7" style="color:red;"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">邮箱:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" id="emil"
                                                          name="empEmail" required="required" onblur="checkEmil('emil')"></label>
                                            <span id="6" style="color:red;"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <span id="8" style="color:red;"></span>
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
                                <form class="form-horizontal"  role="form" id="updateForm">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">编号:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" readonly="true" name="empId" id="num"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">名字:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="empName" id="nam"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">电话:</label>

                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="empTelNum" id="tele"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">地址:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="empAddr" id="addr"></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">邮箱:</label>
                                        <div class="col-sm-8">
                                            <label><input type="text" class="form-control" name="empEmail" id="email"></label>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true"
                                        onclick="saveEmp()">保存
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

        $(document).ready(function () {
            $('#employeetable').bootstrapTable({
                url: '/searchByPage',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: queryParams,//传递参数（*）

                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 5,                       //每页的记录行数（*）
                pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
                undefinedText: "空",				//当数据为 undefined 时显示的字符
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                contentType: "application/x-www-form-urlencoded",
                strictSearch: false,
                searchOnEnterKey: true,				//按回车搜索
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行

                uniqueId: "operate",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                paginationPreText: "上一页",
                paginationNextText: "下一页",
                columns: [
                    {
                        checkbox: true
                    },
                    {
                        field: 'empId',
                        title: 'ID',
                        align: 'center'//水平居中
                    }, {
                        field: 'empNo',
                        title: 'number',
                        align: 'center'//水平居中
                    }, {
                        field: 'empName',
                        title: 'Name',
                        align: 'center'//水平居中
                    }, {
                        field: 'empTelNum',
                        title: 'telephone',
                        align: 'center'//水平居中
                    }, {
                        field: 'empAddr',
                        title: 'Address',
                        align: 'center'//水平居中
                    }, {
                        field: 'empEmail',
                        title: 'E-mail',
                        align: 'center'//水平居中
                    },
                    {
                        field: 'operate',
                        title: 'Action',
                        align: 'center',//水平居中
                        formatter: operateFormatter //自定义方法，添加操作按钮
                    },
                ],
                queryParamsType: "undefined",
            });
        });


    //得到查询的参数
    function queryParams(params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            pageNumber: params.pageNumber,
            pageSize: params.pageSize,
            empName: $('#empName').val()
        };
        return temp;
    }


    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<a href="javascript:del()">删除</a>'
        ].join('');
    }
    //查询事件
    function Search(){
        $('#employeetable').bootstrapTable('refresh',{pageNumber:1});
    }


    function saveEmp() {
        $.post("/updateEmployee",$("#updateForm").serialize(),function(data){
            //alert("客户信息更新成功！");
            window.location.reload();
        });
    }
        //编辑操作
        function Update(){
            var selectedRows=$('#employeetable').bootstrapTable('getSelections');
            if(selectedRows.length!=1){
                alert("请选择一条要修改的数据！");
                return;
            }
            var row=selectedRows[0].empId;
            $("#id").val(selectedRows[0].empId);
            $("#num").val(selectedRows[0].empNo);
            $("#nam").val(selectedRows[0].empName);
            $("#tele").val(selectedRows[0].empTelNum);
            $("#addr").val(selectedRows[0].empAddr);
            $("#email").val(selectedRows[0].empEmail);
        }
        function del() {
            var selectedRows=$('#employeetable').bootstrapTable('getSelections');
            if(selectedRows.length==0){
                alert("请选择要删除的数据！");
                return;
            }
            $.post("/deleteEmployee", {"empId": selectedRows[0].empId}, function (data) {
                alert("删除更新成功！");
                window.location.reload();
            });
        }
</script>
<script src="/js/javascript/employee.js"></script>
<script src="/js/javascript/match.js"></script>
</body>
</html>