<%@ page pageEncoding="UTF-8"  %>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">   
	<title>座位管理</title>	

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.js"></script>
    <link href="/css/Bootstrap/bootstrap.css" rel="stylesheet">
    <link href="/css/Bootstrap/site.css" rel="stylesheet">
    <link href="/css/Bootstrap/bootstrap-responsive.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/css/jquery.seat-charts.css">
	<link rel="stylesheet" type="text/css" href="/css/css/salestyle.css">
	<link rel="stylesheet" type="text/css" href="/css/css/manage.css">
	<script src="/js/jquery/jquery.seat-charts.js"></script>
  </head>
  <body>
  <div id="header">
	  <a href="./login.html" id="link">&nbsp;退出</a>
	  <span>系统管理员</span>
  </div>
  <p class="title">JerryMouse售票管理</p>
  <div class="demo">
	  <div class="container">
		  <div class="row">
			  <div class="col-md-6">
				  <div id="seat-maps">
					  <div class="front">屏幕</div>
				  </div>
			  </div>
			  <div class="col-md-offset-6">
				  <div class="booking-details">
					  <p>影片：<span id="playName"></span></p>
					  <p>时间：<span id="playTime"></span></p>
					  <p>票价：<span id="playPrice"></span></p>
					  <p>座位：</p>
					  <ul id="selected-seats"></ul>
					  <p>票数：<span id="counter">0</span></p>
					  <p>总计：<b>￥<span id="total">0</span></b></p>

					  <button class="btn btn-primary " onclick="PassChange()">确定购买</button>

					  <div id="legend"></div>
				  </div>
			  </div>
		  </div>
	  </div>
  </div>

 </div>
 <div class="modal fade" id="SaleModal" tabindex="-1" role="dialog" aria-labelledby="SaleModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="SaleModalLabel">确定界面</h4>
      </div>
      <div class="modal-body">
        <form id="Sale"  name="Sale" method="post" action="#">
        			<div class="control-group">
						<label class="control-label" >你确定要购买这<span id="counter2">0</span>张票么?</label>
						<div class="controls">
							<ul id="selected-seats2"></ul>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="price">总计：</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="price" name="price" readonly="readonly"  />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="pay">输入金额<span style="color:#F00">*</span></label>
						<div class="controls">
							<input type="text" class="input-xlarge" onblur="GiveChange()" id="pay" name="pay"  />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="change">找零</label>
						<div class="controls">
							<input type="text" class="input-xlarge"  id="change" name="change"  readonly="readonly"/>
						</div>
					</div>
        </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="Preservation"  data-dismiss="modal" aria-hidden="true">确认购买</button>
      </div>
    </div>
  </div>
</div>
    </div>
  <script  type="text/javascript">
      function GetQueryString(name)
      {
          var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
          var r = window.location.search.substr(1).match(reg);
          if(r!=null)return  unescape(r[2]); return null;
      }
      var seatStatusMap={};
      var str=[];
      $(document).ready(function() {
          var x=GetQueryString("x");     //演出厅座位行
          var y=GetQueryString("y");		//演出厅座位列
          var name=GetQueryString("name");  //硬片名字
          var Time = GetQueryString("Time");
          var price = GetQueryString("Price");
          var studio_id=GetQueryString("studioId");       //演出厅座位ID
          var schedId = GetQueryString("schedId");
//ajax同步获取数据库中演出厅座位状态字符串
          $.ajax({
              type: "Get", //提交方式，也可以是get
              url: "/getticketstatus",    //请求的url地址
              dataType: "html",   //返回格式为json,也可以不添加这个属性，也可以是（xml、json、script 或 html）。
              async: false, //请求是否异步，默认为异步，这也是ajax重要特性
              data: {studio_id: studio_id,schedId:schedId},    //参数值 ,id是定义的要传的参数变量名，后台接收一致，value是页面取的传值的变量名，如果有多个，按照格式每组用逗号隔开，没有参数可以不用
              beforeSend: function() {
                  //请求前的处理，如果没有可以不用写
              },
              success: function(result) {
                  var ss=result+"";
                  str=ss.split(",");
              },
              complete: function() {
                  //请求完成的处理 ，如果没有，可以不用
              },
              error: function(XMLHttpRequest, textStatus, errorThrown) {
                  alert("出错了，没取到啊!"+XMLHttpRequest.status);
              }
          });
//将ajax获取到的字符串转换为map
          var k=0;
          var i,j;
          var sssss;
          for(i=1;i<=x;i++){
              for(j=1;j<=y;j++){
                  sssss=i+"_"+j;
                  seatStatusMap[sssss]=str[k];
                  k++;
              }
          }
//座位状态对应map
          var classMap = {'-1' : 'unavailable', '0' : 'available', '1' : 'sellout'};
//初始化演出厅座位图
          var map = new Array();
          map = [];
          for(var i=0;i<x;i++){
              map[i]="";
              for(var j=0;j<y;j++){
                  map[i]+="c";
              }
          }
          $('#seat-maps').empty();
          $("#legend").empty();
          document.getElementById('playName').innerHTML =name;
          document.getElementById('playTime').innerHTML =Time;
          document.getElementById('playPrice').innerHTML =price;
          var $cart = $('#selected-seats'), //座位区
              $cart1 = $('#selected-seats2'),
              $counter = $('#counter'), //票数
              $total = $('#total');
          var sc = $('#seat-maps').seatCharts({
              map: map,
              naming: {
                  top    : true,
                  left   : true,
                  getId  : function(character, row, column) {
                      return row + '_' + column;
                  }
              },
              legend: {
                  node: $('#legend'),
                  items: [
                  ]
              },
              click: function () { //点击事件
                  if (this.status() == 'available') { //可选座
                      $('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
                          .attr('id', 'cart-item-'+this.settings.id)
                          .data('seatId', this.settings.id)
                          .appendTo($cart);
                      $('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
                          .attr('id', 'cart-item2-'+this.settings.id)
                          .data('seatId', this.settings.id)
                          .appendTo($cart1);

                      $counter.text(sc.find('selected').length+1);
                      $total.text(recalculateTotal(sc)+Number(price));

                      return 'selected';
                  } else if (this.status() == 'selected') { //已选中
                      //更新数量
                      $counter.text(sc.find('selected').length-1);
                      //更新总计
                      $total.text(recalculateTotal(sc)-Number(price));

                      //删除已预订座位
                      $('#cart-item-'+this.settings.id).remove();
                      $('#cart-item2-'+this.settings.id).remove();
                      //可选座
                      return 'available';
                  } else if (this.status() == 'unavailable') { //已售出
                      return 'unavailable';
                  } else {
                      return this.style();
                  }
              }

          });

//根据ajax生成Map改变座位状态
          $.each(seatStatusMap, function(key, value){
              sc.get(key).status(classMap[value]);
          });
//计算总金额
          function recalculateTotal(sc) {
              var total=0;
              sc.find('selected').each(function () {
                  total  += Number(price);
              });
              return total;
          }
//console.log(seatStatusMap);//火狐控制台打印输出： Object { fileNumber="文件编号", fileName="文件名称"}
//保存演出厅座位
          $("#Preservation").click(function(){

              var StatusStringNew=[]; //返回座位状态字符串
              //返回所有座位状态
              sc.find('selected').each(function () {
                  StatusStringNew.push(this.settings.row*y+this.settings.label);
              });
              var ids=StatusStringNew.join(",");
              var change=$('#change').val();
              var pay=$('#pay').val();
              var total = $('#price').val();
              console.log(ids);
              //向服务器提交数据（座位状态）
              $.post("/saveticketstatus",{saveStatus:ids,studio_id:studio_id,schedId:schedId,pay:pay,ticketPrice:price,change:change,total:total},function(result){
                  if(result.success){
                      alert("您已成功购买");
                      location.reload();
                  }else{
                      alert(result.errormessage);
                      location.reload();
                  }
              },"json");
          });
      });
      function PassChange(){
          $('#counter2').text($('#counter').text());
          $('#price').val($('#total').text());
          $('#SaleModal').modal('show');
      }
      function GiveChange(){
          $('#change').val($('#pay').val()-$('#price').val());
      }
  </script>
  </body>
</html>