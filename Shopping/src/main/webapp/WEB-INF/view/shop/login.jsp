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
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/loginFont.css" type="text/css" rel="stylesheet"/>
    <!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	<link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <!-- 先加载jquery.js 在加载框架js -->
	<script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script> 
	<script type="text/javascript" src="js/auto/jquery.autocomplete.js"></script>
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
<div class="red">
    <div class="wt1080 login">
        <div class="login_pic"><img src="image/login.jpg"></div>
        <div class="l_k">
            <div class="l_k_t">
                <span class="one">登陆洋店</span>
                <span class='two'>还没有洋店帐号？<a href="${pageContext.request.contextPath }/path/shop/zhuce.html">30秒注册</a></span>
            </div>
            <!-----------登录框----------->
            
            <form action="${pageContext.request.contextPath }/UsersController/userLogin.html">
            
            <div class="l_k_d">
                <input name="userName" type="text" class="admin" placeholder="邮箱/手机/用户名">
                <c:choose>
                	<c:when test="${empty requestScope.msg }">
                		<input id="userPassword" name="userPassword" type="password" class="pass" placeholder="密码">
                	</c:when>
                	<c:otherwise>
                		<input id="userPassword" name="userPassword" type="password" class="pass" style="color: red;" placeholder="用户名或密码有误">
                	</c:otherwise>
                </c:choose>
                
                <!-- <input name="key" type="text" class="key" placeholder="验证码"> -->
            </div>
            <div class="mem">
                <span><input type="checkbox" >自动登陆</span>
                <a href="javascript:void(0)">忘记密码？</a>
                <a href=""></a>
            </div>
            <input type="submit" class="s_login" value="马上登陆">
            <span class="xie"></span>
            </form>
            <div align="center">
            <a href=""><img title="QQ登录" src="image/qq.jpg"></a>
            <a href="${pageContext.request.contextPath}/UsersController/weiBoLogin"><img title="微博登录" src="image/weibo.jpg"></a>
            <a href=""><img title="微信登录" src="image/weixin.jpg"></a>
            </div>
        </div>
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
	$("#userPassword").focus(function(){
		 $("#userPassword").css("color","black");
	});
</script>
</body>
</html>
	