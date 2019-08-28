<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    	<title>网站后台管理系统  </title>
    	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
                <link rel="stylesheet" href="css/style3.css"/>
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="js/jquery-1.9.1.min.js"></script>        
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript"></script>
		<script src="assets/laydate/laydate.js" type="text/javascript"></script>
        
        
<script type="text/javascript">	
 $(function(){ 
 var cid = $('#nav_list> li>.submenu');
	  cid.each(function(i){ 
       $(this).attr('id',"Sort_link_"+i);
   
    })  
 })
 jQuery(document).ready(function(){ 	
    $.each($(".submenu"),function(){
	var $aobjs=$(this).children("li");
	var rowCount=$aobjs.size();
	var divHeigth=$(this).height();
    $aobjs.height(divHeigth/rowCount);	  	
  }); 
    //初始化宽度、高度    
    $("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140); 
	 
	$(".sidebar").height($(window).height()-99); 
    var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
	
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$("#main-container").height($(window).height()-76); 
	$("#iframe").height($(window).height()-140);
	$(".sidebar").height($(window).height()-99); 
	
	var thisHeight = $("#nav_list").height($(window).outerHeight()-173); 
	$(".submenu").height();
	$("#nav_list").children(".submenu").css("height",thisHeight);
  });
    $(".iframeurl").click(function(){
                var cid = $(this).attr("name");
				var cname = $(this).attr("title");
                $("#iframe").attr("src",cid).ready();
				$("#Bcrumbs").attr("href",cid).ready();
				$(".Current_page a").attr('href',cid).ready();	
                $(".Current_page").attr('name',cid);
				$(".Current_page").jsp(cname).css({"color":"#333333","cursor":"default"}).ready();	
				$("#parentIframe").jsp('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();	
				$("#parentIfour").jsp(''). css("display","none").ready();		
      });
    
		
});
 

/*********************点击事件*********************/
$( document).ready(function(){
  $('#nav_list').find('li.home').click(function(){
	$('#nav_list').find('li.home').removeClass('active');
	$(this).addClass('active');
  });	
												

//时间设置
  function currentTime(){ 
    var d=new Date(),str=''; 
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'; 
    return str; 
} 
setInterval(function(){$('#time').html(currentTime)},1000); 
//修改密码
$('.change_Password').on('click', function(){
    layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{			  
			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	 
	}
    });
});
  $('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="${pageContext.request.contextPath }/path/adminlogin";
        
    });
});
})
</script>	
	</head>
	<body>
		<div class="navbar navbar-default" id="navbar">
        <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="admin/index.jsp" class="navbar-brand">
						<small>					
						<img src="images/logo.png">
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
			   <div class="navbar-header pull-right" role="navigation">
			  
			  
			   <input  type="hidden" id="hiddenorder" value="${sessionScope.orderSize}"/>
               
               
               <ul class="nav ace-nav">	
                <li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span  class="time" ><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>${sessionScope.loginAdmin.adminName}	</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li><a href="javascript:void(0)"><i class="icon-cog"></i>设置</a></li>
								<li><a href="javascript:void(0)"><i class="icon-user"></i>个人资料</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
							</ul>
						</li>
	                   <li class="purple">
						<a data-toggle="dropdown" style="height:45px;" class="dropdown-toggle" href="javascript:void(0)"><i class="icon-bell-alt" style="line-height:45px;"></i><span class="badge badge-important" id="outNew">0</span></a>
							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                            <li class="dropdown-header"><i class="icon-warning-sign"></i><span id="newAdvice">0</span>条通知</li>

								<li>
									<a href="javascript:void(0)">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
												新订单
											</span>
											<span class="pull-right badge badge-success" id="newOrder">+0</span>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:void(0)" onclick="chat()">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-info icon-twitter"></i>
												用户消息
											</span>
											<span class="pull-right badge badge-info">+1</span>
										</div>
									</a>
								</li>

								<li>
									<a href="javascript:void(0)">
										查看所有通知
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

					
					</ul>
                
                </div>
			</div>
		</div>
		<div class="main-container" id="main-container">
		<script type="text/javascript">
		function chat(){
			layer.open({
						type : 2 //Page层类型
						,
						area : [  '550px','650px'  ],
						title : '对话窗口',
						offset : '50',
						shade : 0.6 //遮罩透明度
						,
						maxmin : true //允许全屏最小化
						,
						anim : 4 //0-6的动画形式，-1不开启
						,
						content : '${pageContext.request.contextPath}/path/shop/chatmanager'
						});
		}
		</script>
        <script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar" style="height:715px;">
<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
                     <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						网站后台管理系统  
						</div>
						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>
							<span class="btn btn-info"></span>
							<span class="btn btn-warning"></span>
							<span class="btn btn-danger"></span>
						</div>
					   </div>  <!-- #sidebar-shortcuts -->
					<ul class="nav nav-list" id="nav_list">
				     <li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath}/path/manager/home" class="iframeurl" title=""><i class="icon-dashboard"></i><span class="menu-text"> 系统首页 </span></a></li>
                     <!-- 后台权限 start-->
                     <c:forEach items="${sessionScope.funsList }" var="funs">
						<li><a href="#" class="dropdown-toggle"><i
							class="${funs.funTarget }"></i><span class="menu-text">${funs.funName }</span><b
							class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<c:forEach items="${funs.fundsList }" var="fun">
									<li class="home"><a href="javascript:void(0)"
									name="${pageContext.request.contextPath}/${fun.funUrl }"
									title="${fun.funName }" class="iframeurl"><i
										class="icon-double-angle-right"></i>${fun.funName }</a>
								</li>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
                     <%-- <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text"> 产品管理 </span><b class="arrow icon-angle-down"></b></a>
					   <ul class="submenu">
                         <li class="home"><a  href="javascript:void(0)" name="${pageContext.request.contextPath}/goodsBack/findAll"  title="产品类表" class="iframeurl"><i class="icon-double-angle-right"></i>产品类表</a></li>
						 <!-- <li class="home"><a  href="javascript:void(0)" name="admin/Brand_Manage.jsp" title="品牌管理"  class="iframeurl"><i class="icon-double-angle-right"></i>品牌管理</a></li> -->
						 <li class="home"><a  href="javascript:void(0)" name="${pageContext.request.contextPath}/path/manager/product-category-add" title="分类管理"  class="iframeurl"><i class="icon-double-angle-right"></i>分类管理</a></li>
						</ul>
					</li>
					<li>
					<a href="#" class="dropdown-toggle"><i class="icon-picture "></i><span class="menu-text"> 图片管理 </span><b class="arrow icon-angle-down"></b></a>
						<ul class="submenu">
						<li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath}/AdsController/findAllAds" title="广告管理" class="iframeurl"><i class="icon-double-angle-right"></i>广告管理</a></li>
						<!-- <li class="home"><a href="javascript:void(0)" name="admin/Sort_ads.jsp" title="分类管理"  class="iframeurl"><i class="icon-double-angle-right"></i>分类管理</a></li> -->
							</ul>
						</li>
					<li>
					<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 交易管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                    <li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath}/businessMsg/getBusinessMsgTop"  title="交易信息"  class="iframeurl"><i class="icon-double-angle-right"></i>交易信息</a></li>
                    <li class="home"><a href="javascript:void(0)" name="${pageContext.request.contextPath}/businessMsg/getDetailMsg" title="订单管理"  class="iframeurl"><i class="icon-double-angle-right"></i>订单管理</a></li>
                   </ul>
				  </li>
                  <li>
					<a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 会员管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                    <li class="home"><a href="javascript:void(0)" name="admin/FindAllUser.do" title="会员列表"  class="iframeurl"><i class="icon-double-angle-right"></i>会员列表</a></li>
                    <li class="home"><a href="javascript:void(0)" name="admin/member-Grading.jsp" title="等级管理"  class="iframeurl"><i class="icon-double-angle-right"></i>等级管理</a></li>
                    <li class="home"><a href="javascript:void(0)" name="admin/integration.jsp" title="会员记录管理"  class="iframeurl"><i class="icon-double-angle-right"></i>会员记录管理</a></li>

                   </ul>
				  </li>
						<li><a href="#" class="dropdown-toggle"><i class="icon-edit"></i><span class="menu-text"> 消息管理 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)" name="admin/findGuest.do?flag=findAll" title="留言列表" class="iframeurl"><i class="icon-double-angle-right"></i>留言列表</a></li>
                                <!-- <li class="home"><a href="javascript:void(0)" name="admin/Feedback.jsp" title="意见反馈" class="iframeurl"><i class="icon-double-angle-right"></i>意见反馈</a></li> -->
							</ul>
						</li>
						<!-- <li><a href="#" class="dropdown-toggle"><i class="icon-edit"></i><span class="menu-text"> 文章管理 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)" name="admin/Guestbook.jsp" title="文章列表" class="iframeurl"><i class="icon-double-angle-right"></i>文章列表</a></li>
                                <li class="home"><a href="javascript:void(0)" name="admin/Feedback.jsp" title="分类分类" class="iframeurl"><i class="icon-double-angle-right"></i>分类分类</a></li>
							</ul>
						</li> -->
                        	<li><a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span class="menu-text"> 系统管理 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:void(0)" name="admin/Systems.jsp" title="系统设置" class="iframeurl"><i class="icon-double-angle-right"></i>系统设置</a></li>
							
							</ul>
						</li>
                        <li><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span class="menu-text"> 管理员管理 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
							
								<li class="home"><a href="javascript:void(0)" name="admin/admin_Competence.jsp" title="权限管理"  class="iframeurl"><i class="icon-double-angle-right"></i>权限管理</a></li>
                                <li class="home"><a href="javascript:void(0)" name="admin/findAllAdmin.do" title="管理员列表" class="iframeurl"><i class="icon-double-angle-right"></i>管理员列表</a></li>
								  <li class="home"><a href="javascript:void(0)" name="admin/findAllLog.do" title="个人信息" class="iframeurl"><i class="icon-double-angle-right"></i>个人信息</a></li>
							</ul>
						</li> --%>
					</ul>
					<!-- 权限end -->
					
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
                    <script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
				<div class="main-content">
                <script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li style="height:40px;line-height:40px;">
								<i class="icon-home home-icon"></i>
								<a href="admin/index.jsp">首页</a>
							</li>
							<li class="active"><span class="Current_page iframeurl"></span></li>
                            <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
							<li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
						</ul>
					</div>
                    
                 <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;"name="iframe" frameborder="0" src="${pageContext.request.contextPath }/path/manager/home">  </iframe>
				 

<!-- /.page-content -->
				</div><!-- /.main-content -->	
                
                  <div class="ace-settings-container" id="ace-settings-container">
                      <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                          <i class="icon-cog bigger-150"></i>
                      </div>
  
                      <div class="ace-settings-box" id="ace-settings-box">
                          <div>
                              <div class="pull-left">
                                  <select id="skin-colorpicker" class="hide">
                                      <option data-skin="default" value="#438EB9">#438EB9</option>
                                      <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                      <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                      <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                  </select>
                              </div>
                              <span>&nbsp; 选择皮肤</span>
                          </div>
  
                          <div>
                              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                              <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                          </div>
  
                          <div>
                              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                              <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                          </div>
  
                          <div>
                              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                              <label class="lbl" for="ace-settings-add-container">
                                  切换窄屏
                                  <b></b>
                              </label>
                          </div>
                      </div>
                  </div><!-- /#ace-settings-container -->		
	</div><!-- /.main-container-inner -->
			
		</div>
		<!-- -------------------------------------- -->
		<div id="chatWindow" style="display: none">
					<div class="top">
						<span class="">客服</span>
					</div>
					<div class="content">
						<select multiple="multiple" id="rightContent">

						</select>
					</div>
					<div class="send">
						<input type="text" id="rightText" class="sText"/>
						<input type="button" id="rightSendBtn" class="btn" value="发送" onclick="send()"/>
					</div>
				</div>
			</div>
		
		<!--  -->
         <!--底部样式-->
       
         <div class="footer_style" id="footerstyle">  
          <p class="l_f">版权所有：于建铜  京ICP备11011739号</p>
          <p class="r_f">地址：北京市丰台区  邮编：666666</p>
         </div>
         <!--修改密码样式-->
         <div class="change_Pass_style" id="change_Pass">
            <ul class="xg_style">
             <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
             <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
             <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
              
            </ul>
     <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
         </div>
        <!-- /.main-container -->
		<!-- basic scripts -->
<!-- ajax轮询数据库查找新订单 -->
<script type="text/javascript">

    setInterval("searchAll()",10000);
	function searchAll(){
		var orderSize=$("#hiddenorder").prop("value");
		//alert(orderSize);
		$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/businessMsg/getOrderSize?orderSize="+orderSize,
		   success: function(msg){
		     $("#hiddenorder").prop("value",msg);
		     $("#newOrder").html(msg-orderSize);
		     $("#outNew").html(msg-orderSize);
		     $("#newAdvice").html(msg-orderSize);
		   }
		});
	}
</script>		
</body>
</html>


