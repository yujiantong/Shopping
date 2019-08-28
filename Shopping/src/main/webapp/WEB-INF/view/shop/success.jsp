<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
<title>支付成功</title>
<link href="css/success_1.css" rel="stylesheet" type="text/css" />
<link href="css/success_2.css" rel="stylesheet" type="text/css" />

    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/order.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
</head>
<body>
 <div class="top">
    <div class="wt1080">
        <div class="fl">
            <a href="${pageContext.request.contextPath }/goodstype/findAll">洋店首页</a>&emsp;|&emsp;
           <c:choose>
           	<c:when test="${not empty sessionScope.loginUsers }">
           		 欢迎&emsp;${sessionScope.loginUsers.userName } &emsp;&emsp;
           	</c:when>
           	<c:otherwise>
           		请&emsp;
            <a href="${pageContext.request.contextPath }/path/shop/login.html" style="color: #ff9900">登陆</a>
            &emsp;或&emsp;
            <a href="${pageContext.request.contextPath }/path/shop/zhuce.html">立即注册</a>
           	</c:otherwise>
           </c:choose>
           
        </div>
        <div class="fr">
            <ul>
                <li style="position: relative;" id="my">
                    <a href="javascript:void(0)">我的洋店 <img src="image/sanjiao.png"></a>
                    <div class="personal">
                        <dl>
                            <c:choose>
                            	<c:when test="${not empty sessionScope.loginUsers }">
                            		<dt><a href="${pageContext.request.contextPath}/ordersFont/jumpToMyOrder">我的订单</a></dt>
		                            <dd><a href="${pageContext.request.contextPath }/CouponController/findUseConpon.html">我的优惠卷</a></dd>
		                            <dd><a href="${pageContext.request.contextPath}/IntegralexchangeController/findAllExchange.html">我的积分</a></dd>
		                            <dd><a href="${pageContext.request.contextPath }/UsersController/exitLogin.html">退出</a></dd>
                            	</c:when>
                            	<c:otherwise>
                            		<dt>还未登录，<a href="${pageContext.request.contextPath }/path/shop/login.html">去登录</a></dt>
                            	</c:otherwise>
                            </c:choose>

                        </dl>
                    </div>
                </li>
                <li><span class="shop">购物车<a href="${pageContext.request.contextPath}/cart/showCart">
                <c:choose>
                	<c:when test="${not empty sessionScope.cartNum }">
                		${sessionScope.cartNum }
                	</c:when>
                	<c:otherwise>
                		0
                	</c:otherwise>
                </c:choose>
                </a>件</span></li>
                <li><span class="phone"><a href="${pageContext.request.contextPath}/path/shop/article.html">手机洋店</a></span></li>
                <li><span><a href="${pageContext.request.contextPath}/path/shop/article.html">关于洋店</a></span></li>
                <li><span><a href="${pageContext.request.contextPath}/path/shop/article.html">帮助中心</a></span></li>
                <li><span class="phone2">028-6133 8882</span></li>
            </ul>
        </div>
    </div>
</div>
<br/><br/><br/>
<div class="box">
<!--机卡一体支付成功 开始-->
<div class="wxtsboxbr mt15">
  <div class="tcenter pt20 pb20 red font30 fonttb" style="color:black;"><p>&nbsp;</p><p>&nbsp;</p>支付成功，您的订单已经成功提交!<p>&nbsp;</p><p>&nbsp;</p>
       <div style="margin-left:200px;">
		    <p class="font16 c333 pl20 fontnor ml100" style="text-align:left;font:18px 楷体;">您的订单号是：${requestScope.r6_Order}</p>
			<p class="font16 c333 pl20 fontnor ml100" style="text-align:left;font:18px 楷体;"> 
			备注：1、为了保障您的权益，物品到柜后取货码会发至您的手机，请注意查收。<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			2、我们将尽快为您发货，请您保持联系电话畅通。
			</p>
		</div>
  </div>
  <div class="tcenter pt20 pb20">
  <a style="padding-top: 7px; padding-bottom: 4px" class="butbleucartd" href="${pageContext.request.contextPath }/goodstype/findAll">返回首页</a>
  <a style="padding-top: 7px; padding-bottom: 4px" class="butbleucartd" href="${pageContext.request.contextPath}/ordersFont/jumpToMyOrder">我的订单</a>
  </div>
<p>&nbsp;</p>
</div>
</div>

<!---------------底部--------------->
<div class="footer">
    <div class="wt1080" style="position: relative">
        <div class="a_footer">
            <div class="left">
                <a href="javascript:void(0)"><img src="image/logo.png"></a>
                <p class="lianxi">
                    <a href="javascript:void(0)"><img src="image/weixin.png"></a>
                    <a href="javascript:void(0)"><img src="image/weibo.png"></a>
                    <a href="javascript:void(0)"><img src="image/QQ.png"></a>
                    <span>028-6133 8882</span>
                </p>
            </div>
            <div class="right">
                <ul>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">新手指南</a></dt>
                            <dd><a href="javascript:void(0)">购物流程</a></dd>
                            <dd><a href="javascript:void(0)">支付方式</a></dd>
                            <dd><a href="javascript:void(0)">&nbsp;</a></dd>
                         </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dt>
                            <dd><a href="javascript:void(0)">通关关税</a></dd>
                            <dd><a href="javascript:void(0)">常见问题</a></dd>
                            <dd><a href="javascript:void(0)">&nbsp;</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">友情链接</a></dt>
                            <dd><a href="javascript:void(0)">购物流程</a></dd>
                            <dd><a href="javascript:void(0)">支付方式</a></dd>
                            <dd><a href="javascript:void(0)">&nbsp;</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">&nbsp;</a></dt>
                            <dd><a href="javascript:void(0)">购物流程</a></dd>
                            <dd><a href="javascript:void(0)">支付方式</a></dd>
                            <dd><a href="javascript:void(0)">&nbsp;</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="weixin"><img src="image/weixin1.png"><p>扫描二维码下载APP</p></div>
        <!------------------------>
        <p class="beian">Copyright © 2016 洋店网.版权所有.备案号：京ICP证35124521号.技术支持：西部网络</p>
    </div>
</div>
</body>
</html>
