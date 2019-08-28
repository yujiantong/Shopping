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
<title>客服</title>
<link rel="stylesheet" type="text/css" href="css/chatstyle.css" />
<script type="text/javascript" src="js/my.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		function send() {
			var rsBtn = document.getElementById("rightSendBtn");
			var text = document.getElementById("rightText").value;
			if (text.trim() != "") {
				$
						.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/Msg/sendMsg?flag=manager&message="
									+ text,
							success : function(msg) {
								
							}
						});
				var rightContent = document.getElementById("rightContent");
				var option = document.createElement("option");
				var len = text.length;
				option.style.width = len * 15 + len * 2 + "px";
				option.style.marginLeft = 350 - (len * 15 + len * 2) - 72
						+ "px";
				option.innerHTML = text;
				rightContent.appendChild(option);
				document.getElementById("rightText").value = "";
			}
		}
	</script>
	<script type="text/javascript">
		setInterval("getMsg()", 1000);
		function getMsg() {
			$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/Msg/getMsg?flag=user",
						success : function(msg) {
							if (msg != "" && msg != null) {
								var rightContent = document
										.getElementById("rightContent");
								var option1 = document.createElement("option");
								option1.innerHTML = msg;
								var len = msg.length;
								option1.style.backgroundColor = "white";
								option1.style.marginLeft = "10px";
								option1.style.width = len * 15 + len * 2 + "px";
								rightContent.appendChild(option1);
							}
						}
					});
		}
	</script>
	<div class="outer">
		<!-- <div class="box">
				<div class="chat">
					<div class="top">
						<span class="">客服</span>
					</div>
					<div class="content">
						<select multiple="multiple" id="leftContent">
						</select>
					</div>
					<div class="send">
						<input type="text" id="leftText" class="sText"/>
						<input type="button" id="leftSendBtn" class="btn" value="发送"/>
					</div>
				</div>
			</div> -->



		<div>
			<div class="top">
				<span class=""> 
				        <c:choose>
						<c:when test="${not empty sessionScope.loginUsers}">
				        ${sessionScope.loginUsers.userName}
				        </c:when>
						<c:otherwise>
				        游客身份
				       </c:otherwise>
					   </c:choose>
				</span>
			</div>
			<div class="content">
				<select multiple="multiple" id="rightContent">

				</select>
			</div>
			<div class="send">
				<input type="text" id="rightText" class="sText" /> <input
					type="button" id="rightSendBtn" class="btn" value="发送"
					onclick="send()" />
			</div>
		</div>
	</div>
</body>
</html>
