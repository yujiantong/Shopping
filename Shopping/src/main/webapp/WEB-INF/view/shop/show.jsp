<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <!-- 右侧返回顶部 -->
    <link rel="stylesheet" type="text/css" href="css/right_top.css">
    <!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	<link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <!-- 先加载jquery.js 在加载框架js -->
	<!-- <script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script>  -->
	<script type="text/javascript" src="js/auto/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
     <script src="js/pic_tab.js"></script>
     <script src="assets/layer/layer.js" type="text/javascript" ></script>
    
    <style type="text/css">
.ban{ width:px; height:462px; position:relative; overflow:hidden;margin:0px auto 0 auto;}
.ban2{ width:340px; height:370px; position:relative; overflow:hidden;}
.ban2 ul{ position:absolute; left:0; top:0;}
.ban2 ul li{ width:350px; height:400px;}
.prev{ float:left; cursor:pointer;}
.num{ height:82px;overflow:hidden; width:310px; position:relative;float:left; margin-top:25px;margin-left:5px;}
.min_pic{ width:400px;}
.num ul{ position:absolute; left:0; top:0;}
.num ul li{ width:66px; height:60px; margin-right:10px; padding:1px;}
.num ul li.on{ border:1px solid red; padding:0;}
.prev_btn1{ width:10px; text-align:center; height:10px; margin-top:45px; cursor:pointer; float:left;}
.next_btn1{  width:10px; text-align:center; height:10px; margin-top:45px;cursor:pointer;float:left;}
.prev1{ position:absolute; top:175px; left:20px; width:28px; height:51px;z-index:9;cursor:pointer;}
.next1{ position:absolute; top:175px; right:20px; width:28px; height:51px;z-index:9;cursor:pointer;}
.mhc{ background:#000; width:100%;opacity:0.5;-moz-opacity:0.5;filter:alpha(Opacity=50); position:absolute; left:0; top:0; display:none;}
.pop_up{ width:500px; height:500px; padding:10px; background:#fff; position:fixed; -position:absolute; left:50%; top:50%; margin-left:-255px; 

margin-top:-255px; display:none; z-index:99;}
.pop_up_xx{ width:40px; height:40px; position:absolute; top:-40px; right:0; cursor:pointer;}
.pop_up2{ width:500px; height:500px; position:relative; overflow:hidden; float:left;}
.pop_up2 ul{ position:absolute; left:0; top:0;}
.pop_up2 ul li{ width:500px; height:500px; float:left;}
</style>
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
                <li><span class="shop" id="cartGoodsNum">购物车<a href="${pageContext.request.contextPath}/cart/showCart">
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
    <a class="my_shop fr" href="${pageContext.request.contextPath}/cart/showCart">我的购物车<span id="cartGoodsNum1">
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
        当前位置：<span class="check">${requestScope.goodsDetail.goodsName}</span>
    </div>
    <!-------------商品详细----------------->
    <div class="property">
        <div class="left">
            
  <div class="ban" id="demo1">
	<div class="ban2" id="ban_pic1">
		<div class="prev1" id="prev1"><img src="image/index_tab_l.png" width="28" height="51"  alt=""></div>
		<div class="next1" id="next1"><img src="image/index_tab_r.png" width="28" height="51"  alt=""></div>
		<ul>
		<li><img src="upImgs/${requestScope.goodsDetail.goodsImg}" width="340" height="370" class="jqzoom" ></li>
		<c:forEach items="${requestScope.goodsDetail.imgsList}" var="img">
              <li><a href="javascript:void(0);"><img src="upImgs/${img.imgPath}" width="340" height="370" alt=""></a></li>
         </c:forEach> 
			
			
		</ul>
	</div>
	<div class="min_pic">
	<div class="prev_btn1" id="prev_btn1"><img src="image/feel3.png" width="9" height="18"  alt=""></div>
		<div class="num clearfix" id="ban_num1">
			<ul>
			    <li><img src="upImgs/${requestScope.goodsDetail.goodsImg}" width="66" height="60" class="jqzoom" ></li>
				<c:forEach items="${requestScope.goodsDetail.imgsList}" var="img">
                    <li><a href="javascript:void(0);"><img src="upImgs/${img.imgPath}" width="66" height="60" alt=""></a></li>
                </c:forEach>
			</ul>
		</div>
		<div class="next_btn1" id="next_btn1"><img src="image/feel4.png" width="9" height="18"  alt=""></div>
		
	</div>
</div>

<div class="mhc"></div>

<div class="pop_up" id="demo2">
	<div class="pop_up_xx"><img src="image/chacha3.png" width="40" height="40"  alt=""></div>
	<div class="pop_up2" id="ban_pic2">
		<div class="prev1" id="prev2"><img src="image/index_tab_l.png" width="28" height="51"  alt=""></div>
		<div class="next1" id="next2"><img src="image/index_tab_r.png" width="28" height="51"  alt=""></div>
		<ul>
		<li><img src="upImgs/${requestScope.goodsDetail.goodsImg}" width="500" height="500" class="jqzoom" ></li>
          <c:forEach items="${requestScope.goodsDetail.imgsList}" var="img">
            <li><a href="javascript:void(0);"><img src="upImgs/${img.imgPath}" width="500" height="500" alt=""></a></li>
          </c:forEach>
			
		</ul>
	</div>
            </div>
        </div>
<script type="text/javascript">
				jq('#demo1').banqh({
					box:"#demo1",//总框架
					pic:"#ban_pic1",//大图框架
					pnum:"#ban_num1",//小图框架
					prev_btn:"#prev_btn1",//小图左箭头
					next_btn:"#next_btn1",//小图右箭头
					pop_prev:"#prev2",//弹出框左箭头
					pop_next:"#next2",//弹出框右箭头
					prev:"#prev1",//大图左箭头
					next:"#next1",//大图右箭头
					pop_div:"#demo2",//弹出框框架
					pop_pic:"#ban_pic2",//弹出框图片框架
					pop_xx:".pop_up_xx",//关闭弹出框按钮
					mhc:".mhc",//朦灰层
					autoplay:true,//是否自动播放
					interTime:2000,//图片自动切换间隔
					delayTime:400,//切换一张图片时间
					pop_delayTime:400,//弹出框切换一张图片时间
					order:0,//当前显示的图片（从0开始）
					picdire:true,//大图滚动方向（true为水平方向滚动）
					mindire:true,//小图滚动方向（true为水平方向滚动）
					min_picnum:4,//小图显示数量
					pop_up:true//大图是否有弹出框
				})
        
        
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
            <a href="javascript:void(0)" class="title">${fn:substring(requestScope.goodsDetail.goodsName, 0, 40)}</a>
            <div class="aa">
                <span class="a">促销价</span>
                <span class="b">¥${requestScope.goodsDetail.goodsPrice}</span>
                <!-- <span class="c">6.5折</span> -->
                <span class="c">包邮</span>
                <span class="d">国内参考价 ${requestScope.goodsDetail.goodsPrice*2}</span>
            </div>
            <table>
                <tr>
                    <td class="one">运费</td>
                    <td>免运费</td>
                </tr>
                <tr>
                    <td class="one">关税</td>
                    <td>本商品实用税率为10%，若订单关税50元则免征</td>
                </tr>
                <tr>
                    <td class="one">数量</td>
                    <td>
                        <div class="change">
                            <span class="zuo" onclick="jian()">-</span>
                            <input name="" type="text" value="1" id="myNum">
                            <span class="you" onclick="jia()">+</span>
                        </div>
                        <span class="tishi">库存充足</span>
                    </td>
                </tr>
            </table>
            <!-----------------购买按钮--------------->
            <div class="shopping">
                <a href="javascript:void(0)" class="buy" onclick="payNow(${requestScope.goodsDetail.goodsId})">立即购买</a>
                <a href="javascript:void(0)" class="shop_car" onclick="addToCart(${requestScope.goodsDetail.goodsId})">加入购物车</a>
                <div class="clear"></div>
            </div>
            <script type="text/javascript">
                function jia(){
                	//alert("+++++++++");
                	
                	
                	var num=$("#myNum").prop("value");
                	$("#myNum").prop("value",parseInt(num)+parseInt(1));
                }
                function jian(){
                	//alert("----------");
                	var num=$("#myNum").prop("value");
                	if(parseInt(num)==1){
                		 layer.msg('数量已为1，不可再减!!!',{time:1000});
                	}else{
                	     $("#myNum").prop("value",parseInt(num)-parseInt(1));
                	}
                	
                }
                function payNow(goodsId){
                	var num=$("#myNum").prop("value");
                	location.href="${pageContext.request.contextPath}/ordersFont/payNow?goodsId="+goodsId+"&goodsNum="+num;
                }
            	function addToCart(goodsId){
            		//alert(goodsId);
            		var num=$("#myNum").prop("value");
					$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/addGoodsToCart?goodsId="+goodsId+"&goodsNum="+num,
						   success: function(msg){
						     layer.msg('加入成功!!!',{icon:1,time:2000});
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
        <div class="details_left" >
            <div class="d_l_t">
                <div class="d_l_t_t">
                    <a href="javascript:void(0)" id="css1" onclick="checkCss()" class="current">商品详情</a>
                    <a href="javascript:void(0)" id="css2" onclick="checkCss2()" class="">买家口碑（${requestScope.discussList.size()}）</a>
                </div>
                <!-----------详细内容---------->
                <div class="d_l_t_d" style="display: block;">
                    <img src="image/${requestScope.goodsDetail.goodsDetail}">
                </div>
                <!----------评价---------->
            </div>
            <!-- 评价js -->
            <script type="text/javascript">
            	function checkCss() {
            		$(".d_l_t_t a").prop("class", "");
            		$("#css1").prop("class", "current");
            		$(".pingjia").css("display", "none");
            		$(".d_l_t_d").css("display", "block");
            	}
            	
            	function checkCss2() {
            		$(".d_l_t_t a").prop("class", "");
            		$("#css2").prop("class", "current");
            		$(".d_l_t_d").css("display", "none");
            		$(".pingjia").css("display", "block");
            	}
            	
            	function myDiscuss(goodsId, styleId) {
            		$.ajax({
            			type:"post",
            			url:"${pageContext.request.contextPath}/DiscussController/discuss.html?goodsId="+goodsId+"&styleId="+styleId,
            			success:function(msg) {
            				$("#myUl").html(msg);
            			}
            		}); 
            		$(".pingjia_d_t span").prop("class","");
            		$(".pingjia_d_t span img").prop("src","image/d2.png");
            		$("#span"+styleId).prop("class","current");
            		$("#span"+styleId+" img").prop("src","image/d1.png");        		
            	}
            	
            	function myDiscussT(goodsId) {
            		$.ajax({
            			type:"post",
            			url:"${pageContext.request.contextPath}/DiscussController/discussT.html?goodsId="+goodsId,
            			success:function(msg) {
            				$("#myUl").html(msg);
            			}
            		});
            		$(".pingjia_d_t span").prop("class","");
            		$(".pingjia_d_t span img").prop("src","image/d2.png");
            		$("#span0").prop("class","current");
            		$("#span0 img").prop("src","image/d1.png");
            	}
            </script>
            <div class="pingjia" style="display: none;">
                <div class="pingjia_t">
                    <span>买家口碑</span>本商品由Aptamil/爱他美发货并提供售后服务
                </div>
                <!----------评价----------->
                <div class="pingjia_d">
                    <div class="pingjia_d_t">
                    	<!-- 评价类型及各个类型的数量统计 -->
                    	<span id="span0" class="current" onclick="myDiscussT(${requestScope.goodsDetail.goodsId})"><img src="image/d1.png">全部评价（${requestScope.discussList.size()}）</span>
                    	<c:forEach items="${requestScope.discussStyleList }" var="disStyleMap">
                    		<span id="span${disStyleMap.id }" onclick="myDiscuss(${requestScope.goodsDetail.goodsId},${disStyleMap.id })"><img src="image/d2.png">${disStyleMap.name}（${disStyleMap.num}）</span>
                    	</c:forEach>
                    	
                        <!-- <span class="current"><img src="image/d1.png">全部评价（5884）</span>
                        <span><img src="image/d2.png">好评（5750）</span>
                        <span><img src="image/d2.png">中评（48）</span>
                        <span><img src="image/d2.png">差评（86）</span> -->
                        <!-- <span><img src="image/d2.png">晒单（227）</span> -->
                    </div>
                    <!----------留言----------->
                    <div class="pingjia_d_l">
                        <ul id="myUl">
                        	<!-- 留言信息展示 -->
                        	<c:forEach items="${requestScope.discussList}" var="discuss">
                        		<li>
	                                <p class="title"><span>${discuss.discussUser.userName }</span>
	                                （<fmt:formatDate value="${discuss.discussDate }" pattern="yyyy-MM-dd"/>）</p>
	                                <p class="pic"><img width="72px" height="72px" src="upfile/${discuss.discussImg }"></p>
	                                <p class="mess">${discuss.discussComment }</p>
	                                <p class="admin">管理员：亲爱的用户，感谢你对德贝的支持，我们会继续坚持给您带来最极致的服务。</p>
	                            </li>
                        	</c:forEach>
                            <!-- <li>
                                <p class="title"><span>月夜花香</span>（2015-10-03 21:47:13）</p>
                                <p class="pic"><img src="image/p10.jpeg"></p>
                                <p class="mess">已经开始喝第二阶段的奶粉了，会继续支持德贝。</p>
                                <p class="admin">管理员：亲爱的用户，已返现到您的会员账户，感谢你对德贝的支持，我们会继续坚持给您带来最极致的服务。</p>
                            </li> -->
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
            <div class="d_r_t">推荐购买</div>
            <div class="d_r_d">
                <ul>
                
                  <c:forEach items="${requestScope.cart_ReList}" var="re"> 
                    <li>
                        <a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${re.footmarkGood.goodsId}" title="${re.footmarkGood.goodsName}">
                        <img src="upImgs/${re.footmarkGood.goodsImg}"></a>
                        <p><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${re.footmarkGood.goodsId}" title="${re.footmarkGood.goodsName}">
                        ${fn:substring(re.footmarkGood.goodsName, 0, 10)}...
                       </a></p>
                        <p><span>￥<font>${re.footmarkGood.goodsPrice}</font></span></p>
                    </li>
                  </c:forEach>
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
	