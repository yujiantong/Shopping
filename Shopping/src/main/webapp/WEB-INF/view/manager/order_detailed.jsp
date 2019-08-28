<%@page import="com.web.entity.Orders"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        <link rel="stylesheet" href="css/style3.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script> 
        <script type="text/javascript" src="js/H-ui.js"></script>      	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="js/lrtk.js" type="text/javascript" ></script>
<title>订单详细</title>
</head>

<body>
<div class="margin clearfix">
<div class="Order_Details_style">
<div class="Numbering">订单编号:<b>${requestScope.order.orderId }</b></div></div>
 <div class="detailed_style">
 <!--收件人信息-->
    <div class="Receiver_style">
     <div class="title_name">收件人信息</div>
     <div class="Info_style clearfix">
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 收件人姓名： </label>
         <div class="o_content">${requestScope.order.orderName}</div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 收件人电话： </label>
         <div class="o_content">${requestScope.order.orderPhone}</div>
        </div>
         <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 收件地邮编： </label>
         <div class="o_content">100089</div>
        </div>
         <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 收件地址： </label>
         <div class="o_content">${requestScope.order.orderAddress}</div>
        </div>
     </div>
    </div>
    <!--订单信息-->
    <div class="product_style">
    <div class="title_name">产品信息</div>
    <div class="Info_style clearfix">
    
    
        <c:forEach items="${requestScope.order.orderDetailList }" var="detail" varStatus="statu">
          <c:set var="count" value="0"></c:set>
          <div class="product_info clearfix">
         
		      <a href="#" class="img_link"><img src="upImgs/${detail.detailGoods.goodsImg}"  width="200" height="200"/></a>
		      <span>
		      <a href="#" class="name_link">${detail.detailGoods.goodsName}</b>
		      <p>规格：${detail.detailGoods.goodsStandard.standardId}</p>
		      <p>数量： ${detail.detailNum}</p>
		      <c:set var="count" value="${count+detail.detailNum}"></c:set>
		      <p>价格：<b class="price"><i>￥</i>${detail.detailPrice}</b></p>  
		      <p>状态：<i class="label label-success radius">${detail.detailGoods.goodsState.statuName}</i></p>   
		      </span>
      </div>
        </c:forEach>
    </div>
    </div>
    <!--总价-->
    <div class="Total_style">
     <div class="Info_style clearfix">
      <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 支付方式： </label>
         <div class="o_content">在线支付</div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 支付状态： </label>
         <div class="o_content">${logistics.logisticsStatu.statuName}</div>
        </div>
        <div class="col-xs-4">  
         <label class="label_name" for="form-field-2"> 订单生成日期： </label>
         <div class="o_content"><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd"/> </div>
        </div>
        </div>
       
      <div class="Total_m_style"><span class="Total">总数：<b>${requestScope.order.orderDetailList.size() }</b></span><span class="Total_price">总价：<b>${order.orderAllPrice}</b>元</span></div>
    </div>
<div class="Button_operation">
           <form action="${pageContext.request.contextPath}/businessMsg/getDetailMsg" method="post">
				<button  class="btn btn-primary radius" type="submit"><i class="icon-save "></i>返回上一步</button>
				
				<button  class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			
			</form>
</div>
 </div>
</div>
</body>
</html>
