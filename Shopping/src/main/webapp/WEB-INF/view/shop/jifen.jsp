<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>杨电网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/jifen.css" type="text/css" rel="stylesheet"/>
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
    <script type="text/javascript" src="assets/layer/layer.js"></script>
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
            <li class="current"><a href="${pageContext.request.contextPath}/IntegralexchangeController/findAllExchange">我的积分</a></li>
            <%-- <li><a href="${pageContext.request.contextPath}/path/shop/anquan">账户安全</a></li>
            <li><a href="${pageContext.request.contextPath}/path/shop/shoucang">我收藏的商品</a></li> --%>
            <li><a href="${pageContext.request.contextPath}/ordersAddress/tiaoMyAddressJsp">管理收货地址</a></li>
        </ul>
    </div>
    <script type="text/javascript">
    	function jifen() {
    		$("#jifendetail").prop("class", "");
    		$("#jifen").prop("class", "current");
    		$("#myAjax").css("display", "none");
    		$("#s_list").css("display", "block");
    	}
    	function jifendetail() {
    		$("#jifen").prop("class", "");
    		$("#jifendetail").prop("class", "current");
    		$("#s_list").css("display", "none");
    		$("#myAjax").css("display", "block");
    	}
    	function jifenduihuan(num,exchangeId) {
    		var myJiFen = parseInt($("#myIntegral").text());
    		if(num>myJiFen) {
    			layer.msg('积分不足',{
    				icon:2,
    				time:900,
    				offset:['270px','600px'],
    				shift:6
    			});
    		} else {
    			layer.confirm('您是否兑换优惠券？',{
    				btn:['确认','取消']
    			},function(){
    				$.ajax({
        			type:"post",
        			url:"${pageContext.request.contextPath}/CouponController/saveCoupon?exchangeId="+exchangeId,
        			success:function(msg) {
        				$("#myIntegral").text(msg);
        				layer.msg('兑换成功!',{icon:1,offset:['270px','600px'],time:1000});
        			}
        			});
    			},function(){
    				layer.close();
    			})
    		}
    	}
    </script>
    <div class="fr">
        <div class="c_r_t">
            <ul>
                <li id="jifen" class="current" onclick="jifen()"><a href="javascript:void(0)">我的积分</a></li>
                <li id="jifendetail" class="" onclick="jifendetail()"><a href="javascript:void(0)">积分明细</a></li>
            </ul>
            <div class="clear"></div>
        </div>
        
        <!------------------兑换劵列表------------------->
        <div id="s_list" class="s_list" style="display: block">
        <p class="explode">可用积分<font id="myIntegral">${sessionScope.loginUsers.userIntegral }</font>
        <!-- <span>2016-12-31</span> 将过期京豆<font>48</font>个 -->
        </p>
            <ul>
            	<c:forEach items="${requestScope.exchangeList }" var="exchange">
            		<li>
                    <div class="s_top">
                       	 ￥<font>${exchange.integralexchangeReduce }</font>
                       	 <span>满${exchange.integralexchangeAvail }元可用</span>
                    </div>
                    <div class="s_bottom">
                        <p>满${exchange.integralexchangeAvail }减${exchange.integralexchangeReduce }</p>
                        <p>适用范围：<font>${exchange.integralexchangeRange }</font></p>
                        <p>使用期限：兑换后${exchange.integralexchangeTerm }天</p>
                        <p>其他限制：无</p>
                        <a href="javascript:void(0)" onclick="jifenduihuan(${exchange.integralexchangeIntegralnum },${exchange.integralexchangeId })" class="duihuan">${exchange.integralexchangeIntegralnum }积分兑换</a>
                    </div>
                </li>
            	</c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
        <script type="text/javascript">
        	function alls() {
        		$("#expend a").prop("class", "");
        		$("#income a").prop("class", "");
        		$("#alls a").prop("class", "current");
        		$(".b_list_details").html("");
        		$.ajax({
        			type:"post",
        			url:"${pageContext.request.contextPath}/IntegralexchangeController/findIntegraldetail?flag=all",
        			success:function(msg) {
        				$(".b_list_details").html(msg);
        			}
        		});
        	}
        	function income() {
        		$("#alls a").prop("class", "");
        		$("#expend a").prop("class", "");
        		$("#income a").prop("class", "current");
        		$(".b_list_details").html("");
        		$.ajax({
        			type:"post",
        			url:"${pageContext.request.contextPath}/IntegralexchangeController/findIntegraldetail?flag=income",
        			success:function(msg) {
        				$(".b_list_details").html(msg);
        			}
        		});
        	}
        	function expend() {
        		$("#alls a").prop("class", "");
        		$("#income a").prop("class", "");
        		$("#expend a").prop("class", "current");
        		$(".b_list_details").html("");
        		$.ajax({
        			type:"post",
        			url:"${pageContext.request.contextPath}/IntegralexchangeController/findIntegraldetail?flag=expend",
        			success:function(msg) {
        				$(".b_list_details").html(msg);
        			}
        		});
        	}
        </script>
        <!-----------------选择栏--------------->
        <div id="myAjax" style="display: none;">
	        <div class="vio">
	            <ul>
	                <li id="alls" onclick="alls()"><a href="javascript:void(0)" class="current">积分明细</a></li>
	                <li id="income" onclick="income()"><a href="javascript:void(0)" >收入</a></li>
	                <li id="expend" onclick="expend()"><a href="javascript:void(0)">支出</a></li>
	                <!-- <li><a href="javascript:void(0)">过期</a></li> -->
	            </ul>
	            <div class="clear"></div>
	        </div>
        <!------------积分列表---------------->
       	 <div class="b_list">
	            <div class="b_list_top">
	                <span class="a">来源/用途</span>
	                <span class="b">积分变化</span>
	                <span class="c">日期</span>
	            </div>
	            <!--------------列表详细----------------->
	            <div class="b_list_details">
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
            	</div>
       	 </div>
	</div><!-- ajax标签结束 -->
    </div>
</div>

<!---------------------热销------------------>
<div class="hot wt1080">
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
	