<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>展示商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/show.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
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
<script type="text/javascript">
	
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

<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<div class="wt1080">
    <!----------------位置--------------------->
    <div class="place">
        当前位置：<span class="check">Aptamil 德国爱他美 婴儿奶粉 2段 800克/罐 3罐装 6-10个月</span>
    </div>
    <!-------------商品详细----------------->
    <div class="property">
        <div class="left">
            <div class="left_top">
                <img src="image/p7.png" class="jqzoom" >
                <a href="javascript:void(0)" class="search"></a>
            </div>
            <div class="pics">
                <div id="scroll" class="owl-carousel">
                    <a href="javascript:void(0)" class="item current"><img src="image/p8.png"></a>
                    <a href="javascript:void(0)" class="item"><img src="image/p8.png"></a>
                    <a href="javascript:void(0)" class="item"><img src="image/p8.png"></a>
                    <a href="javascript:void(0)" class="item"><img src="image/p8.png"></a>
                    <a href="javascript:void(0)" class="item"><img src="image/p8.png"></a>
                    <a href="javascript:void(0)" class="item"><img src="image/p8.png"></a>

                </div>
            </div>
        </div>
        <script>
            $(function() {
                $(".jqzoom").imagezoom();

                $('#scroll').owlCarousel({
                    items: 4,
                    autoPlay: false,
                    navigation: true,
                    navigationText: ["",""],
                    scrollPerPage: true
                });
            });
        </script>
        <div class="right">
            <a href="javascript:void(0)" class="title">Aptamil 德国爱他美 婴儿奶粉 2段 800克/罐 3罐装 6-10个月</a>
            <div class="aa">
                <span class="a">促销价</span>
                <span class="b">￥445.00</span>
                <span class="c">6.5折</span>
                <span class="c">包邮</span>
                <span class="d">国内参考价 ￥988.00</span>
            </div>
            <table>
                <tr>
                    <td class="one">运费</td>
                    <td>免运费</td>
                </tr>
                <tr>
                    <td class="one">关税</td>
                    <td>本商品实用税率为10%，若订单关税<50元则免征</td>
                </tr>
                <tr>
                    <td class="one">数量</td>
                    <td>
                        <div class="change">
                            <span class="zuo">-</span>
                            <input name="" type="text" value="1">
                            <span class="you">+</span>
                        </div>
                        <span class="tishi">库存充足</span>
                    </td>
                </tr>
            </table>
            <!-----------------购买按钮--------------->
            <div class="shopping">
                <a href="order.jsp" class="buy">立即购买</a>
                <a  class="shop_car" onclick="addToCart(3)">加入购物车</a>
                <a  class="shop_car" onclick="addToCart(4)">加入购物车</a>
                <a  class="shop_car" onclick="addToCart(5)">加入购物车</a>
                <div class="clear"></div>
            </div>
            <script type="text/javascript">
            	function addToCart(goodsId){
            		//alert(goodsId);
					$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/addGoodsToCart?goodsId="+goodsId,
						   success: function(msg){
						     alert("加入成功！！！");
						     $("#cartGoodsNum").html(msg);
						     $("#cartGoodsNum1").html(msg);
						   }
						});
            	}
            </script>
            <!-----------保障---------------->
            <div class="b_baozhang">
                <ul>
                    <li>
                        <img src="image/u1.png">
                        <p>全球正品货源</p>
                    </li>
                    <li>
                        <img src="image/u2.png">
                        <p>一件代发</p>
                    </li>
                    <li>
                        <img src="image/u3.png">
                        <p>全球直邮</p>
                    </li>
                    <li>
                        <img src="image/u4.png">
                        <p>售后无忧</p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <!-----------------下半部分------------------->
    <div class="details">
        <div class="details_left">
            <div class="d_l_t">
                <div class="d_l_t_t">
                    <a href="" class="current">商品详情</a>
                    <a href="">买家口碑(1600)</a>
                </div>
                <!-----------详细内容---------->
                <div class="d_l_t_d">
                    <img src="image/xiangxi.png">
                </div>
                <!----------评价---------->
            </div>
            <div class="pingjia">
                <div class="pingjia_t">
                    <span>买家口碑</span>本商品由Aptamil/爱他美发货并提供售后服务
                </div>
                <!----------评价----------->
                <div class="pingjia_d">
                    <div class="pingjia_d_t">
                        <span class="current"><img src="image/d1.png">全部评价（5884）</span>
                        <span><img src="image/d2.png">好评（5750）</span>
                        <span><img src="image/d2.png">好评（48）</span>
                        <span><img src="image/d2.png">差评（86）</span>
                        <span><img src="image/d2.png">晒单（227）</span>
                    </div>
                    <!----------留言----------->
                    <div class="pingjia_d_l">
                        <ul>
                            <li>
                                <p class="title"><span>月夜花香</span>（2015-10-03 21:47:13）</p>
                                <p class="pic"><img src="image/p10.jpeg"></p>
                                <p class="mess">已经开始喝第二阶段的奶粉了，会继续支持德贝。</p>
                                <p class="admin">管理员：亲爱的用户，已返现到您的会员账户，感谢你对德贝的支持，我们会继续坚持给您带来最极致的服务。</p>
                            </li>

                            <li>
                                <p class="title"><span>月夜花香</span>（2015-10-03 21:47:13）</p>
                                <p class="pic"><img src="image/p10.jpeg"></p>
                                <p class="mess">已经开始喝第二阶段的奶粉了，会继续支持德贝。</p>
                                <p class="admin">管理员：亲爱的用户，已返现到您的会员账户，感谢你对德贝的支持，我们会继续坚持给您带来最极致的服务。</p>
                            </li>

                            <li>
                                <p class="title"><span>月夜花香</span>（2015-10-03 21:47:13）</p>
                                <p class="pic"><img src="image/p10.jpeg"></p>
                                <p class="mess">已经开始喝第二阶段的奶粉了，会继续支持德贝。</p>
                                <p class="admin">管理员：亲爱的用户，已返现到您的会员账户，感谢你对德贝的支持，我们会继续坚持给您带来最极致的服务。</p>
                            </li>
                        </ul>
                    </div>
                    <!---------------分页--------------->
                    <div class="page"><a href="javascript:void(0)">上一页</a><a href="javascript:void(0)">1</a><a href="javascript:void(0)">2</a><a href="javascript:void(0)">下一页</a></div>
                </div>
            </div>
            <!---------------------常见问题------------------->
            <div class="problem">
                <h1>常见问题</h1>
                <div class="problem_c">
                    <div class="problem_c_t">
                        <div class="title">
                            <span>Q</span>
                            <font>商品来自哪里？</font>
                            <div class="clear"></div>
                        </div>
                        <div class="answer">
                            <span>A</span>
                            <font>我们的专业招商团队，确保所有的品牌均为海外优质品牌，主要是由海外品牌入住商或品牌代理经销商等品牌入驻商提供，让你轻松享受到国外优质原装进口商品。</font>
                            <div class="clear"></div>
                        </div>

                        <div class="title">
                            <span>Q</span>
                            <font>我还要额外缴纳关税么？</font>
                            <div class="clear"></div>
                        </div>
                        <div class="answer">
                            <span>A</span>
                            <font>依据《中华人民共和国进境物品归类表》，以商品实际销售价格作为完税价格（征税基数），参照行邮税税率征收进境物品进口税，应征税在50元以下（含50元），海关予以免征。</font>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!------------------->
                    <p>联系在线客服，或拨打客户电话：028-6133 8882。<p>
                    <p>客户工作时间：周一到周日9：00-22：00，法定假日除外。<p>
                </div>
            </div>
        </div>



        <div class="details_right">
            <div class="d_r_t">相似推荐</div>
            <div class="d_r_d">
                <ul>
                    <li>
                        <a href="javascript:void(0)"><img src="image/p9.png"></a>
                        <p><a href="javascript:void(0)">德国爱他美Aptamil奶粉...</a></p>
                        <p><span>￥<font>359.00</font></span> 5.2折包邮</p>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><img src="image/p9.png"></a>
                        <p><a href="javascript:void(0)">德国爱他美Aptamil奶粉...</a></p>
                        <p><span>￥<font>359.00</font></span> 5.2折包邮</p>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><img src="image/p9.png"></a>
                        <p><a href="javascript:void(0)">德国爱他美Aptamil奶粉...</a></p>
                        <p><span>￥<font>359.00</font></span> 5.2折包邮</p>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><img src="image/p9.png"></a>
                        <p><a href="javascript:void(0)">德国爱他美Aptamil奶粉...</a></p>
                        <p><span>￥<font>359.00</font></span> 5.2折包邮</p>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><img src="image/p9.png"></a>
                        <p><a href="javascript:void(0)">德国爱他美Aptamil奶粉...</a></p>
                        <p><span>￥<font>359.00</font></span> 5.2折包邮</p>
                    </li>
                </ul>
            </div>
        </div>
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
	