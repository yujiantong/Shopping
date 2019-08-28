<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/shoucang.css" type="text/css" rel="stylesheet"/>
    <!-- 右侧返回顶部 -->
    <link rel="stylesheet" type="text/css" href="css/right_top.css">
    <!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	<link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <!-- 先加载jquery.js 在加载框架js -->
	<script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script> 
	<script type="text/javascript" src="js/auto/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
</head>
<script>
    $(function(){
        $('.nav ul li').hover(function(){
            $(this).children(".details").show();
        },function(){
            $(this).children(".details").hide();
        });
        $('#my').hover(function(){
            $(this).find("div").show();
        },function(){
            $(this).find("div").hide();
        });
    });
</script>
<body>
<!------------顶部---------------->
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
<script type="text/javascript"> 
		$(function() {
			// autocomplete可以接受数组和JSON两种格式
			//var data ="JAVA JSP J2EE J2SE NET C C++".split(" ");
			// 把文本框转化为jquer对象,调用框架已经定义autocomplete方法
			//$("#keyword").autocomplete(data);
			$('#keyword').autocomplete("${pageContext.request.contextPath}/LuceneController/searchKeyWord.action",{
				delay:500,
			    multiple: true,    
			    max:5,
			    height:30,
			    width:297,    
			   	multipleSeparator: ' ',   
			    dataType: 'json',
				parse: function(data) {  
				     var rows = [];  
				     for(var i=0; i< data.length; i++){  
				      rows[rows.length] = {   
				        data:data[i].word,   
				        value:data[i].num,   
				        result:data[i].word   
				        };   
				      }  
				   return rows;  
				 },  
				 formatItem: function(row) {  
				      return row;        
				  }
			}).result(function(event,row){
				location.href="${pageContext.request.contextPath }/LuceneController/searchGoods.html?sname="+row;
			}); 
		});
	</script>
<!--------------logo搜索------------->

<div class="wt1080 header">
    <div class="logo fl">
	    <a href="${pageContext.request.contextPath }/goodstype/findAll">
	    	<img src="image/logo.png">
	    </a>
    </div>
    <div class="search fl">
        <div>
        	<form action="${pageContext.request.contextPath }/LuceneController/searchGoods.html" method="post" autocomplete="off">
	            <input id="keyword" name="sname" type="text" class="a_search fl" placeholder="请输入关键字">
	            <button type="submit" style="border: none;cursor:pointer;">
	            <span class="b_search fl"></span></button>
	        </form>
	        <div class="clear"></div>
        </div>
        <p>
            <!-- <a href="#" class="current">可莱丝</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#">森田药妆</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#">Montagne jeunesse</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#">丽得姿</a> -->
        </p>
    </div>
    <a class="my_shop fr" href="${pageContext.request.contextPath}/cart/showCart">我的购物车<span>
		<c:choose>
                	<c:when test="${not empty sessionScope.cartNum }">
                		${sessionScope.cartNum }
                	</c:when>
                	<c:otherwise>
                		0
                	</c:otherwise>
                </c:choose>
	</span></a>
    <div class="clear"></div>
</div>
<!--------------导航------------------>
<div class="nav">
    <div class="wt1080">
        <ul>
            <li><a href="${pageContext.request.contextPath }/goodstype/findAll" class="current"><span>首页</span></a></li>
           
           <c:forEach items="${requestScope.typeList }" var="list" varStatus="statu">
           		 <li>
           		 <c:if test="${statu.count eq 1 }">
           		 	<a href="javascript:void(0)"><span>母婴专区</span></a>
           		 </c:if>
           		 <c:if test="${statu.count eq 2 }">
           		 	<a href="javascript:void(0)"><span>美妆护肤</span></a>
           		 </c:if>
           		 <c:if test="${statu.count eq 3 }">
           		 	<a href="javascript:void(0)"><span>家具生活</span></a>
           		 </c:if>
           		 <c:if test="${statu.count eq 4 }">
           		 	<a href="javascript:void(0)"><span>食品营养</span></a>
           		 </c:if>
                    <div class="details">
                                  <div class="item">
                                      <p class="title">
                                      <c:if test="${statu.count eq 1 }">
					           		 	<a href="javascript:void(0)">母婴专区</a>
					           		 </c:if>
					           		 <c:if test="${statu.count eq 2 }">
					           		 	<a href="javascript:void(0)">美妆护肤</a>
					           		 </c:if>
					           		 <c:if test="${statu.count eq 3 }">
					           		 	<a href="javascript:void(0)">家具生活</a>
					           		 </c:if>
					           		 <c:if test="${statu.count eq 4 }">
					           		 	<a href="javascript:void(0)">食品营养</a>
					           		 </c:if>
                                      </p>
                                       <div class="ctgnamebox">
                                        <c:forEach items="${list}" var="type">
                                            <a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a>
                                        </c:forEach>
                                        </div>
                                    </div>
                    </div>
                    </li>
           </c:forEach>
           
            
            <li><a href="javascript:void(0)"><span>全球直邮</span></a></li>
            <li><a href="javascript:void(0)"><span>合作申请</span></a></li>
        </ul>
        <div style="clear:both"></div>
    </div>
</div>

<!---------------------导航完--------------------->

<!-----------------内容------------------>
<div class="wt1080 middle">
    <div class="fl">
        <div style="padding: 0 24px;"><h1>用户名称</h1></div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/ordersFont/jumpToMyOrder">我的订单</a></li>
            <li><a href="${pageContext.request.contextPath }/CouponController/findUseConpon">我的优惠卷</a></li>
            <li><a href="${pageContext.request.contextPath}/IntegralexchangeController/findAllExchange">我的积分</a></li>
            <li><a href="${pageContext.request.contextPath}/path/shop/anquan">账户安全</a></li>
            <li class="current"><a href="${pageContext.request.contextPath}/path/shop/shoucang">我收藏的商品</a></li>
            <li><a href="${pageContext.request.contextPath}/path/shop/address">管理收货地址</a></li>
        </ul>
    </div>
    <div class="fr">
        <ul>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/product3.png"></a></div>
                <p style="margin-bottom: 10px;"><a href="javascript:void(0)">原装【贝贝自营】惠氏S-26金装爱儿乐婴儿配方奶粉 1段 900克*2</a></p>
                <p><span class="one">￥<span style="font-size: 22px;">336.00</span></span><span class="two">￥336.00</span></p>
                <div class="qianggou"><a href="javascript:void(0)">立即抢购</a></div>
            </li>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/product6.png"></a></div>
                <p style="margin-bottom: 10px;"><a href="javascript:void(0)">原装【贝贝自营】惠氏S-26金装爱儿乐婴儿配方奶粉 1段 900克*2</a></p>
                <p><span class="one">￥<span style="font-size: 22px;">336.00</span></span><span class="two">￥336.00</span></p>
                <div class="qianggou"><a href="javascript:void(0)">立即抢购</a></div>
            </li>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/product6.png"></a></div>
                <p style="margin-bottom: 10px;"><a href="javascript:void(0)">原装【贝贝自营】惠氏S-26金装爱儿乐婴儿配方奶粉 1段 900克*2</a></p>
                <p><span class="one">￥<span style="font-size: 22px;">336.00</span></span><span class="two">￥336.00</span></p>
                <div class="qianggou"><a href="javascript:void(0)">立即抢购</a></div>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
</div>

<!---------------------热销------------------>
<div class="hot wt1080">
    <div class="title">热销推荐</div>
    <div class="content">
        <ul>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/p11.png"></a></div>
                <p class="c_t"><a href="javascript:void(0)">Regen/丽珍 纯棉超细纤维美白皮肤面膜贴 10片</a></p>
                <p class="price">￥89.00</p>
                <a href="javascript:void(0)" class="goumai">立即购买</a>
            </li>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/p11.png"></a></div>
                <p class="c_t"><a href="javascript:void(0)">Regen/丽珍 纯棉超细纤维美白皮肤面膜贴 10片</a></p>
                <p class="price">￥89.00</p>
                <a href="javascript:void(0)" class="goumai">立即购买</a>
            </li>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/p11.png"></a></div>
                <p class="c_t"><a href="javascript:void(0)">Regen/丽珍 纯棉超细纤维美白皮肤面膜贴 10片</a></p>
                <p class="price">￥89.00</p>
                <a href="javascript:void(0)" class="goumai">立即购买</a>
            </li>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/p11.png"></a></div>
                <p class="c_t"><a href="javascript:void(0)">Regen/丽珍 纯棉超细纤维美白皮肤面膜贴 10片</a></p>
                <p class="price">￥89.00</p>
                <a href="javascript:void(0)" class="goumai">立即购买</a>
            </li>
            <li>
                <div class="pic"><a href="javascript:void(0)"><img src="image/p11.png"></a></div>
                <p class="c_t"><a href="javascript:void(0)">Regen/丽珍 纯棉超细纤维美白皮肤面膜贴 10片</a></p>
                <p class="price">￥89.00</p>
                <a href="javascript:void(0)" class="goumai">立即购买</a>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
</div>

<!---------------------保障------------------->
<div class="baozhang">
    <div class="wt1080">
        <ul>
            <li>
                <img src="image/c1.png">
                <p>全球正品货源</p>
            </li>
            <li>
                <img src="image/c2.png">
                <p>一件代发</p>
            </li>
            <li>
                <img src="image/c3.png">
                <p>全球直邮</p>
            </li>
            <li>
                <img src="image/c5.png">
                <p>售后无忧</p>
            </li>
        </ul>
        <div class="clear"></div>
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
                            <dd><a href="javascript:void(0)">通关关税</a></dd>
                            <dd><a href="javascript:void(0)">常见问题</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">新手指南</a></dt>
                            <dd><a href="javascript:void(0)">购物流程</a></dd>
                            <dd><a href="javascript:void(0)">支付方式</a></dd>
                            <dd><a href="javascript:void(0)">通关关税</a></dd>
                            <dd><a href="javascript:void(0)">常见问题</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">新手指南</a></dt>
                            <dd><a href="javascript:void(0)">购物流程</a></dd>
                            <dd><a href="javascript:void(0)">支付方式</a></dd>
                            <dd><a href="javascript:void(0)">通关关税</a></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt><a href="javascript:void(0)">新手指南</a></dt>
                            <dd><a href="javascript:void(0)">购物流程</a></dd>
                            <dd><a href="javascript:void(0)">支付方式</a></dd>
                            <dd><a href="javascript:void(0)">通关关税</a></dd>
                            <dd><a href="javascript:void(0)">常见问题</a></dd>
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
<!-----------------返回顶部--------------------------- -->
<div class="toolbar">
   <a href="javascript:void(0)" class="toolbar-item toolbar-item-weixin">
   <span class="toolbar-layer"></span>
   </a>
   <a class="toolbar-item toolbar-item-feedback" onclick="chat()"></a>
   <script type="text/javascript">
   					function chat(){
   					layer.open({
						type : 2 //Page层类型
						,
						area : [ '500px','620px' ],
						title : '与客服聊天中',
						offset : '50',
						shade : 0.6 //遮罩透明度
						,
						maxmin : true //允许全屏最小化
						,
						anim : 4 //0-6的动画形式，-1不开启
						,
						content : '${pageContext.request.contextPath}/path/shop/chatuser'
						});
   					};
   </script>
   <a href="javascript:void(0)" class="toolbar-item toolbar-item-app">
    <span class="toolbar-layer"></span>
   </a>
   <a href="javascript:scroll(0,0)" id="top" class="toolbar-item toolbar-item-top"></a>
</div>
</body>
</html>
	