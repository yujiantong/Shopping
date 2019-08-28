<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/index.css" type="text/css" rel="stylesheet"/>
<!--     <link rel="stylesheet" type="text/css" href="css/chatstyle.css" /> -->
    <!-- 右侧返回顶部 -->
    <link rel="stylesheet" type="text/css" href="css/right_top.css">
    
    <!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	<link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
    
    <!-- 先加载jquery.js 在加载框架js -->
	<script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script> 
	<script type="text/javascript" src="js/auto/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
   
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/my.js" ></script>
	 <script src="assets/layer/layer.js" type="text/javascript"></script>
    
    
<style>
/* 资讯滚动样式 */
		*{margin:0;padding:0;list-style-type:none;}
		a,img{border:0;}
		body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
		a{color:#333;text-decoration:none;}
		a:hover{color:#ef9b11;text-decoration:underline;}
		/* scrolltext */
		.scrolltext{padding:0px 5px 0 0px;}
		.scrolltext ol li{padding-left:7px;width:182px;height:25px;font-size:13px;line-height:25px;border-bottom:2px solid #fff;}
		.scrolltext ol li a{color:#6f746e;display:block;width:172px;white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden;}
		.scrolltext ol li a:hover{color:#ef9b11;text-decoration:none;}
		.scrolltext .part{width:100%;padding-top:10px;}
		.scrolltext .part span{margin-left:26px;cursor:pointer;}
		#breakNews{padding:0 0 0px 2px;}
		#breakNews .list6{height:253px;overflow:hidden;width:100%;}
</style>

</head>
<body>
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
				     for(var i=0; i<data.length; i++){  
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
	            <input id="keyword" name="sname" type="text" class="a_search fl"  placeholder="请输入关键字">
	            <button type="submit" style="border: none;cursor:pointer;">
	            <span class="b_search fl"></span></button>
	        </form>
	        <div class="clear"></div>
        </div>
        <p>
            <!-- <a href="javascript:void(0)" class="current">可莱丝</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:void(0)">森田药妆</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:void(0)">Montagne jeunesse</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:void(0)">丽得姿</a> -->
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
<script type="text/javascript">
$(function(){
	$('.myscroll').myScroll({
		speed: 40, //数值越大，速度越慢
		rowHeight: 26 //li的高度
	});
});

(function($){
	$.fn.myScroll = function(options){
	//默认配置
	var defaults = {
		speed:40,  //滚动速度,值越大速度越慢
		rowHeight:24 //每行的高度
	};
	
	var opts = $.extend({}, defaults, options),intId = [];
	
	function marquee(obj, step){
	
		obj.find("ul").animate({
			marginTop: '-=1'
		},0,function(){
				var s = Math.abs(parseInt($(this).css("margin-top")));
				if(s >= step){
					$(this).find("li").slice(0, 1).appendTo($(this));
					$(this).css("margin-top", 0);
				}
			});
		}
		
		this.each(function(i){
			var sh = opts["rowHeight"],speed = opts["speed"],_this = $(this);
			intId[i] = setInterval(function(){
				if(_this.find("ul").height()<=_this.height()){
					clearInterval(intId[i]);
				}else{
					marquee(_this, sh);
				}
			}, speed);

			_this.hover(function(){
				clearInterval(intId[i]);
			},function(){
				intId[i] = setInterval(function(){
					if(_this.find("ul").height()<=_this.height()){
						clearInterval(intId[i]);
					}else{
						marquee(_this, sh);
					}
				}, speed);
			});
		
		});

	}

})(jQuery);
</script>
<!--------------导航------------------>
<div class="nav">
    <div class="wt1080">
        <ul>
            <li><a href="${pageContext.request.contextPath }/goodstype/findAll" class="current"><span>首页</span></a></li>
            <li><a href="javascript:void(0)"><span>母婴专区</span></a>
                    <div class="details">
                                  <div class="item">
                                      <p class="title">
                                        <a href="javascript:void(0)">母婴专区</a>
                                      </p>
                                        
                                        <div class="ctgnamebox">
                                        <c:forEach items="${requestScope.typeListMuying}" var="type">
                                            <a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a>
                                        </c:forEach>
                                        </div>

                                    </div>
                    </div></li>
                    <li><a href="javascript:void(0)"><span>美妆护肤</span></a>
				<div class="details">

						<div class="item">
							<p class="title">
								<a href="javascript:void(0)">美妆护肤</a>
							</p>
							<div class="ctgnamebox">
							<c:forEach items="${requestScope.typeListMeizhuang}" var="type">
									<a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a>
							</c:forEach>
							</div>
						</div>
					</div>
				</li>
				<li><a href="javascript:void(0)"><span>家具生活</span></a>
				<div class="details">

						<div class="item">
							<p class="title">
								<a href="javascript:void(0)">家具生活</a>
							</p>
							<div class="ctgnamebox">
							<c:forEach items="${requestScope.typeListJiaju}" var="type">
									<a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a>
							</c:forEach>
							</div>
						</div>
					</div>
				</li>
				<li><a href="javascript:void(0)"><span>食品营养</span></a>
				<div class="details">

						<div class="item">
							<p class="title">
								<a href="javascript:void(0)">食品营养</a>
							</p>
							<div class="ctgnamebox">
							<c:forEach items="${requestScope.typeListYinyang}" var="type">
									<a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a>
							</c:forEach>
							</div>
						</div>
					</div>
				</li>
            <li><a href="javascript:void(0)"><span>全球直邮</span></a></li>
            <li><a href="javascript:void(0)"><span>合作申请</span></a></li>
        </ul>
        <div style="clear:both"></div>
    </div>
</div>

<!----------------轮播图-------------------->
<div class="index_banner minWidth" id="focus">
    <ul>
        <c:forEach items="${requestScope.adsList}" var="ads">
           <li style="background:url(./image/${ads.adsImg}) no-repeat center;height: 452px;">
	           <a href="${pageContext.request.contextPath}/${ads.adsPath}" title="${ads.adsDesc}">
	           </a>
           </li>
        </c:forEach>
    </ul>
</div>
<div class="clear"></div>
<!--------------中间部分------------->
<div class="wt1080 middle">
    <div class="fl">
        <ul>
            <li>
                <img src="image/bg3.png">
                <p>全球正品货源</p>
            </li>
            <li>
                <img src="image/bg4.png">
                <p>全球直邮</p>
            </li>
            <li>
                <img src="image/bg5.png">
                <p>一件代发</p>
            </li>
            <li>
                <img src="image/bg6.png">
                <p>售后无忧</p>
            </li>
        </ul>
    </div>
    <div class="fr">
        <p class="one">在线客服：
            <a href="javascript:void(0)"><img src="image/tubiao2.png"></a>&nbsp;&nbsp;
            <a href="javascript:void(0)"><img src="image/tubiao2.png"></a>&nbsp;&nbsp;
            <a href="javascript:void(0)"><img src="image/tubiao2.png"></a>&nbsp;&nbsp;
            <span>（时间：9：00-24：00）</span>
        </p>
        <p class="two">联系电话：<i>028-6133 8882</i></p>
    </div>
    <div class="clear"></div>
</div>

<!---------------商品介绍一大块----------------->
<div class="product">
    <div class="wt1080">
        <!------------上部分----------->
        <div class="up">
            <div class="crazy fl">商城推荐</div>
            <a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=2">
            <img src="image/guanggao.png" class="fr"></a>
            <div class="clear"></div>
        </div>
        <!------------下部分----------->
        <div class="down">
            <div class="fl">
                <ul>
                  <c:forEach items="${requestScope.findAllTuijian}" var="tuijian">
                    <li>
                        <div class="pic"><a  href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${tuijian.footmarkGood.goodsId}" title="${tuijian.footmarkGood.goodsName}">
                        <img src="upImgs/${tuijian.footmarkGood.goodsImg}"></a></div>
                        <p><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${tuijian.footmarkGood.goodsId}" title="${tuijian.footmarkGood.goodsName}">${tuijian.footmarkGood.goodsName}</a></p>
                        <div>
                            <span class="one">￥${tuijian.footmarkGood.goodsPrice}</span>
                            <span class="two">原价￥
                             <fmt:formatNumber type="number" value="${tuijian.footmarkGood.goodsPrice*1.2}"/>
                            </span>
                            <div class="clear"></div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="fr">
                <div class="f_one">
                    <span>最新资讯</span>
                    <a href="javascript:void(0)">更多&gt;&gt;</a>
                </div>
              <!--   资讯滚动 -->
              <script type="text/javascript" src="js/ScrollText.js" ></script>
                     <div class="scrolltext" >
						<div id="breakNews">
							<ol id="breakNewsList" class="list6">
							   <c:forEach items="${requestScope.announcementList}" var="ann">
							        <li>
							        <a href="${pageContext.request.contextPath}/${ann.announcementPath}">
							        <span style="color: #ff5e21">【${ann.announcementType}】</span>${ann.announcementName}</a>
							        </li>
							    </c:forEach>
					        </ol>
						</div>
					</div>
					<script type="text/javascript">
						var scroll2 = new ScrollText("breakNewsList","pre2","next2",true,50,true);
						scroll2.LineHeight = 63;
				    </script>
                   <!-- 结束   -->
                     
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <!------------------1楼-------------->
    <div class="floor wt1080" style="border-top:2px solid #1d84a7;">
        <div class="floor_one"></div>
        <!---------------左边---------------->
        <div class="left">
            <div class="start" style="background: #1d84a7;background-image: url(image/f_one.png);background-position: 50% 40%;background-repeat: no-repeat;">母婴专区</div>
            <div class="second" style="background: #48aacd;">
                <ul>
                    <c:forEach items="${requestScope.typeListMuying}" var="type">
                        <li><a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a></li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
        <!--------------中间---------------->
        <div class="zhongbu">
            <ul>
            <c:forEach items="${requestScope.goodsListMuyin}" var="goods">
                <li>
                    <p style="color:black;">
                   <a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}">${fn:substring(goods.goodsName, 0, 10)}...</a></p>
                    <div class="pic">
                    <a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}"
                         title="${goods.goodsName}">
                    <img src="upImgs/${goods.goodsImg}"></a></div>
                </li>
             </c:forEach>
            </ul>
            <span class="heng"></span>
            <span class="shu"></span>
        </div>
        <!--------------------右边部分-------------------------->
        <div class="right">
            <h1>最新热卖</h1>
            <ul>
                <c:forEach items="${requestScope.goodsListMuyin_Re}" var="regoodsMuyin">
                <li>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsMuyin.footmarkGood.goodsId}" title="${regoodsMuyin.footmarkGood.goodsName}">
                        <img src="upImgs/${regoodsMuyin.footmarkGood.goodsImg}"></a></dt>
                        <dd class="xiangxi"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsMuyin.footmarkGood.goodsId}">&nbsp;&nbsp;${fn:substring(regoodsMuyin.footmarkGood.goodsName, 0, 8)}..</a></dd>
                        <dd><span class="fl">&nbsp;&nbsp;${regoodsMuyin.footmarkGood.goodsPrice}</span><span class="fr"><fmt:formatNumber type="number" value="${regoodsMuyin.footmarkGood.goodsPrice*1.2}"/>
</span></dd>
                    </dl>
                    <div class="clear"></div>
                </li>
               </c:forEach>
            </ul>
        </div>
    </div>

    <!------------------2楼-------------->
    <div class="floor wt1080" style="border-top:2px solid #a50332;">
        <div class="floor_two"></div>
        <!---------------左边---------------->
        <div class="left">
            <div class="start" style="background: #a50332;background-image: url(image/f_two.png);background-position: 50% 40%;background-repeat: no-repeat;">美妆护肤</div>
            <div class="second" style="background: #cc3467;">
                <ul>
                    <c:forEach items="${requestScope.typeListMeizhuang}" var="type">
                        <li><a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a></li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
        <!--------------中间---------------->
        <div class="zhongbu">
            <ul>
            <c:forEach items="${requestScope.goodsListMeizhuang}" var="goods">
                <li>
                    <p style="color:black;">
                    <a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}">${fn:substring(goods.goodsName, 0, 10)}...</a></p>
                    <div class="pic"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}" title="${goods.goodsName}">
                    <img src="upImgs/${goods.goodsImg }"></a></div>
                </li>
                </c:forEach>
               
            </ul>
            <span class="heng"></span>
            <span class="shu"></span>
        </div>
        <!--------------------右边部分-------------------------->
        <div class="right">
            <h1>最新热卖</h1>
            <ul>
                <c:forEach items="${requestScope.goodsListMeizhuang_Re}" var="regoodsMeizhuang">
                <li>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsMeizhuang.footmarkGood.goodsId}" title="${regoodsMeizhuang.footmarkGood.goodsName}">
                        <img src="upImgs/${regoodsMeizhuang.footmarkGood.goodsImg}"></a></dt>
                        <dd class="xiangxi"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsMeizhuang.footmarkGood.goodsId}">&nbsp;&nbsp;${fn:substring(regoodsMeizhuang.footmarkGood.goodsName, 0, 8)}..</a></dd>
                        <dd><span class="fl">&nbsp;&nbsp;${regoodsMeizhuang.footmarkGood.goodsPrice}</span><span class="fr"><fmt:formatNumber type="number" value="${regoodsMeizhuang.footmarkGood.goodsPrice*1.2}"/></span></dd>
                    </dl>
                    <div class="clear"></div>
                </li>
               </c:forEach>
            </ul>
        </div>
    </div>

    <!------------------3楼-------------->
    <div class="floor wt1080" style="border-top:2px solid #217575;">
        <div class="floor_three"></div>
        <!---------------左边---------------->
        <div class="left">
            <div class="start" style="background: #217575;background-image: url(image/f_three.png);background-position: 50% 40%;background-repeat: no-repeat;">家居生活</div>
            <div class="second" style="background: #339a99;">
                <ul>
                    <c:forEach items="${requestScope.typeListJiaju}" var="type">
                        <li><a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a></li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
        <!--------------中间---------------->
        <div class="zhongbu">
            <ul>
            <c:forEach items="${requestScope.goodsListJiaju}" var="goods">
                <li>
                    <p style="color:black;"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}">${fn:substring(goods.goodsName, 0, 10)}...</a></p>
                    <div class="pic"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}" title="${goods.goodsName}">
                    <img src="upImgs/${goods.goodsImg}"></a></div>
                </li>
             </c:forEach>   
            </ul>
            <span class="heng"></span>
            <span class="shu"></span>
        </div>
        <!--------------------右边部分-------------------------->
        <div class="right">
            <h1>最新热卖</h1>
            <ul>
                <c:forEach items="${requestScope.goodsListJiaju_Re}" var="regoodsJiaju">
                <li>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsJiaju.footmarkGood.goodsId}" title="${regoodsJiaju.footmarkGood.goodsName}">
                        <img src="upImgs/${regoodsJiaju.footmarkGood.goodsImg}"></a></dt>
                        <dd class="xiangxi"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsJiaju.footmarkGood.goodsId}">&nbsp;&nbsp;${fn:substring(regoodsJiaju.footmarkGood.goodsName, 0, 8)}..</a></dd>
                        <dd><span class="fl">&nbsp;&nbsp;${regoodsJiaju.footmarkGood.goodsPrice}</span><span class="fr"><fmt:formatNumber type="number" value="${regoodsJiaju.footmarkGood.goodsPrice*1.2}"/></span></dd>
                    </dl>
                    <div class="clear"></div>
                </li>
               </c:forEach>
            </ul>
        </div>
    </div>
    <!------------------4楼-------------->
    <div class="floor wt1080" style="border-top:2px solid #ee6018;">
        <div class="floor_four"></div>
        <!---------------左边---------------->
        <div class="left">
            <div class="start" style="background: #ee6018;background-image: url(image/f_four.png);background-position: 50% 40%;background-repeat: no-repeat;">食品营养</div>
            <div class="second" style="background: #ff9a66;">
                <ul>
                    <c:forEach items="${requestScope.typeListYinyang}" var="type">
                        <li><a href="${pageContext.request.contextPath}/fontGoods/findBytypeId?typeId=${type.typeId}&typePid=${type.typePid.typeId}" >${type.typeName}</a></li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
        <!--------------中间---------------->
        <div class="zhongbu">
            <ul>
            <c:forEach items="${requestScope.goodsListYinyang}" var="goods">
                <li>
                    <p style="color:black;"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}">${fn:substring(goods.goodsName, 0, 10)}...</a></p>
                    <div class="pic"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${goods.goodsId}" title="${goods.goodsName}">
                    <img src="upImgs/${goods.goodsImg}"></a></div>
                </li>
            </c:forEach>    
            </ul>
            <span class="heng"></span>
            <span class="shu"></span>
        </div>
        <!--------------------右边部分-------------------------->
        <div class="right">
            <h1>最新热卖</h1>
            <ul>
                <c:forEach items="${requestScope.goodsListYinyang_Re}" var="regoodsYinyang">
                <li>
                    <dl>
                        <dt><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsYinyang.footmarkGood.goodsId}" title="${regoodsYinyang.footmarkGood.goodsName}">
                        <img src="upImgs/${regoodsYinyang.footmarkGood.goodsImg}"></a></dt>
                        <dd class="xiangxi">
                        <a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${regoodsYinyang.footmarkGood.goodsId}">&nbsp;&nbsp;${fn:substring(regoodsYinyang.footmarkGood.goodsName, 0, 8)}..</a></dd>
                        <dd><span class="fl">&nbsp;&nbsp;${regoodsYinyang.footmarkGood.goodsPrice}</span><span class="fr"><fmt:formatNumber type="number" value="${regoodsYinyang.footmarkGood.goodsPrice*1.2}"/></span></dd>
                    </dl>
                    <div class="clear"></div>
                </li>
               </c:forEach>

            </ul>
        </div>
    </div>
    <div style="margin-top:50px;"></div>
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
                <a href="${pageContext.request.contextPath }/goodstype/findAll"><img src="image/logo.png"></a>
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
        <p class="beian">Copyright © 2016 洋店网.版权所有.备案号：京ICP证35124521号.技术支持：王丽娜</p>
    </div>
</div>
<!------------右侧返回顶部---------------->

<!-- --------------------------------- -->
		<script type="text/javascript">
			
			function send(){
				var lsBtn = document.getElementById("leftSendBtn");
				var text = document.getElementById("leftText").value;
				if(text.trim() != ""){
					$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/Msg/sendMsg?flag=user&message="+text,
						   success: function(msg){
							   alert("消息已经发出！")
						   }
					});
					var leftContent = document.getElementById("leftContent");
					var option = document.createElement("option");
					var len = text.length;
					option.style.width = len * 15 + len*2 + "px";
					option.style.marginLeft = 350 - (len * 15 + len*2) - 72 +"px";
					option.innerHTML = text;
					leftContent.appendChild(option);
					document.getElementById("leftText").value = "";
				} 
		}

		</script>
		<script type="text/javascript">
			setInterval("getMsg()",1000);
			function getMsg(){
				$.ajax({
				   type: "POST",
				   url: "${pageContext.request.contextPath}/Msg/getMsg?flag=manager",
				   success: function(msg){
					if(msg!=null && msg!=""){
					var leftContent = document.getElementById("leftContent");
				    var option1 = document.createElement("option");
					option1.innerHTML = msg;
					var len = msg.length;
					option1.style.backgroundColor = "white";
					option1.style.marginLeft = "10px";
					option1.style.width = len * 15 + len*2 + "px";
					leftContent.appendChild(option1);
					}
				   }
				});
			};
		</script>
		<!-- <div class="outer"> -->
			 <!-- <div class="box"> --> 
				<!-- <div class="chat"> -->
					<div id="chatWindow" style="display: none">
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
						<select multiple="multiple" id="leftContent">
						</select>
					</div>
					<div class="send">
						<input type="text" id="leftText" class="sText"/>
						<input type="button" id="leftSendBtn" class="btn" value="发送" onclick="send()"/>
					</div>
					</div>
				<!-- </div> -->
			<!--  </div> -->
		<!-- </div> -->
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