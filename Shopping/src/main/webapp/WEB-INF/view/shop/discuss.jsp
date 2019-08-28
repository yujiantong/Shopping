<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<c:forEach items="${requestScope.discussList }" var="discuss">
		<li>
			<p class="title">
				<span>${discuss.discussUser.userName }</span> （
				<fmt:formatDate value="${discuss.discussDate }" pattern="yyyy-MM-dd" />
				）
			</p>
			<p class="pic">
				<img width="72px" height="72px" src="upfile/${discuss.discussImg }">
			</p>
			<p class="mess">${discuss.discussComment }</p>
			<p class="admin">管理员：亲爱的用户，感谢你对德贝的支持，我们会继续坚持给您带来最极致的服务。</p>
		</li>
	</c:forEach>
