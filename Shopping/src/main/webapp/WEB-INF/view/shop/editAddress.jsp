<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改地址</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
	

  </head>
  
  <body>
        <form action="${pageContext.request.contextPath}/ordersAddress/updateAddress" method="post" id="myForm1">
        	<table cellpadding="0" cellspacing="0" border="0px" width="80%" align="center">
        		<tr height="80px">
        			<th>收货人地址:</th>
        			<td><input type="text" name="addressDesc" placeholder="${requestScope.address.addressDesc}"/></td>
        			<input type="hidden" value="${requestScope.address.addressId}" name="addressId"/>
        		</tr>
        		<tr height="80px">
        			<th>收货人姓名:</th>
        			<td><input type="text" name="addressName" placeholder="${requestScope.address.addressName}"/></td>
        		</tr>
        		<tr height="80px">
        			<th>收货人电话:</th>
        			<td><input type="text" name="addressPhone" placeholder="${requestScope.address.addressPhone}"/></td>
        		</tr>
        		<tr>
        		    <td align="center"><input type="button" onclick="close2()" value="取消修改"/></td>
        		    <td align="center"><input type="submit" value="确认提交"/></td>
        		</tr>
        	</table>
        </form>
    	
  </body>
  <script type="text/javascript">
  
  /*  function submmit11(){
   		$("#myForm1").submit();
	 var index=parent.layer.getFrameIndex(window.name);//鑾峰彇绐楀彛绱㈠紩
	 setTimeout(
	 	function(){
	 	parent.layer.close(index);
	 	},2
	 );

   } */
 /*  function submmit11(){
	  alert("1111");
	   $.post("${pageContext.request.contextPath}/ordersAddress/updateAddress",
		  $("#myForm1").serialize(), 
		  function(data){
		   alert("Data Loaded: " + data);
		   if(data=="true"){
			   var index=parent.layer.getFrameIndex(window.name);//获取窗口索引
		       alert(index);
		       parent.layer.close(index); */
			  /* setTimeout(
			 	function(){
			 	parent.layer.close(index);
			 	},2 
			 );  */
			 
	/* 	 }
		 }); 
  } */
 
  function	close2(){
  	//alert("5555");
  		var index=parent.layer.getFrameIndex(window.name);
  		//alert(index);
	    parent.layer.close(index);
  	}
  </script>
</html>
