<%@page import="com.web.entity.Cart"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>订单</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/public.css" type="text/css" rel="stylesheet"/>
    <link href="css/order.css" type="text/css" rel="stylesheet"/>
    <!-- 右侧返回顶部 -->
    <link rel="stylesheet" type="text/css" href="css/right_top.css">
    <!-- 必须先加载CSS文件 -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/main.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="js/auto/thickbox.css"> -->
	<link rel="stylesheet" type="text/css" href="js/auto/jquery.autocomplete.css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <!-- 先加载jquery.js 在加载框架js -->
	<!-- <script type="text/javascript" src="js/auto/jquery-1.2.min.js"></script>  -->
	<script type="text/javascript" src="js/auto/jquery.autocomplete.js"></script> 
    <script type="text/javascript" src="js/slide.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript" ></script>
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
	            <input id="keyword" name="sname" type="text" class="a_search fl" placeholder="请输入关键字" value="${sessionScope.sname }">
	            <button type="submit" style="border: none;cursor:pointer;">
	            <span class="b_search fl"></span></button>
	        </form>
	        <div class="clear"></div>
        </div>
        <p>
            <a href="javascript:void(0)" class="current">可莱丝</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:void(0)">森田药妆</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:void(0)">Montagne jeunesse</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:void(0)">丽得姿</a>
        </p>
    </div>
    <a class="my_shop fr" href="${pageContext.request.contextPath}/cart/showCart">我的购物车<span>2</span></a>
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
           
            
            <li><a href="lanmu.jsp"><span>全球直邮</span></a></li>
            <li><a href="lanmu.jsp"><span>合作申请</span></a></li>
        </ul>
        <div style="clear:both"></div>
    </div>
</div>
<!---------------------导航完--------------------->
<div class="wt1080">
    <!--------------标题----------->
    <div class="my_order">
        <h1>提交订单</h1>
        <div class="place">
            <ul>
                <li class="current"><span>1</span><p>我的购物车</p></li>
                <li class="current"><span>2</span><p>提交订单</p></li>
                <li><span>3</span><p>选择支付方式</p></li>
            </ul>
            <span class="heng"></span>
            <span class="a_heng"></span>
        </div>
    </div>
    <!-------------收货地址-------------->
    
  <form action="${pageContext.request.contextPath}/ordersFont/addGoodsToOrder" method="post">
    <div class="address">
        <div class="roo">收货地址<span></span></div>
        <div class="b_address">
            <ul>
            
            
                <!-- <li class="current">
                    <h1>张新<span>159****3994</span></h1>
                    <p>四川省 成都市 武侯区 大石西路130号还是觉得撒借款单萨科技哈撒艰苦的空间撒开回到家撒快点撒花</p>
                    <p>收货电话：510524********1905</p>
                    <div class="operate">
                        <a href="javascript:void(0)" class="edit">编辑</a>
                        <a href="javascript:void(0)" class="del">删除</a>
                    </div>
                    <div class="check"></div>
                </li> -->
                
                <c:forEach items="${requestScope.addressList}" var="a">
                    <c:choose>
                    	<c:when test="${a.addressState eq 1}">
                    		<li name="myLi2" id="myLi${a.addressId}" class="current" onclick="choiceAddress('${a.addressId}','${a.addressPhone}','${a.addressName}','${a.addressDesc}')">
                    	</c:when>
                    	<c:otherwise>
                    		<li name="myLi2" id="myLi${a.addressId}" class="" onclick="choiceAddress('${a.addressId}','${a.addressPhone}','${a.addressName}','${a.addressDesc}')">
                    	</c:otherwise>
                    </c:choose>
		                    <h1>收货人：${a.addressName}</h1>
		                    <p>收货电话：${a.addressPhone}</p>
		                    <p>收货人地址：${a.addressDesc}</p>
		                    <!-- <p>身份证号码：510524********1905</p> -->
		                    <div class="operate">
		                        <a href="javascript:void(0)" class="edit" onclick="editAddress('${a.addressId}')">编辑</a>
		                        <a href="javascript:void(0)" class="del" onclick="deleteAddress('${a.addressId}')">删除</a>
		                    </div>
		                    <div class="check"></div>
                   </li>
                </c:forEach>
            </ul>
            <div class="add_address"><a href="javascript:void(0)" onclick="addAddress()">添加地址</a></div>
            <div class="clear"></div>
        </div>
    </div>
    <script type="text/javascript">
    function deleteAddress(addressId){
    layer.confirm('确定要删除？',{btn:['确定','取消']},function(index){
		//alert(addressId);
		/* $.post("${pageContext.request.contextPath}/ordersAddress/deleteAddress", {"addressId": addressId},
					   function(data){
					   $(obj).parents("li").remove();
					   }, "json");
					   layer.msg("yse"); */
					   tiao1(addressId);
		},function(){})
	}
	function tiao1(addressId){
	   location.href="${pageContext.request.contextPath}/ordersAddress/deleteAddress1?addressId="+addressId;
	}
     function addAddress(){
     	if(${requestScope.addressList.size()>=3}){
     	/*  layer.confirm("您的地址数量已达上限，请删除后增加",{btn:'重要','奇葩'},function(){layer.msg('123',{ikon:1})},function(){layer.msg("564",{time:20000,btn:['明白了','知道了']})}; 
     		/* layer.msg("5555"); */
     		/* layer.alert("您的地址数量已达上限，请删除后增加",{ikon:5}); */
     	layer.confirm('您的地址数量已达上限，请删除后增加',{btn:['管理地址','考虑考虑']},
     					function(){
     					  tiao(); 
     					},
     					function(){
     					layer.confirm('确定不再更改？',
     					 {btn:['去更改','算了吧']},
     					            function(){tiao();},
     					            function(){layer.msg("请从现有地址中选择");}
     					            );
     	             }); 
     	}else{
     	   
     		layer.open({
		    type: 2,//（1是返回字符串，2是jsp）
			title:'修改地址',
			area: ['400px','450px'],//（弹出来的框的面积）
			shadeClose: true,
			content: '${pageContext.request.contextPath}/ordersAddress/addAddressFirst' ,
		    close:function(index){//设置窗口右上角关闭事件
					 parent.layer.close(index);
					},
			         end:function(){//回调函数
					window.location.reload(); 
					}
		 })	; 
     		
     	} 
     	
     	
     }
     function tiao(){
      	location.href="${pageContext.request.contextPath}/ordersAddress/tiaoMyAddressJsp";
     }
     function editAddress(addressId){
     /* layer.alert('6666',{icon:1}); */
      layer.open({
		    type: 2,//（1是返回字符串，2是jsp）
			title:'修改地址',
			area: ['400px','450px'],//（弹出来的框的面积）
			shadeClose: true,
			content: '${pageContext.request.contextPath}/ordersAddress/changeAddressFirst?addressId='+addressId ,
		 })	; 
		 
     }
    function close2(){
  	    //alert("5555");
  		var index=parent.layer.getFrameIndex(window.name);
	    parent.layer.close(index);
  	}
     function choiceAddress(addId,phone,name,desc){
     	//alert(addId);
     	//alert($("#myLi"+addId).prop("class"));
     	$("li[name='myLi2']").prop("class","");
     	$("#myLi"+addId).prop("class","current");
        $("#nammm").html(name);
     	$("#addd").html(desc);
     	       $.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/ordersAddress/changeMorenAddress?addresId="+addId,
						   success: function(msg){
						   //  alert(msg);
						   }
						});
                     }
     </script>
    <!---------------订单信息-------------->
    <div class="order_details">
        <div class="roo">订单信息<span></span></div>
        <div class="tt">
            <table>
                <tr>
                    <th width="50%">商品</th>
                    <th width="16%">单价</th>
                    <th width="16%">数量</th>
                    <th width="18%">小计</th>
                </tr>
                <c:forEach items="${sessionScope.cartToOrderList}" var="c">
	                <tr>
	                    <td>
	                        <div class="pic"><img src="upImgs/${c.cartGoods.goodsImg}"></div>
	                        <p class="one"><a href="javascript:void(0)">${c.cartGoods.goodsName}</a></p>
	                       <input type="hidden" name="goodsName" value="${c.cartGoods.goodsName}"/>
	                        <p class="two">韩国一号仓发货</p>
	                    </td>
	                    <td><span class="e">￥${c.cartGoods.goodsPrice}</span></td>
	                    <td>${c.cartNum}</td>
	                    <td><span class="u">
	                     
	                                                             ￥<fmt:formatNumber value="${c.cartGoods.goodsPrice*c.cartNum}" pattern="##.##" minFractionDigits="2" />
	                    </span></td>
	                </tr>
                </c:forEach>

                
            </table>
        </div>
    </div>
    <!------------------优惠卷--------------->
    <div class="coupon">
        <div class="roo">优惠卷<span></span></div>
        <div class="rr">
            <c:choose>
                  <c:when test="${requestScope.canUseConpon.size() eq 0}">
                       <p>此订单暂无可用的优惠卷。您可以<a href="javascript:void(0)">查看所有的优惠卷</a>了解使用限制。<a href="javascript:void(0)">[了解京东优惠卷规则]</a></p>
                  </c:when>
                  <c:otherwise>
                  	  <p>此订单可用的优惠卷${requestScope.canUseConpon.size()}张 。</a></p>
                  </c:otherwise>
             </c:choose>
            
           
                
                  <c:forEach items="${requestScope.canUseConpon}" var="conpon">
                   <div class="ff">
                  	<ul>
                  	<li onclick="choseCoupon(${conpon.couponId},${requestScope.priceAll})"><input type="radio" name="myConpon" value="${conpon.couponId}" id="conponId"/>满${conpon.couponAvail}元-${conpon.couponReduce}元</span>
                    <span>${conpon.couponRange}</span>
                    <span>有效期至:<fmt:formatDate value="${conpon.couponEnd}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                    </li>
                 	</ul>
                 	</div>
                  </c:forEach>
                
            
            <p style="border-bottom: none;">可以优惠 <span id="youhui2222"><font>0.00</font></span>元</p>
        </div>
        <script type="text/javascript">
        	function choseCoupon(conponId){
        		//alert(conponId);
        		
        		$.ajax({
						   type: "POST",
						   url: "${pageContext.request.contextPath}/ordersFont/choseConpon?conponId="+conponId,
						   success: function(msg){
						     $("#myYouhui").html("￥"+msg);
						     $("#youhui2222").html("￥"+msg);
						    var price=$("#myZongjiaWithYouHui").text();
						    var price1=$("#realPrice").text();
						     $("#myZongjiaWithYouHui").html(price1-msg);
						      $("#myZongjiaWithYouHui1").html(price1-msg);
						      $("#aHref").prop("href","${pageContext.request.contextPath}/ordersFont/addGoodsToOrder?conponId="+conponId);
						   	//alert($("#aHref").prop("href"));
						   }
						});
        	}
        </script>
          <% HttpSession s=request.getSession();
                   List<Cart> cartList=(List<Cart>)s.getAttribute("cartToOrderList");
                   int num111=0;
                   double sumPrice=0.00;
                   for (Cart cart1 : cartList) {
						num111+=cart1.getCartNum();
						sumPrice+=cart1.getCartPrice();
					}
                %>
        <div class="kk">
            <table>
               <%--  <tr>
                	<td>共<%=num111%>件商品,</td>
                </tr> --%>
                <tr>
                    <td>共<%=num111%>件商品,商品总金额：</td>
                    
                    <td align="left">￥<span id="realPrice"><fmt:formatNumber value="${requestScope.priceAll}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></span></td>
               		
                </tr>
                <tr>
                    <td>+运费：</td>
                    <td>￥0.00</td>
                </tr>
                <tr>
                    <td>-商品优惠：</td>
                    <td id="myYouhui">￥0.00</td>
                </tr>
            </table>
           <p class="money">应付金额：<span >￥<font id="myZongjiaWithYouHui"><fmt:formatNumber value="${requestScope.priceAll}" pattern="##.##" minFractionDigits="2" /></font></span></p>
        </div>
        <div class='clear'></div>
        <!---------------委托下的版本---------------->
        <div class="ll">
            <div class="bb">
                <h1>个人委托申报协议</h1>
                <p>本人承诺所购买商品系个人合理自用，现委托商家代理申报，代缴税款等通关事宜，本人保证遵守《海关法》和国家相关法律法规，保证所提供的身份信息和收货信息真是完整，无侵犯他人权益的行为，以上委托关系如实填写，本人愿意接受海关，检查检疫机构及其他监管部门的监管，并承担相应法律责任。</p>
            </div>
            <div class="ss">
                <p class="bg">寄送至：<span id="addd">${requestScope.morenAddress.addressDesc}</span></p>
                <input type="hidden" name="addressDesc" value="${requestScope.morenAddress.addressDesc}"/>
                
                <p>收货人：<span id="nammm">${requestScope.morenAddress.addressName}</span></p>
                <input type="hidden" name="addressName" value="${requestScope.morenAddress.addressName}"/>
                <p>收货电话：<span id="nammm">${requestScope.morenAddress.addressPhone}</span></p>
                <input type="hidden" name="addressPhone" value="${requestScope.morenAddress.addressPhone}"/>
            </div>
            <div class="gg">
                <p>应付金额：<span ><font id="myZongjiaWithYouHui1">￥
                <fmt:formatNumber value="<%=sumPrice %>" pattern="##.##" minFractionDigits="2" />
                <input type="hidden" name="goodsSumPrice" value="<%=sumPrice %>"/>
                                           元</font></span></p>
             </div>
            <div class="gg"><a id="aHref" href="${pageContext.request.contextPath}/ordersFont/addGoodsToOrder"><input type="button" value="确认提交订单"/></a></div>
            <div class="clear"></div>
        </div>
    </div>
    </form>
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
	