<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加收货地址</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
             <form action="${pageContext.request.contextPath}/ordersAddress/addAddress" method="post" id="myForm1">
        	<table cellpadding="0" cellspacing="0" border="0px" width="80%" align="center">
        		<tr height="80px">
        			<th>收货人地址:</th>
        			<td><input type="text" name="addressDesc" "/></td>
        		</tr>
        		<tr height="80px">
        			<th>收货人姓名:</th>
        			<td><input type="text" name="addressName" /></td>
        		</tr>
        		<tr height="80px">
        			<th>收货人电话:</th>
        			<td><input type="text" name="addressPhone" /></td>
        		</tr>
        		<tr>
        		    <td align="center"><input type="button" onclick="close2()" value="取消添加"/></td>
        		    <td align="center"><input type="submit" value="确认提交"/></td>
        		</tr>
        	</table>
        </form>
  </body>
  <script type="text/javascript">
  	 function	close2(){
  	//alert("5555");
  		var index=parent.layer.getFrameIndex(window.name);
  		//alert(index);
	    parent.layer.close(index);
  	}
  </script>
</html>
