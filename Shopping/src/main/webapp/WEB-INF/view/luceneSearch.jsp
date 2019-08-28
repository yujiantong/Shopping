<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	<link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
	<!-- 先加载jquery.js 在加载框架js -->
	<script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script> 
	<script type="text/javascript" src="js/auto/jquery.autocomplete.js"></script>
	<script type="text/javascript"> 
		$(function() {
			// autocomplete可以接受数组和JSON两种格式
			//var data ="JAVA JSP J2EE J2SE NET C C++".split(" ");
			// 把文本框转化为jquer对象,调用框架已经定义autocomplete方法
			//$('#keyword').autocomplete(data);
			$('#keyword').autocomplete("${pageContext.request.contextPath}/LuceneController/searchKeyWord.action",{
				delay:1000,
			    multiple: true,    
			    max:7,
			    height:30,    
			   	multipleSeparator: ' ',   
			    dataType: 'json',
				parse: function(data) {  
				     var rows = [];  
				     for(var i=0; i<data.length; i++){  
				      rows[rows.length] = {   
				        data:data[i].word,   
				        value:data[i].num,   
				        result:data[i].word   
				        };   
				      }  
				   return rows;  
				 },  
				 formatItem: function(row) {  
				      return row;        
				  }
			}).result(function(event,row){
				location.href="${pageContext.request.contextPath }/LuceneController/searchGoods.html?sname="+row;
			}); 
		});
	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
 	<!-- 新版本的IE文本框默认已经实现的自动填充功能,屏蔽此功能可以设置 autocomplete="off" -->
    <form action="${pageContext.request.contextPath }/LuceneController/searchGoods.html" method="post" autocomplete="off">
    	搜索<input type="text" name="sname" id="keyword" autocomplete="off"/>
    	<input type="submit" value="给我搜"/>
    </form>
    <table>
    	<c:if test="${not empty requestScope.goodsList }">
    		<tr>
	    		<td>序号</td>
	    		<td>商品ID</td>
	    		<td>商品名称</td>
	    		<td>商品价格</td>
	    		<td>商品图片</td>
	    	</tr>
    	</c:if>
    	<c:forEach items="${requestScope.goodsList }" var="goods" varStatus="statu">
    		<tr>
	    		<td>${statu.count }</td>
	    		<td>${goods.goodsId }</td>
	    		<td>${goods.goodsName }</td>
	    		<td>${goods.goodsPrice }</td>
	    		<td>${goods.goodsImg }</td>
	    	</tr>
    	</c:forEach>
    </table>
  </body>
  <!-- /* parse:function(data) {
					//后台返回json格式
					//alert(data);
					return $.map(data, function(temp){
						return {
							data:temp,
							result:temp.word	
						}
					});
				}, */
				 /* parse:function(data) {//解释返回的数据，把其存在数组里  
                                        var parsed = [];  
                                        for (var i = 0; i < data.length; i++) {  
                                            parsed[parsed.length] = {  
                                            data: data[i],  
                                            value: data[i].itemid,  
                                            result: data[i].itemid //返回的结果显示内容  
                                            };  
                                        }  
                                        return parsed;  
                                    },  
				formatItem:function(row) {
					return row.word+"约"+row.num+"结果"+row; 
				}, */ -->
</html>
