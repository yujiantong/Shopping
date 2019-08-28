<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style3.css" />
<link href="assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<link href="css/upfile_common.css" type="text/css" rel="stylesheet"/>
<link href="css/upfile_index.css" type="text/css" rel="stylesheet"/>
<script src="js/upfile_jquery.js"></script>
<script src="js/imgUp.js"></script>	
<script type="text/javascript" src="assets/layer/layer.js"></script>
<!-- jar -->
<script src="js/jquery-1.9.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>
	<script src="assets/layer/layer.js" type="text/javascript"></script>
	<script src="assets/laydate/laydate.js" type="text/javascript"></script>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
	<script src="js/lrtk.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
<title>新增图片</title>

<body>
     <div class="clearfix" id="add_picture">
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
						<h4 class="lighter smaller">添加商品</h4>
					</div>
					<ul class="b_P_Sort_list">
            <li><i class="orange  fa fa-reorder"></i><a href="javascript:void(0)">商品类型</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">母婴专区</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">美妆护肤</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">家居生活</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">食品营养</a></li>
              </ul>
					
				</div>
			</div>
		</div>


		<div class="page_right_style" >
			<div class="type_title">修改商品信息</div>
			<form name="myform" action="" method="post" enctype="multipart/form-data"
				id="form-article-add">
				<div class="clearfix cl">
					<label class="form-label col-2"><span class="c-red">*</span>商品名称：</label>
					<div class="formControls col-10">
						<input  type="text" id="gname"   class="input-text" value="${requestScope.goods.goodsName}" 
							 name="goodsName"/>
						<span id="nameMsge"></span>	<br/>
					</div>
				</div>
				
				<div class=" clearfix cl">

					<div class="Add_p_s">
						<label class="form-label col-2">产品价格：</label>
						<div class="formControls col-2">
							<input type="text" class="input-text" value="${requestScope.goods.goodsPrice}"
								id="gprice" name="goodsPrice">
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">产&nbsp;&nbsp;&nbsp;&nbsp;地：</label>
						<div class="formControls col-2">
							<input type="text" class="input-text" value="${requestScope.goods.goodsFromaddress}" 
								id="gaddress" name="goodsFromaddress"/>
						</div>
					</div>
					
					<div class="Add_p_s">
				    </div>
				    <div class="Add_p_s">
				    </div>
					
					<div class="Add_p_s">
						<label class="form-label col-2">库存数量：</label>
						<div class="formControls col-2">
							<input type="text" class="input-text" value="${requestScope.goods.goodsNum}" 
								id="gnum" name="goodsNum"/>
						</div>
					</div>
					<div class="Add_p_s">
						<label class="form-label col-2">商品种类：</label>
						<div class="formControls col-2">
							<span class="select-box"> 
							<select class="select" name="goodsType.typeId" id="gtypeid">
									<option value="${requestScope.goods.goodsType.typeId}">${requestScope.goods.goodsType.typeName}</option>
									<c:forEach items="${applicationScope.typeList}" var="typeList">
									<option  value="${typeList.typeId}">${typeList.typeName}</option>
									</c:forEach>
							</select>
							</span>
						</div>
					</div>
			</div>
			<p class="up-p" style="margin-left:30px;">原商品图片</p>	
			<img src="upImgs/${requestScope.goods.goodsImg}">
			<p class="up-p" style="margin-left:30px;">商品图片：原商品图片不会保留</p>	
<div class="img-box full" >
	<section class=" img-section">
		<div class="z_photo upimg-div clear" style="width:920px;">
				 <section class="z_file fl">
					<img src="img/a11.png" class="add-img">
					<input type="file" name="myimg" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
				 </section>
		 </div>
	 </section>
</div>
<aside class="mask works-mask">
	<div class="mask-content">
		<p class="del-p ">您确定要删除作品图片吗？</p>
		<p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
	</div>
</aside>
				
		
				<div class="clearfix cl">
					<div class="Button_operation">
					<a onclick="updateSubmit(${requestScope.goods.goodsId})" class="btn btn-primary radius" >
							<i class="icon-save "></i>确认修改</a>
						<a href="${pageContext.request.contextPath}/goodsBack/findAll" class="btn btn-primary radius"
							type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</a>
					</div>
				</div>
			</form>
		</div>
	
	<script type="text/javascript">
					function updateSubmit(goodsId){
					            var gname=$("#gname").val();
							    var gprice =$("#gprice").val();
							    var gaddress =$("#gaddress").val(); 
							    var gnum =$("#gnum").val(); 
							    var gtypeid = $("#gtypeid").val();
							    if(gname==""||gprice==""||gaddress==""||gnum==""||gtypeid==""){
							      layer.msg('您输入的信息不完整，请完善后提交！',{icon:2,time:2000});
							      }
							    else{ 
							      document.myform.action="${pageContext.request.contextPath}/goodsBack/updateGoods?goodsId="+goodsId;
							      document.myform.submit();
							      layer.msg('修改成功！',{icon:1,time:2000});
							   }
						}
						
						
						
							   
		$(document).ready(function() {
			//初始化宽度、高度

			$(".widget-box").height($(window).height());
			$(".page_right_style").height($(window).height());
			$(".page_right_style").width($(window).width() - 220);
			//当文档窗口发生改变时 触发  
			$(window).resize(function() {

				$(".widget-box").height($(window).height());
				$(".page_right_style").height($(window).height());
				$(".page_right_style").width($(window).width() - 220);
			});
		});
		
	</script>
	
</body>
</html>