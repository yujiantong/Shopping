<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

<title>评价</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/upfile_common.css" type="text/css" rel="stylesheet" />
<link href="css/upfile_index.css" type="text/css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="css/qq.css" />
<script type="text/javascript" src="js/star.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>

<script src="js/upfile_jquery.js"></script>
<script src="js/imgUp.js"></script>
<link href="css/public.css" type="text/css" rel="stylesheet" />
<link href="css/liebiao.css" type="text/css" rel="stylesheet" />
<!-- <script src="js/jquery.min.js"></script> -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="js/slide.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>

<link href="css/bootstrap.min.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" href="css/reset.css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qqFace.js"></script>
<script type="text/javascript" src="js/jquery-form.js"></script>
</head>

<body>

     <div style="height:10px;"></div>
	<div style="margin-left:10px;">
		<form action="" method="post" enctype="multipart/form-data"
			id="myform" style="margin-left:50px;">
			服务质量： <a href="javascript:click(1)"><img src="image/star.png"
				id="star11" onMouseOver="over(1)" onMouseOut="out(1)" /></a> <a
				href="javascript:click(2)"><img src="image/star.png" id="star12"
				onMouseOver="over(2)" onMouseOut="out(2)" /></a> <a
				href="javascript:click(3)"><img src="image/star.png" id="star13"
				onMouseOver="over(3)" onMouseOut="out(3)" /></a> <a
				href="javascript:click(4)"><img src="image/star.png" id="star14"
				onMouseOver="over(4)" onMouseOut="out(4)" /></a> <a
				href="javascript:click(5)"><img src="image/star.png" id="star15"
				onMouseOver="over(5)" onMouseOut="out(5)" /></a> <span id="message"></span><br />
			物流速度： <a href="javascript:click2(1)"><img src="image/star.png"
				id="star21" onMouseOver="over2(1)" onMouseOut="out2(1)" /></a> <a
				href="javascript:click2(2)"><img src="image/star.png"
				id="star22" onMouseOver="over2(2)" onMouseOut="out2(2)" /></a> <a
				href="javascript:click2(3)"><img src="image/star.png"
				id="star23" onMouseOver="over2(3)" onMouseOut="out2(3)" /></a> <a
				href="javascript:click2(4)"><img src="image/star.png"
				id="star24" onMouseOver="over2(4)" onMouseOut="out2(4)" /></a> <a
				href="javascript:click2(5)"><img src="image/star.png"
				id="star25" onMouseOver="over2(5)" onMouseOut="out2(5)" /></a> <span
				id="message2"></span><br /> 
		       商品质量： <a href="javascript:click3(1)"><img
				src="image/star.png" id="star31" onMouseOver="over3(1)"
				onMouseOut="out3(1)" /></a> <a href="javascript:click3(2)"><img
				src="image/star.png" id="star32" onMouseOver="over3(2)"
				onMouseOut="out3(2)" /></a> <a href="javascript:click3(3)"><img
				src="image/star.png" id="star33" onMouseOver="over3(3)"
				onMouseOut="out3(3)" /></a> <a href="javascript:click3(4)"><img
				src="image/star.png" id="star34" onMouseOver="over3(4)"
				onMouseOut="out3(4)" /></a> <a href="javascript:click3(5)"><img
				src="image/star.png" id="star35" onMouseOver="over3(5)"
				onMouseOut="out3(5)" /></a> <span id="message3"></span><br/><br />
				 评价信息：
			<div style="margin-top: 10px">
			
				<div style="float: left;">
				<div  id="comment" contentEditable="true" style="height:70px;width:400px;border: 1px solid #CCCCCC;">
				       ${requestScope.msg}
				</div>
				    <!-- <textarea rows="5" cols="100" name="comment" id="comment" contentEditable="true" id="comment"></textarea>  -->
				</div>
			</div>
			<div>
					<textarea class="input" id="saytext" name="saytext" style="display: none"></textarea>
					<textarea class="input" id="hiddentext" style="display: none"></textarea>
			</div>
			<div style="margin-top:90px;margin-left:-20px;">
			         <p>
						<span class="emotion">表情</span>
						<input type="button" id="btn" value="提交表情">
						<input type="button" onclick="saveDiscuss()" id="submitbtn" value="提交评论" /><br />
					</p>
			</div>
			<!-- <input type="button" onclick="saveDiscuss()" id="submitbtn" value="提交评论" /><br /> -->
			
			<div class="img-box full">
		      </div>			
			<div class="img-box full" style="margin-left:-1px">
				<section class=" img-section">
				
				<div class="z_photo upimg-div clear" style="width:920px;">
					<section class="z_file fl"> <img src="img/a11.png"
						class="add-img" /> <input type="file" name="myimg" id="file"
						class="file" value=""
						accept="image/jpg,image/jpeg,image/png,image/bmp"
						multiple="multiple"/></section>
				</div>
				</section>
			</div>
			<aside class="mask works-mask">
			<div class="mask-content">
				<p class="del-p ">您确定要删除作品图片吗？</p>
				<p class="check-p">
					<span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span>
				</p>
			</div>
			</aside>
			
		</form>
	</div>
	<!-- 添加表情 -->
	<script type="text/javascript">

		$(function() {
			$('.emotion').qqFace({
				id : 'facebox',
				assign : 'saytext',
				path : 'arclist/' //表情存放的路径
			});
			$("#btn").click(function() {
				var str1=$("#comment").html();
				var str2=$("#saytext").val();
				
				var str = str1+str2;
				$("#hiddentext").html(str);
				$("#saytext").val("");
				$("#comment").append(replace(str2));
			});
		});
		//查看结果
		function replace(str) {
			str = str.replace(/\</g, '&lt;');
			str = str.replace(/\>/g, '&gt;');
			str = str.replace(/\n/g, '<br/>');
			str = str.replace(/\[em_([0-9]*)\]/g,
					'<img src="arclist/$1.gif" border="0" />');
			return str;
		}
	</script>
	
	<script type="text/javascript">
		$("#submitbtn").click(function(){
			var s1 = check;
			var s2 = check2;
			var s3 = check3;
			var comment=replace($("#hiddentext").text());
			var orderId = parent.$("#parentId").val();
			$("#myform").prop(
					"action",
					"${pageContext.request.contextPath}/DiscussController/saveDiucss?orderId=" +orderId +"&comment="+comment
							+ "&service=" + s1 + "&logistics=" + s2
							+ "&quality=" + s3);
			$("#myform").ajaxSubmit({
				type:"post",
				data:$("#myform").serialize(),
				contentType:"application/x-www-form-urlencoded;charset=utf-8",
				success : function(msg) {
					layer.msg('评论成功!', {
						icon : 1,
						time : 1000,
						offset : '50%',
						shift : 6
					});
				}
			});
			var index = parent.layer.getFrameIndex(window.name);
			layer.close(index);   
		
		});
		/* function saveDiscuss() {
			alert("ss");
			var s1 = check;
			var s2 = check2;
			var s3 = check3;
			var comment=$("#hiddentext").html();
			var goodsId = parent.$("#parentId").val();
			$("#myform").prop(
					"action",
					"${pageContext.request.contextPath}/DiscussController/saveDiucss?goodsId=1"+"comment="+comment;
							+ "&service=" + s1 + "&logistics=" + s2
							+ "&quality=" + s3);
			//$("#myform").prop("action","${pageContext.request.contextPath}/DiscussController/saveDiucss");
			$("#myform").ajaxSubmit({
				success : function(msg) {
					//alert("Data Save:")
					layer.msg('评论成功!', {
						icon : 1,
						time : 1000,
						offset : '50%',
						shift : 6
					});
					//parent.layer.closeAll("iframe");
				}
			});
			var index = parent.layer.getFrameIndex(window.name);
			layer.close(index);

		} */
	</script>
    </body>
</html>
