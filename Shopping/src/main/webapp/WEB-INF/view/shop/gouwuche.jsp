<%@page import="com.web.entity.Cart"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>购物车</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/gouwuche.css" type="text/css" rel="stylesheet"/>
    <!-- 右侧返回顶部 -->
    <link rel="stylesheet" type="text/css" href="css/right_top.css">
    <!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	 <link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css"> 
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <!-- 先加载jquery.js 在加载框架js -->
	<!-- <script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script> --> 
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
                <li><span class="shop" id="myCartGoodsNum">购物车<a href="${pageContext.request.contextPath}/cart/showCart">
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
    <a class="my_shop fr" href="${pageContext.request.contextPath}/cart/showCart">我的购物车<span id="myCartGoodsNum1">
		<c:choose>
                	<c:when test="${not empty sessionScope.cartNum}">
                		${sessionScope.cartNum}
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

<!--------------------内容----------------------->
<div class="wt1080">
    <!--------------标题----------->
    <div class="my_car">
        <h1>我的购物车</h1>
        <div class="place">
            <ul>
                <li class="current"><span>1</span><p>我的购物车</p></li>
                <li><span>2</span><p>提交订单</p></li>
                <li><span>3</span><p>选择支付方式</p></li>
            </ul>
            <span class="heng"></span>
        </div>
    </div>
    <!--------------选择----------->
    <div class="details">
        <div class="title">
            <div style="text-align: left;width: 84px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="image/k1.png" style="float: left;margin-top: 1px;margin-right: 5px;cursor: pointer"> -->全选</div>
            <div style="width: 432px;">商品</div>
            <div style="width: 141px;">单价</div>
            <div style="width: 141px;">数量</div>
            <div style="width: 141px;">合计</div>
            <div style="width: 141px;">操作</div>
        </div>
        <!-----------------------商品展示---------------------------->
        <div class="goods">
            <script>
                function choice1(goodsId){
            		var c=$("#choiceOrNot"+goodsId).prop("value");
            		var num=0;
            		if(c==1){
            			 $("#choiceOrNot"+goodsId).prop("value",2);
            		}else if(c==2){
            			 $("#choiceOrNot"+goodsId).prop("value",1);
            		}
            		var c1=$("#choiceOrNot"+goodsId).prop("value");
            		var flag=1;//标志 ，1：大家都相同，需要考虑全选框
            		var test=$("input[name='imgState']");
            		var zongNum=test.length;
					   for(var i=0;i<test.length;i++){
					   	if($(test[i]).prop("value")!=c1){
					   	  flag=2;
					   	  num=num+1;
					   	}
					   }
					  if(flag==1){
					  	if(c1==2){
					  	   //大家都是2，就是都不选，所以全选框也该是2
					  	   $("#goodsPicPath").prop("src","image/k2.png");
					  	   $("#imgBiao").prop("value",2);
					  	}else if(c1==1){
					  		$("#goodsPicPath").prop("src","image/k1.png");
					  	    $("#imgBiao").prop("value",1);
					  	}
					  }else if(flag==2){
					  		$("#goodsPicPath").prop("src","image/k1.png");
					  	    $("#imgBiao").prop("value",1);
					  	} 
            		
            		
            		if(c==2){
            		     /* 从有到无 */
            		     $("#goodsPic"+goodsId).prop("src","image/k1.png");
            		     goodsToOrder(goodsId,c);
            		   		$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/readyToJieSuan?goodsId="+goodsId,
						   success: function(msg){
						     var sumPrice=$("#sumPrice").text();
						     var l=parseFloat(sumPrice)-parseFloat(msg);
						     $("#sumPrice").html(l.toFixed(2));//保留两位小数a.toFixed(2)
						     $("#myNum1").html(num);
						   }
						});
            		}else if(c==1){
							/* 从无到有 */            		
            		   $("#goodsPic"+goodsId).prop("src","image/k2.png");
            		     goodsToOrder(goodsId,c);
            			$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/readyToJieSuan?goodsId="+goodsId,
						   success: function(msg){
						     var sumPrice=$("#sumPrice").text();
						     var l=parseFloat(sumPrice)+parseFloat(msg);
						     $("#sumPrice").html(l.toFixed(2));
						     $("#choiceOrNot"+goodsId).prop("value",2);
						     $("#myNum1").html(zongNum-num);
						   }
						});
            		}
            	}
            	function goodsToOrder(goodsId,type){
            	    /* type=1就是将这个goods加到CartToOrderList，2就是减 */
            		//alert("goodsToOrder"+goodsId+type);
            		$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/addGoodsToCartToOrderList?goodsId="+goodsId+"&type="+type,
						   success: function(msg){
						     
						   }
						});
            	}
            </script>
            <c:forEach items="${requestScope.cartList}" var="c">
            	<div class="goods_details">
                <div class="g_one" align="middle">
                <a onclick="choice1(${c.cartGoods.goodsId})" id="${c.cartGoods.goodsId}" name="choiceGoods"><img name="myImg1" id="goodsPic${c.cartGoods.goodsId}" src="image/k1.png"></a>
                 <input name="imgState" id="choiceOrNot${c.cartGoods.goodsId}" type="hidden" value="1"/>
                 <!-- <input type="checkbox" name="mycheck" style="display: none"/> -->
                </div>
                <div class="g_two">
                    <div class="h">
                        <div class="pic"><a href="javascript:void(0)"><img src="upImgs/${c.cartGoods.goodsImg}"></a></div>
                        <div class="miaoshu">
                            <p style="margin-top: 5px;"><a href="javascript:void(0)">${c.cartGoods.goodsName}</a></p>
                            <p style="color: #888888;margin-top: 5px;">${c.cartGoods.goodsFromaddress}</p>
                        </div>
                    </div>
                </div>
                <div class="g_three"><p class="y">${c.cartGoods.goodsPrice}</p><p class="k">￥${c.cartGoods.goodsPrice}</p></div>
                <div class="g_four">
                    <div>
                        <span style="border-right: 1px solid #eeeeee" onclick="jianNum(${c.cartGoods.goodsId},${c.cartNum})">-</span>
                        <input name="" id="goodsNum${c.cartGoods.goodsId}" type="text" value="${c.cartNum}">
                        <span style="border-left: 1px solid #eeeeee" onclick="jiaNum(${c.cartGoods.goodsId},${c.cartNum})">+</span>
                    </div>
                </div>
                <script type="text/javascript">
                   
                   function	jianNum(goodsId,cartNum){
                      var r= $("#goodsNum"+goodsId).prop("value");
                      if(r==1){
                      	alert("数量已为1，不可再减！！！！");
                      }else{
                      	$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/changeGoodsNum?goodsId="+goodsId+"&type=jian",
						   success: function(msg){
						     $("#goodsNum"+goodsId).prop("value",msg.cartNum);
						     var zong = msg.cartPrice;//保留两位小数
						     $("#myzongjia"+goodsId).html(zong.toFixed(2)); 
						     var s=$("#choiceOrNot"+goodsId).prop("value");
						     //alert(s);
						     if(s==2){
						       var s1=$("#sumPrice").text();
						       var l=parseFloat(s1)-parseFloat(msg.cartGoods.goodsPrice);
						       $("#sumPrice").html(l.toFixed(2));
						       
						     }
						     if(cartNum>1){
						      var numm=$("#myCartGoodsNum1").text();
						       $("#myCartGoodsNum1").html(numm-1);
						       $("#myCartGoodsNum2").html(numm-1);
						   }
						  } 
						});
                      }
                    
                   }
                   function	jiaNum(goodsId,cartNum){
                    $.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/cart/changeGoodsNum?goodsId="+goodsId+"&type=jia",
						   success: function(msg){
						    $("#goodsNum"+goodsId).prop("value",msg.cartNum);
						    var zongjia = msg.cartPrice;//总价保留两位小数
						    $("#myzongjia"+goodsId).html(zongjia.toFixed(2));
						    /* var s=parseDouble(msg.cartPrice); */
						   var s=$("#choiceOrNot"+goodsId).prop("value");
						     //alert(s);
						     if(s==2){
						       var s1=$("#sumPrice").text();
						      /*  var l=parseFloat(s)-parseFloat(msg.cartPrice); */
						       var l=parseFloat(s1)+parseFloat(msg.cartGoods.goodsPrice);
						       $("#sumPrice").html(l.toFixed(2));
						     }
						     var numm=$("#myCartGoodsNum1").text();
						       numm=parseInt(numm)+parseInt(1);
						       $("#myCartGoodsNum1").html(numm);
						       $("#myCartGoodsNum2").html(numm);
						   }
						});
                   }
                </script>
                <div class="g_five"><p>￥<span id="myzongjia${c.cartGoods.goodsId}">
                <fmt:formatNumber value="${c.cartGoods.goodsPrice*c.cartNum}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>
                </span></p></div>
                <div class="g_six"><a href="${pageContext.request.contextPath}/cart/deleteGoodsNum?goodsId=${c.cartGoods.goodsId}"><span></span></a></div>
            </div>
            </c:forEach>
        </div>
        <!------------------下部分------------------>
        <script type="text/javascript">
        function deleteGoods(id){
        	alert(id);
        	
        }
		function choiceAllGoods(){
			   var value=$("#imgBiao").prop("value");
			   
			   var src1=$("#goodsPicPath").prop("src");
			   $("img[name='myImg1']").prop("src",src1);
			   $("input[name='imgState']").prop("value",value); 
			   
			   if(value==2){
			   	 $("#goodsPicPath").prop("src","image/k1.png");
			   	 $("#imgBiao").prop("value",1);
			   	 
			   }else if(value==1){
			     $("#goodsPicPath").prop("src","image/k2.png");
			     $("#imgBiao").prop("value",2);
			      $("#sumPrice").html(0);
			   }
			   
			   /* var src1=$("#goodsPicPath").prop("src");
			   $("img[name='myImg1']").prop("src",src1);
			   var value1=$("#imgBiao").prop("value");
			   $("input[name='imgState']").prop("value",value1);  */
			   $("a[name='choiceGoods']").click();
			}	
			   
        </script>
        <div class="d_d">
            <div class="d_d_l">
                <a href="javascript:;" id="allChoice" onclick="choiceAllGoods()"><img id="goodsPicPath" src="image/k1.png" style="float: left;margin-top: 22px;margin-right: 5px;"><input type="hidden" id="imgBiao" value="1"/>全选</a>
                <a href="javascript:void(0)" style="margin-left: 10px;">删除选中商品</a>
            </div>

            <div class="d_d_r">
                <p class="o">已选商品<span id="myNum1">0</span>种<font>总价（不含运费）：<span id="sumPrice">0</span><!-- <span>.00</span> --></font></p>
                <p class="t">商品应付总计：￥0.00<font>订单关税：￥0</font></p>
            </div>
            <a href="${pageContext.request.contextPath}/cart/readyToJieSuan1" class="jiesuan">去结算</a>
        </div>
    </div>
    <!---------------------热销------------------>
    <div class="hot">
        <div class="title">热销推荐</div>
        <div class="content">
            <ul>
              <c:forEach items="${requestScope.cart_ReList}" var="re">
                <li>
                    <div class="pic"><a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${re.footmarkGood.goodsId}" title="${re.footmarkGood.goodsName}">
                    <img src="upImgs/${re.footmarkGood.goodsImg}"></a></div>
                    <p class="c_t" style="height:40px;"><a href="javascript:void(0)">${re.footmarkGood.goodsName}</a></p>
                    <p class="price">￥${re.footmarkGood.goodsPrice}</p>
                    <a href="${pageContext.request.contextPath}/fontGoods/goodsDetail?goodsId=${re.footmarkGood.goodsId}" title="${re.footmarkGood.goodsName}" class="goumai">立即购买</a>
                </li>
              </c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
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
	