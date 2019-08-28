<%@page import="com.web.entity.Goods"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" /> 
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>       
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
       <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
	    <script src="js/jquery-1.9.1.min.js"></script>  
	    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
	    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="js/H-ui.js"></script> 
        <script type="text/javascript" src="js/H-ui.admin.js"></script> 
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script type="text/javascript" src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script> 
        <script src="js/lrtk.js" type="text/javascript" ></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>
        <script type="text/javascript" src="js/jquery.lazyload.min.js"></script>
<title>产品列表</title>
  </head>
  
  <body>
  <script type="text/javascript">
   function search(){
     document.myform.action="${pageContext.request.contextPath}/goodsBack/findAll" ;
     document.myform.submit(); 
     
     document.getElementById("name1").value=""; 
     document.getElementById("start").value="";
   }
   function myClear(){
        document.getElementById("name1").value="";
        document.getElementById("start").value="";
   }
   
   $(function(){
          $("#allChk").click(function(){
             var value=$(this).prop("checked");
             $("input[name='goodsId']").prop("checked", value);
          });   
          $("input[name='goodsId']").click(function(){
             var value=$(this).prop("checked");
             if(value==false)
                  $("#allChk").prop("checked", false);
          });    
      });
      //图片懒加载
    $(function() {
          $("img").lazyload({ 
		  		placeholder : "image/loading.gif",
                effect: "fadeIn",
                container: $("#testIframe")
           });  
      });
  </script>
<form action="" method="post" name="myform">  
<div class=" page-content clearfix">
 <div id="products_style">
    <div class="search_style">
      <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">产品名称</label><input id="name1" name="goodsName" type="text"  class="text_add"   style=" width:250px" value=""/></li>
       <li><label class="l_f">添加时间</label><input value="" name="goodsDate" class="inline laydate-icon"  id="start" style=" margin-left:10px;"/></li>
       <li style="width:90px;"><button type="button" class="btn_search" onclick="search()" ><i class="icon-search" ></i>查询</button></li>
       <li style="width:90px;"><button type="button" class="btn_search" onclick="myClear()" ><i class="icon-search" ></i>清空</button></li>
      </ul>
    </div>
    
     <div class="border clearfix">
       <span class="l_f">
        <a href="${pageContext.request.contextPath}/path/manager/picture-add" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
        <a href="javascript:ovid()" onclick="deleteAll()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
       </span>
       <span class="r_f">共：<b>${requestScope.goodsList.size()}</b>件商品</span>
     </div>
     <!--产品列表展示-->
     <div class="h_products_list clearfix" id="products_list">
       <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">产品类型列表</h4></div>
         <div class="widget-body">
          <div class="widget-main padding-8"><div id="treeDemo" class="ztree"></div></div>
          <ul class="b_P_Sort_list">
                <li><i class="orange  fa fa-reorder"></i><a href="javascript:void(0)">商品类型</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">母婴专区</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">美妆护肤</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">家居生活</a></li>
         		<li><i class="fa fa-sticky-note pink "></i> <a href="javascript:void(0)">食品营养</a></li>
              </ul>
        </div>
       </div>
      </div>  
     </div>
         <div class="table_menu_list" id="testIframe">
      
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input id="allChk" type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="60px">序号</th>
				<th width="60px">商品ID</th>
				<th width="200px">商品名称</th>
				<th width="100px">商品图片</th>
				<th width="100px">商品价格</th>
				<th width="100px">商品数量</th>
                <th width="100px">所属地区/国家</th>				
				<th width="180px">加入时间</th>
				<th width="70px">状态</th>             
				<th width="220px">操作</th>
			</tr>
		</thead>
	<tbody>
	
       <c:forEach items="${requestScope.goodsList}" var="good" varStatus="statu">
        <tr>
        <td width="25px"><label><input name="goodsId" type="checkbox" value="${good.goodsId}" class="ace" ><span class="lbl"></span></label></td>
        <td width="60px">${statu.count}</td> 
        <td width="60px">${good.goodsId}</td> 
        <td width="200px"><u style="cursor:pointer;font-size:12px;" class="text-primary" >${good.goodsName}</u></td>
         <td width="100px">
          <img width="50px" height="50px" src="image/loading.gif" alt="" data-original="upImgs/${good.goodsImg}">
         </td> 
        <td width="100px">${good.goodsPrice}</td>
        <c:choose>
           <c:when test="${good.goodsNum<=good.goodsWarnnum}">
               <td width="100px" style="background-color: rgb(283,152,123);">${good.goodsNum}</td>
           </c:when>
           <c:otherwise>
               <td width="100px">${good.goodsNum}</td>
           </c:otherwise>
        </c:choose>  
        
        <td width="100px">${good.goodsFromaddress}</td>         
        <td width="180px"><fmt:formatDate value="${good.goodsDate}" pattern="yyyy-MM-dd"/>
        </td>
        <td class="td-status"><span id="statu${good.goodsId}" class="label label-success radius">${good.goodsState.statuName}</span></td>
        <td class="td-manage">
        <a title="上架" onclick="updateGoodshang(1,${good.goodsId})" href="javascript:void(0);"  class="btn btn-xs btn-info" ><i class="icon-ok bigger-120"></i></a> 
        <a title="下架" onclick="updateGoodxiajia(2,${good.goodsId})" href="javascript:void(0);"  class="btn btn-xs" ><i class="icon-remove bigger-120"></i></a> 
        <div style="height:2px;width:4px;"></div>
        <a title="编辑" onclick="member_edit(${good.goodsId})" href="javascript:void(0);"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
        <a title="删除" href="javascript:void(0);"  onclick="member_del(this,'1',${good.goodsId})" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
      </td>
	  </tr>
	  <script type="text/javascript">
	  
	        /*产品-编辑*/
				function member_edit(goodsId){
				       document.myform.action="${pageContext.request.contextPath}/goodsBack/findByIdGoods?goodsId="+goodsId;
				       document.myform.submit();
					/* layer.open({
					    type: 2,//（1是返回字符串，2是jsp）
						area: ['1000px','500px'],//（弹出来的框的面积）
						shadeClose: true,
						content: ',
			 		 })	; */
				} 
	  
             function updateGoodshang(statuId,goodsId){
             $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/goodsBack/updateStatu?statuId="+statuId+"&goodsId="+goodsId,
                    data:"json",
                    success: function(msg){
                       document.getElementById("statu"+goodsId).innerHTML="上架";
                       layer.msg('商品已上架!',{icon:1,time:2000});
                    }
                  });
                 }
			  function updateGoodxiajia(statuId,goodsId){
			             $.ajax({
			                    type:"post",
			                    url:"${pageContext.request.contextPath}/goodsBack/updateStatu?statuId="+statuId+"&goodsId="+goodsId,
			                    data:"json",
			                    success: function(msg){
			                       document.getElementById("statu"+goodsId).innerHTML="下架";
			                       layer.msg('商品已下架!',{icon:2,time:2000});
			                    }
			                       });
			                 }
 </script>
       
       </c:forEach>
    </tbody>
    </table>
       </div>     
  </div>
 </div>
</div>
 
</form>
</body>
</html>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});
 laydate({
    elem: '#start',
    event: 'focus' 
});
$(function() { 
	$("#products_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:260,//设置显示时间距
	});
});
</script>
<script type="text/javascript">
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 
/*******树状图*******/
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				demoIframe.attr("src",treeNode.file + ".jsp");
				return true;
			}
		}
	}
};

var zNodes =[
	 { id:1, pId:0, name:"商城分类列表", open:true},
      { id:11, pId:1, name:"服装服饰"},
      { id:111, pId:11, name:"女装"},
      { id:112, pId:11, name:"男装"},
      { id:113, pId:11, name:"童装"},
      { id:114, pId:11, name:"晚会礼服"},
      { id:115, pId:11, name:"休闲装"},
      { id:116, pId:11, name:"睡衣"},
      { id:117, pId:11, name:"T恤衬衫"},
       { id:118, pId:11, name:"内衣服饰"},

      { id:12, pId:1, name:"个人护理"},
      { id:121, pId:12, name:"珠宝首饰"},
      { id:122, pId:12, name:"手表"},
      { id:123, pId:12, name:"彩妆"},
      { id:124, pId:12, name:"香氛"},
      { id:125, pId:12, name:"护发"},
      { id:126, pId:12, name:"鞋类"},
      { id:127, pId:12, name:"手包"},
      { id:128, pId:12, name:"护肤"},
];
		
var code;
		
function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#testIframe");
	demoIframe.bind("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.selectNode(zTree.getNodeByParam("id",'11'));
});	
/*产品-停用*/
function member_stop(obj,id){
	/* layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	} );*/
}

/*产品-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}

/*产品-删除*/
function member_del(obj,id,goodsId){
layer.confirm('确认要删除吗？',{icon:0,},function(index){
	$.ajax({
			   type:"post",
			   url:"${pageContext.request.contextPath}/goodsBack/delete?goodsId="+goodsId,
			   data:"json",
			   success: function(msg){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:2000});
			     }
			});
        });
}
/* 批量删除 */
function deleteAll(){
			   layer.confirm('确认要删除吗？',{icon:0,},function(index){
			        document.myform.action="${pageContext.request.contextPath}/goodsBack/deleteAll";
                    document.myform.submit();
                    layer.msg('正在删除!请等待...', {icon: 16,shade: 0.01});
				});
			}
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').jsp();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').jsp(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').jsp("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>
