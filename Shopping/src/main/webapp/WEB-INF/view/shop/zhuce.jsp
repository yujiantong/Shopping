<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/zhuce.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
</head>
<body>
<!---------------头部----------------->
<div class="wt1080 top">
    <div class="logo"><a href="${pageContext.request.contextPath }/goodstype/findAll"><img src="image/logo.png"></a></div>
    <div class="rr">
        <ul>
            <li>
                <img src="image/bg3.png">
                <p>全球正品货源</p>
            </li>
            <li>
                <img src="image/bg5.png">
                <p>一件代发</p>
            </li>
            <li>
                <img src="image/bg4.png">
                <p>全球直邮</p>
            </li>
            <li>
                <img src="image/bg6.png">
                <p>售后无忧</p>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</div>

<!----------------------中间------------------------->
<!-- onsubmit="return myOnSubmit()" -->
<div class="red">
    <div class="wt1080 login">
        <div class="login_pic"><img src="image/login.jpg"></div>
        <form  action="${pageContext.request.contextPath}/UsersController/saveUser.html" method="post">
        <div class="l_k">
            <h1>新用户注册</h1>
            <div class="l_k_d">用户名：<input onblur="judgeName()" id="userName" type="text" name="userName" placeholder="邮箱/手机/用户名"></div>
            <div class="l_k_d">设置密码：<input id="userPassword0" type="password" name="" placeholder="6-20个大小写英文字母、符号或数字"></div>
            <div class="l_k_d">确认密码：<input id="userPassword" type="password" name="userPassword" placeholder="请再次输入密码"></div>
            <div class="l_k_d">手机号码：<input id="userPhone" type="text" name="userPhone" placeholder="请输入手机号码"></div>
            <div class="l_k_s">验证码：<input id="keyNum" type="text" name="keyNum" placeholder="6位验证码"></div>
            <div class="verify" ><a href="javascript:void(0)" onclick="sendMsg()">发送验证码</a></div>
            <!-- <div class="verify">6Dte26</div> -->
            <p>点击注册，表示你同意洋店网<a href="javascript:void(0)">《服务协议》</a></p>
            <input name="" type="submit" class="res" value="注册">
        </div>
        </form>
        <div class="clear"></div>
    </div>
</div>
<!-------------------底部------------------------>
<div class="foot wt1080">
    <ul>
        <li><a href="javascript:void(0)">网站简介</a></li>
        <li><a href="javascript:void(0)">联系我们</a></li>
        <li><a href="javascript:void(0)">招商合作</a></li>
        <li><a href="javascript:void(0)">销售联盟</a></li>
    </ul>
    <p>Copyright © 2016 洋店网.版权所有.备案号：京ICP证35124521号.技术支持：西部网络</p>
</div>
<script type="text/javascript">

	$("#userPassword").blur(function(){
		var userPassword0 = $("#userPassword0").prop("value");
		var userPassword = $("#userPassword").prop("value");
		if(userPassword0 != "" && userPassword != userPassword0) {
			$("#userPassword0").prop("value","");
			$("#userPassword").prop("value","");
		    $("#userPassword").prop("placeholder", "两次输入的密码不一致");
		    $("#userPassword").css("color","red");
		}
	});

	function judgeName() {
		var userName = $("#userName").prop("value");
		//alert(userName);
		if(userName == "") {
			return false;
		} else {
			$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/UsersController/judgeUserName.html?userName="+userName,
		   dataType: "text",
		   scriptCharset: "utf-8",
		   success: function(msg){
		     //$("#key").prop("value", msg);
		     if(msg == "no") {
		     	msg="该用户名已被注册";
		     	$("#userName").prop("value","");
		     	$("#userName").prop("placeholder", msg);
		     	$("#userName").css("color","red");
		     } 
		     //alert(msg);
		   }
		});
		}
	}
	
	$("#userName").focus(function(){
	  $("#userName").css("color","black");
	});
	
	$("#userPassword").focus(function(){
	  $("#userPassword").css("color","black");
	});
	
	$("#keyNum").focus(function(){
	  $("#keyNum").css("color","black");
	});
	
	$("#userPhone").focus(function(){
	  $("#userPhone").css("color","black");
	});
	
	var keycode = null;
	$("form").submit( function () {
	  //alert("testform");
		var key = $("#keyNum").prop("value");
		/* alert(key);
		alert(keycode); */
		if( key == keycode) {
			return true;
		} else {
			$("#keyNum").prop("value","");
			$("#keyNum").prop("placeholder", "验证码输入有误");
			$("#keyNum").css("color","red");
			return false;
		}
	} );
	
	function sendMsg() {
		//alert("test");
		/* if(userPhone == "") {
			$("#userPhone").prop("value","");
		    $("#userPhone").prop("placeholder", "手机号码不能为空");
		    $("#userPhone").css("color","red");
		} else  */
		var userPhone = $("#userPhone").prop("value");
		if(!(/^1[34578]\d{9}$/.test(userPhone))) {
			$("#userPhone").prop("value","");
		    $("#userPhone").prop("placeholder", "手机号码有误，请重新填写");
		    $("#userPhone").css("color","red");
		} else {
			$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/UsersController/sendMsg.html?userPhone="+userPhone,
		   success: function(msg){
		     //$("#key").prop("value", msg);
		     keycode = msg;
		     //alert(keycode);
		   }
		});
		}
	}
</script>
</body>
</html>
	