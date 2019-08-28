<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<ul>
	                	<c:forEach items="${requestScope.integraldetailList }" var="integralDetail">
	                		<li>
		                        <div class="d">
		                            <dl>
		                                <c:choose>
		                                	<c:when test="${not empty integralDetail.integraldetailOrder }">
		                                		<dt><a href="javascript:void(0)"><img src="upImgs/${integralDetail.integraldetailOrder.orderDetailList[0].detailGoods.goodsImg }"></a></dt>
				                                <dd><a href="javascript:void(0)">${integralDetail.integraldetailOrder.orderDetailList[0].detailGoods.goodsName }</a></dd>
				                                <dd class="hui">编号：${integralDetail.integraldetailOrder.orderId }</dd>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<c:if test="${integralDetail.integraldetailIntegralnum lt 0 }">
		                                			<dt><a href="javascript:void(0)"><img src="upImgs/youhuiquan.png"></a></dt>
					                                <dd><a href="javascript:void(0)">积分兑换优惠券</a></dd>
					                                <dd class="hui">编号：${integralDetail.integraldetailId+1000 }</dd>
		                                		</c:if>
		                                		<c:if test="${integralDetail.integraldetailIntegralnum gt 0 }">
		                                			<dt><a href="javascript:void(0)"><img src="upImgs/login.png"></a></dt>
					                                <dd><a href="javascript:void(0)">登录得积分</a></dd>
					                                <dd class="hui">login</dd>
		                                		</c:if>
		                                	</c:otherwise>
		                                </c:choose>
		                            </dl>
		                        </div>
		                        <c:choose>
		                        	<c:when test="${integralDetail.integraldetailIntegralnum gt 0 }">
		                        		<div class="e red">+${integralDetail.integraldetailIntegralnum }</div>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="e green">${integralDetail.integraldetailIntegralnum }</div>
		                        	</c:otherwise>
		                        </c:choose>
		                        
		                        <div class="f">
		                        	<fmt:formatDate value="${integralDetail.integraldetailDate }" pattern="yyyy-MM-dd"/>
		                        </div>
		                    </li>
	                	</c:forEach>
	                </ul>
