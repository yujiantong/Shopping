<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>My JSP 'home.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="assets/css/codemirror.css" rel="stylesheet">
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="assets/js/jquery.min.js"></script>        
           	<script src="assets/dist/echarts.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        
       </head>
		
<body>


<div class="page-content clearfix">
 <div class="alert alert-block alert-success">
  <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
  <i class="icon-ok green"></i>欢迎使用<strong class="green">后台管理系统<small>(v1.2)</small></strong>,你本次登陆时间为2016年7月12日13时34分，登陆IP:192.168.1.110.	
 </div>
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                      <a href="#" title="商城会员">
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
                              <h1><span id="allUser"></span></h1>
                              <p>商城用户</p>
                          </div>
                          </a>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol red">
                              <i class="icon-tags"></i>
                          </div>
                          <div class="value">
                              <h1><span id="unSend"></span></h1>
                              <p>未发货金额</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <h1><span id="allOrder"></span></h1>
                              <p>商城订单</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                          </div>
                          <div class="value">
                              <h1><span id="allPrice"></span></h1>
                              <p>交易记录</p>
                          </div>
                      </section>
                  </div>
              </div>
             <!--实时交易记录-->
             <div class="clearfix">
             <div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> 
         <div class="news_style">
          <div class="title_name">最新消息</div>
          <ul class="list">
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">6月共处理订单3451比，作废为...</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
          </ul>
         </div> 
         </div>
 
<script type="text/javascript">
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-320);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-320);
		});
 });
	 
		            var success=null;
					var all=null;
					var havePay=null;
					var unSend=null; 
				
					$.ajax({
					  type:"POST",
					  url: "${pageContext.request.contextPath}/businessMsg/getShopMsg",
					  success: function(msg){
					  	 var arr=msg.split(",");
						 $("#allUser").html(arr[0]);
						 $("#unSend").html("￥"+arr[1]);
						 $("#allOrder").html(arr[2]);	
						 var arrT = parseFloat(arr[3]);
						 $("#allPrice").html("￥"+arrT.toFixed(0));			  	 
					  }
				});
	                 $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/businessMsg/getBusinessMsgBar?flag=all",
                    success: function(msg){
                    all=msg;
                    }
                 });
                 	   $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/businessMsg/getBusinessMsgBar?flag=success",
                    success: function(msg){
                    success=msg;
                    }
                 });
                 	   $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/businessMsg/getBusinessMsgBar?flag=havePay",
                    success: function(msg){
                    havePay=msg;
                    }
                 });
                 	   $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/businessMsg/getBusinessMsgBar?flag=unSend",
                    success: function(msg){
                    unSend=msg;
                    }
                 });
	 
	 
        require.config({
            paths: {
                echarts: './assets/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
               option = {
    title : {
        text: '月购买订单交易记录',
        subtext: '实时获取用户订单购买记录'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
       data:['所有订单','成功订单','已付款','代发货']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'所有订单',
            type:'bar',
            data:[11, 9, 8, 2, 6, 7, 6, 2, 6, 1,4, 3],
            //data:eval(all),
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            }           
        },
        {
            name:'成功订单',
            type:'bar',
            //data:eval(all),
            data:[6, 9, 3, 4, 2, 7, 1, 2, 4, 8, 6, 3],
            markPoint : {
                data : [
                    /* {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3} */
                ]
            },
           
			
        }
		, {
            name:'已付款',
            type:'bar',
            data:[2, 5, 6, 4, 2, 7, 6, 2, 7, 4, 6, 3],
            //data:eval(all),
            markPoint : {
                data : [
                    /* {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3} */
                ]
            },
           
		}
		, {
            name:'代发货',
            type:'bar',
            data:[2, 5, 8, 4, 7, 7, 1, 2, 4, 1, 6, 3],
            //data:eval(all),
            markPoint : {
                data : [
                   /*  {name : '年最高', value : 1072, xAxis: 7, yAxis: 1072, symbolSize:18},
                    {name : '年最低', value : 22, xAxis: 11, yAxis: 3} */
                ]
            },
           
		}
    ]
};
                    
                myChart.setOption(option);
            }
        );
    </script> 
     </div>
</body>
</html>
