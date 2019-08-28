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
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>       
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
	    <script src="js/jquery-1.9.1.min.js"></script>
	    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
         <script src="assets/layer/layer.js" type="text/javascript" ></script>
<title>添加产品分类</title>
  </head>
  
  <body>
  <div class="type_style">
 <div class="type_title">产品类型信息</div>
  <div class="type_content">
  <div class="Operate_btn">
  <a href="javascript:ovid()" class="btn  btn-warning"><i class="icon-edit align-top bigger-125"></i>新增子类型</a>
  <a href="javascript:ovid()" class="btn  btn-success"><i class="icon-ok align-top bigger-125"></i>禁用该类型</a>
  </div>
  <form action="" name="myform" method="post" class="form form-horizontal" id="form-user-add">
    <div class="Operate_cont clearfix">
      <label class="form-label"><span class="c-red">*</span>分类名称：</label>
      <div class="formControls ">
        <input type="text" class="input-text" value="" placeholder="请在此输入类型名" id="typeName" name="typeName">
      </div>
    </div>
    <div class="Operate_cont clearfix">
      <label class="form-label"><span class="c-red">*</span>上级类型：</label>&nbsp;&nbsp;&nbsp;
      <div class="formControls ">
                                    <select class="select" id="typeId" name="typePid.typeId" style="margin-left: 10px">
									<option>请选择类型:</option>
											<%-- <c:forEach items="${applicationScope.typeList}" var="typeList">
											    <option  value="${typeList.typeId }">${typeList.typeName}</option>
											</c:forEach> --%>
									    <option value="1">母婴专区</option>
									    <option value="14">美妆护肤</option>
									    <option value="27">家具生活</option>
									    <option value="40">食品营养</option>
						            </select>
      </div>
    </div>
    <div class="Operate_cont clearfix">
    <label class="form-label">备注：</label>
    <div class="formControls">
    <textarea name="msgName" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,100)"></textarea>
     <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
    </div>
    </div><span style="color: red;font-size: 16px;">${sessionScope.msg}</span>
    <div class="">
     <div class="" style=" text-align:center">
      <input class="btn btn-primary radius" type="button" onclick="saveType()"  value="提交">
      <input class="btn btn-primary radius" type="reset" value="取消">
      </div>
    </div>
  </form>
  <script type="text/javascript">
  function saveType(){
		  var typeId=$("#typeId").val();
		  var typeName=$("#typeName").val();
          if(typeName==""||typeId==""){
			   layer.msg('您输入的信息不完整！',{icon:2,time:2000});
			}
		  else{ 
			   document.myform.action="${pageContext.request.contextPath}/backType/saveType";
			   document.myform.submit();
			   /* if(${requestScope.msg}=="")
			     layer.msg('添加商品类型成功！',{icon:1,time:2000});
			   else
			     alert("444"); */
			   
			}
  }
  </script>
  
  </div>
</div> 
</div>
<script type="text/javascript" src="Widget/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="assets/layer/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-user-add").Validform({
		tiptype:2,
		callback:function(form){
			form[0].submit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script>
  </body>
</html>
