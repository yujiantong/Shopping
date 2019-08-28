<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<ul>
                	<c:forEach items="${requestScope.couponList }" var="coupon">
                		<li>
	                        <div class="jj">
	                            <span class="banyuan"></span>
	                            <span class="guoqi"></span>
	                            <p class="one">￥${coupon.couponReduce }</p>
	                            <p>【消费满${coupon.couponAvail }元可用】</p>
	                            <p style="margin-top: 10px;">
	                            <fmt:formatDate value="${coupon.couponBegin }" pattern="yyyy-MM-dd"/> -- 
	                            <fmt:formatDate value="${coupon.couponEnd }" pattern="yyyy-MM-dd"/>
	                            </p>
	                        </div>
	                        <div class="kk">
	                            <p>劵 编 号：${coupon.couponId+1000 }</p>
	                            <p>品类限制：${coupon.couponRange }</p>
	                        </div>
	                    </li>
                	</c:forEach>
                </ul>
                <div class="clear"></div>
	