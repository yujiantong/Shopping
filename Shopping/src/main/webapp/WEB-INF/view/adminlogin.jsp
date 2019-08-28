<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="css/style3.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->

<script src="assets/layer/layer.js" type="text/javascript"></script>

</head>

<body class="login-layout">

	<script type="text/javascript">
		function check(flag) {
			if (flag == 'name') {
				if ($("#adminName").prop("value") == "") {
					//alert("未填写用户名");
					layer.tips("用户名为空", '#adminName', {
						tips : [ 1, 'rgb(44,133,184)' ]
					});
				}
			} else if (flag == "pass") {
				if ($("#adminPass").prop("value") == "") {
					//alert("未填写密码");
					layer.tips("密码为空", '#adminPass', {
						tips : [ 1, 'rgb(44,133,184)' ]
					});
				}
			}
		}

		function checkSub() {
			var adminPass=$("#adminPass").prop("value");
			var adminName=$("#adminName").prop("value");
 			/* if ($("#adminPass").prop("value") == ""
					|| ("#adminPass").prop("value") == "") {
				layer.tips("信息不完整", '#adminName', {
					tips : [ 1, 'rgb(44,133,184)' ]
				});
				
			}   */
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/admin/adminLogin?adminName="+adminName+"&adminPass="+adminPass,
							success : function(msg) {
								if (msg == false) {
									layer.msg('登录失败!',{
									icon:2,
									time:1000,
									offset:'8%',
									shift:6
									});
								} else {
								
									$("#adminloginform")
											.prop("action",
													"${pageContext.request.contextPath}/path/manager/index");
									$("#adminloginform").submit();
								}
							}
						});
			}
		
	</script>
	<div class="logintop">
		<span>欢迎后台管理界面平台</span>
		<ul>
			<li><a href="#">返回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<h1>
					<i class="icon-leaf green"></i> <span class="orange">商城</span> <span
						class="white">后台管理系统</span>
				</h1>
				<h4 class="white">Background Management System</h4>
			</div>

			<div class="space-6"></div>

			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i> 管理员登陆
							</h4>

							<div class="login_icon">
								<img src="images/login.png" />
							</div>

							<form name="adminloginform" action="" method="post"
								id="adminloginform">

								<fieldset>
									<label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="text" class="form-control" placeholder="登录名"
											id="adminName" name="adminName" onblur="check('name')">
											<i class="icon-user"></i>
									</span> <span id="nameMsg" style="color:red;">&nbsp;</span>
									</label> <label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="password" class="form-control" placeholder="密码"
											id="adminPass" name="adminPass" onblur="check('pass')">
											<i class="icon-lock"></i>
									</span>
									</label>

									<div class="space"></div>

									<div class="clearfix">
										<label class="inline"> <input type="checkbox"
											class="ace"> <span class="lbl">保存密码</span>
										</label>
										<button id="login_btn" type="button"
											class="width-35 pull-right btn btn-sm btn-primary"
											onclick="checkSub()">
											<i class="icon-key"></i> 登陆
										</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>

							<div class="social-or-login center">
								<span class="bigger-110">欢迎登录</span>
							</div>

							<div class="social-login center"></div>
						</div>
						<!-- /widget-main -->

						<div class="toolbar clearfix"></div>
					</div>
					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<div class="loginbm">
		版权所有 2018 <a href="">于建铜</a>
	</div>
	<strong></strong>
</body>
</html> 