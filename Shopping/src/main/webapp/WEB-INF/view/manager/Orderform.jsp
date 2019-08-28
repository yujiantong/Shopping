<%@page import="com.web.entity.OrderDetail"%>
<%@page import="com.web.entity.Orders"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>resources/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style3.css" />
<link href="assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="font/css/font-awesome.min.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<title>订单管理</title>
</head>

<body>
	<div class="margin clearfix">
		<div class="Order_form clearfix" id="Order_form_style">
			<div class="title_name">
				购物产品所占比例 <span class="top_show_btn Statistic_btn">显示</span> <span
					class="Statistic_title Statistic_btn"><a title="隐藏"
					class="top_close_btn">隐藏</a></span>
			</div>
			<div class="hide_style clearfix">
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.babyCare}" data-color="#D15B47">
						<span class="percent">${requestScope.babyCare}</span>%
					</div>
					<span class="name">宝宝洗护</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.babyCar}" data-color="#87CEEB">
						<span class="percent">${requestScope.babyCar}</span>%
					</div>
					<span class="name">童车童床</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.skinCare}" data-color="#87B87F">
						<span class="percent">${requestScope.skinCare}</span>%
					</div>
					<span class="name">美妆护肤</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.lifeDianqi}" data-color="#d63116">
						<span class="percent">${requestScope.lifeDianqi}</span>%
					</div>
					<span class="name">生活电器</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.userOfBed}" data-color="#ff6600">
						<span class="percent">${requestScope.userOfBed}</span>%
					</div>
					<span class="name">床上用品</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.xiuxianFood}" data-color="#2ab023">
						<span class="percent">${requestScope.xiuxianFood}</span>%
					</div>
					<span class="name">休闲零食</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.FruitGood}" data-color="#1e3ae6">
						<span class="percent">${requestScope.FruitGood}</span>%
					</div>
					<span class="name">生鲜果蔬</span>
				</div>
				<div class="proportion">
					<div class="easy-pie-chart percentage"
						data-percent="${requestScope.binggan}" data-color="#c316a9">
						<span class="percent">${requestScope.binggan}</span>%
					</div>
					<span class="name">饼干糕点</span>
				</div>
			</div>
		</div>

		<!--订单表格-->
		<div class="order_list" id="order_list">
			<div class="h_products_list clearfix" id="products_list">
				<div id="scrollsidebar" class="left_Treeview">
					<div class="show_btn" id="rightArrow">
						<span></span>
					</div>
					<div class="widget-box side_content">
						<div class="side_title">
							<a title="隐藏" class="close_btn"><span></span></a>
						</div>
						<div class="side_list">
							<div class="widget-header header-color-green2">
								<h4 class="lighter smaller">订单类型分类</h4>
							</div>
							<div class="widget-body">
								<ul class="b_P_Sort_list">
									<li><i class="orange  fa fa-reorder"></i><a
										href="javascript:void(0)">全部订单(${requestScope.logisticsList.size()})</a></li>
									<c:forEach items="${requestScope.typeList}" var="type">
										<li><i class="fa fa-sticky-note pink "></i> <a
											href="javascript:void(0)">${type.typeName}</a></li>
									</c:forEach>
									<!-- <li><i class="orange  fa fa-reorder"></i><a href="javascript:void(0)">全部订单(235)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">食品类(235)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">数码配件(2215)</a> </li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">手机(3456)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">电脑(4332)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">厨房用品(1332)</a></li>
             <li><i class="fa fa-sticky-note grey "></i> <a href="javascript:void(0)">电子产品(4543)</a></li>
             <li><i class="fa fa-sticky-note red  "></i> <a href="javascript:void(0)">红钻会员(343)</a></li>
             <li><i class="fa fa-sticky-note blue "></i> <a href="javascript:void(0)">家用电器(2343)</a></li>
             <li><i class="fa fa-sticky-note grey "></i> <a href="javascript:void(0)">卫浴</a></li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--订单列表-->
				<div class="table_menu_list order_style" id="table_order_list">
					<div class="search_style">
						<div class="title_names">搜索查询</div>
						<script type="text/javascript">
      function mysubmitsearch(){
      var myid= $("input[name='myid']").prop("value");
      var mydate= $("input[name='mydate']").prop("value");
      document.searchform.action="${pageContext.request.contextPath}/businessMsg/getDetailMsg?orderId="+myid+"&orderDate="+mydate;
      document.searchform.submit();
      }
      </script>
						<form action="" method="post" name="searchform">
							<ul class="search_content clearfix">
								<li><label class="l_f">订单编号</label><input name="myid"
									type="text" class="text_add" placeholder="订单订单编号"
									style=" width:250px"></li>
								<li><label class="l_f">时间</label><input name="mydate"
									class="inline laydate-icon" id="start"
									style=" margin-left:10px;" placeholder="yyyy-mm-dd"></li>
								<li style="width:90px;"><button type="button"
										class="btn_search" onclick="mysubmitsearch()">
										<i class="fa fa-search"></i>查询
									</button></li>
							</ul>
						</form>
					</div>
					<!--订单列表展示-->
					<table class="table table-striped table-bordered table-hover"
						id="sample-table">
						<thead>
							<tr>
								<th width="25px"><label><input type="checkbox"
										class="ace"><span class="lbl"></span></label></th>
								<th width="120px">订单编号</th>
								<th width="250px">产品图片</th>
								<th width="100px">总价</th>
								<th width="100px">优惠</th>
								<th width="100px">订单时间</th>
								<th width="180px">下单用户</th>
								<th width="80px">数量</th>
								<th width="70px">状态</th>
								<th width="200px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.logisticsList }" var="logistics"
								varStatus="status">
								<tr>
									<td><label><input type="checkbox" class="ace"><span
											class="lbl"></span></label></td>
									<td>${logistics.logisticsOrder.orderId}</td>
									<td class="order_product_name"><c:forEach
											items="${logistics.logisticsOrder.orderDetailList }"
											var="detail" varStatus="mystatus">
											<a><img
												src="upImgs/${detail.detailGoods.goodsImg}"
												title="${detail.detailGoods.goodsImg }**" /></a>
											<!-- <i class="fa fa-plus"></i> -->
										</c:forEach> <!-- <a href="admin/order_detailed.jsp"><img src="products/p_1.jpg"  title="产品名称"/></a>
      <i class="fa fa-plus"></i>
      <a href="admin/order_detailed.jsp"><img src="products/p_2.jpg"  title="产品名称"/></a> -->
									</td>
									<td>${logistics.logisticsOrder.orderAllPrice}</td>
									<td>0</td>
									<td><fmt:formatDate
											value="${logistics.logisticsOrder.orderDate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${logistics.logisticsOrder.orderName}</td>
									<td>${logistics.logisticsOrder.orderDetailList.size()}</td>
									<td class="td-status"><span
										id="span${logistics.logisticsOrder.orderId}"
										class="label label-success radius">${logistics.logisticsStatu.statuName}</span></td>
									<td>
										<div class="sendThing">
											<a
												onClick="Delivery_stop(this,'10001','${logistics.logisticsOrder.orderId}','${logistics.logisticsStatu.statuId}')"
												href="javascript:;" title="发货"
												class="btn btn-xs btn-success"><i
												class="fa fa-cubes bigger-120"></i></a>

										</div> <a title="订单详细"
										href="${pageContext.request.contextPath}/businessMsg/getDetail?orderId=${logistics.logisticsOrder.orderId}"
										class="btn btn-xs btn-info order_detailed"><i
											class="fa fa-list bigger-120"></i></a>

										<div class="delThing">
											<a title="删除" href="javascript:;"
												onclick="Order_form_del(this,'1','${logistics.logisticsOrder.orderId}','${logistics.logisticsStatu.statuId}')"
												class="btn btn-xs btn-warning"><i
												class="fa fa-trash  bigger-120"></i></a>
										</div>

									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--发货-->
		<div id="Delivery_stop" style=" display:none">
			<div class="">
				<div class="content_style">
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="form-field-1">快递公司 </label>
						<div class="col-sm-9">
							<select class="form-control" id="form-field-select-1">
								<option value="8">--选择快递--</option>
								<c:forEach items="${requestScope.expressList }" var="express">
									<option value="${express.expressId }">${express.expressName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="form-field-1"> 快递号 </label>
						<div class="col-sm-9">
							<input readonly="readonly" type="text" id="form-field-1"
								placeholder="快递号" class="col-xs-10 col-sm-5"
								style="margin-left:0px;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="form-field-1">货到付款 </label>
						<div class="col-sm-9">
							<label><input name="checkbox" type="checkbox" class="ace"
								id="checkbox"><span class="lbl"></span></label>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
<script>
//左侧显示隐藏
$(function() { 
	$("#order_list").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
		close_btn:'.close_btn',
		show_btn:'.show_btn',
		side_list:'.side_list',
	});
});
//顶部隐藏显示
$(function() { 
	$("#Order_form_style").fix({
		float : 'top',
		//minStatue : true,
		skin : 'green',	
		durationTime :true,
		spacingw:0,
		spacingh:0,
		close_btn:'.top_close_btn',
		show_btn:'.top_show_btn',
		side_list:'.hide_style',
		close_btn_width:80,
		side_title:'.Statistic_title',
	});
});
//时间选择
 laydate({
    elem: '#start',
    event: 'focus' 
});
/*订单-删除*/
function Order_form_del(obj,id,order,statuId){
if(statuId!=9 || statuId==4){
	layer.msg('订单状态有误!',{icon:2,time:1000});
	return;
}
	var spanid="#span"+order;
	layer.confirm('确认要删除吗？',{
		btn:['删除','取消']
	},function(index){
	$.ajax({
	   type: "POST",
	   url: "${pageContext.request.contextPath}/businessMsg/delOrder?orderId="+order,
	   success: function(msg){
	    //$(obj).parents("tr").remove();
	    $(spanid).html("禁用");
		layer.msg('已修改!',{icon:1,time:1000});
	   }
	});
	},function(index){
		layer.msg('删除失败!',{icon:1,time:1000});
	});
}
/**发货**/
function Delivery_stop(obj,id,order,statuId){
var spanid="#span"+order;
if(statuId==7  && returnStatu==null){
$("#form-field-1").prop("value",order);
	layer.open({
        type: 1,
        title: '发货',
		maxmin: true, 
		shadeClose:false,
        area : ['500px' , ''],
        content:$('#Delivery_stop'),
		btn:['确定','取消'],
		yes: function(index, layero){	
		if($('#form-field-1').val()==""){
			layer.alert('快递号不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			
			}else{	
			$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/businessMsg/updateOrder?orderId="+order+"&expressId="+$("#form-field-select-1").prop("value"),
			   success: function(msg){
			   returnStatu=msg;
			   $(spanid).html(msg+"已发货");
			    layer.alert('成功发货！',{
	               title: '提示框',				
				   icon:0,		
				  })
			   }
			});		
			 
			layer.close(index);    		  
		  }
		
		}
	})
	
}else{
	layer.msg('订单状态有误!',{icon:2,time:1000});
	return;
}
}


//面包屑返回值
var returnStatu=null;
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form,.order_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').jsp();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').jsp(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').jsp("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});

//初始化宽度、高度
$(".hide_style").height($(".hide_style").height()); 
 var heights=$(".hide_style").outerHeight(true)+90;  
 $(".widget-box").height($(window).height()-heights); 
$(".table_menu_list").width($(window).width()-250);
 $(".table_menu_list").height($(window).height()-heights);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-heights);
	 $(".table_menu_list").width($(window).width()-250);
	  $(".table_menu_list").height($(window).height()-heights);
	})
//比例
var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
			$('.easy-pie-chart.percentage').each(function(){
				$(this).easyPieChart({
					barColor: $(this).data('color'),
					trackColor: '#EEEEEE',
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: 10,
					animate: oldie ? false : 1000,
					size:103
				}).css('color', $(this).data('color'));
			});
		
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
</script>
<script>
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
</script>