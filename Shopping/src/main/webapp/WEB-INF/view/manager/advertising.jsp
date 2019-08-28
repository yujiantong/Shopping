<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>广告管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>   
        <script src="js/lrtk.js" type="text/javascript" ></script>		
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
		<link href="css/upfile_common.css" type="text/css" rel="stylesheet"/>
		<link href="css/upfile_index.css" type="text/css" rel="stylesheet"/>
		<script src="js/upfile_jquery.js"></script>
		<script src="js/imgUp.js"></script>	
		
		<script type="text/javascript">
//复选框
    $(function(){
          $("#allChk").click(function(){
             var value=$(this).prop("checked");
             $("input[name='adsIds']").prop("checked", value);
          });   
          $("input[name='adsIds']").click(function(){
             var value=$(this).prop("checked");
             if(value==false)
                  $("#allChk").prop("checked", false);
          });    
      });
//状态选择
$(function(){
          $("#state1").click(function(){
             $("#state2").prop("checked",false);
          });   
          $("#state2").click(function(){
            $("#state1").prop("checked", false);
          });    
      });

</script>
</head>

<body>

<form name="myforms" action="" method="post"  enctype="multipart/form-data">

<div class=" clearfix" id="advertising">
   <div id="scrollsidebar" class="left_Treeview">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="widget-box side_content" >
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
     <div class="side_list">
      <div class="widget-header header-color-green2">
          <h4 class="lighter smaller">广告图分类</h4>
      </div>
      <div class="widget-body">
         <ul class="b_P_Sort_list">
             <li><i class="orange  fa fa-user-secret"></i><a href="javascript:void(0)">全部</a></li>
             <li><i class="fa fa-image pink "></i> <a href="javascript:void(0)">轮播图</a></li>
             <li> <i class="fa fa-image pink "></i> <a href="javascript:void(0)">幻灯片</a> </li>
             <li> <i class="fa fa-image pink "></i> <a href="javascript:void(0)">其他</a></li>
         </ul>
  </div> 
  </div>
  </div>  
  </div>
  
  <div class="Ads_list">
   <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="ads_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加广告</a>
        <a href="javascript:ovid()" onclick="deleteAllAds()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
       <span class="r_f">共：<b>45</b>条广告</span>
     </div>
     <div class="Ads_lists">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input id="allChk" type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="30">ID</th>
				<th width="100">分类</th>
				<th width="220px">图片</th>
				<th width="150px">尺寸（大小）</th>
				<!-- <th width="250px">链接地址</th> -->
				<th width="160">加入时间</th>
				<th width="70">状态</th>                
				<th width="220">操作</th>
			</tr>
		</thead>
	<tbody>
	      <c:forEach items="${requestScope.adsList}" var="ads">
		      <tr>
		       <td><label><input id="adsIds" name="adsIds" value="${ads.adsId}" type="checkbox" class="ace"><span class="lbl"></span></label></td>
		       <td>${ads.adsId}</td>
		       <td>${ads.adsType}</td>
		       <td><span class="ad_img"><img src="image/${ads.adsImg}"  width="100%" height="100%"/></span></td>
		       <td>${ads.adsSize}</td>
		      <!--  <td><a href="" target="_blank">http://item.jd.com/10443270082.html</a></td> -->
		       <td><fmt:formatDate value="${ads.adsBegaintime}"/></td>
		       <td class="td-status"><span class="label label-success radius" id="statu${ads.adsId}">${ads.adsState.statuName}</span></td>
		      <td class="td-manage">
		        <a onClick="start(3,${ads.adsId})"  href="javascript:void(0);" title="启用"  class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>   
		        <a title="停用" onclick="stop(4,${ads.adsId})" href="javascript:void(0);"  class="btn btn-xs" ><i class="fa fa-close bigger-120"></i></a>      
		        <a title="删除" href="javascript:void(0);"  onclick="member_del(this,'1',${ads.adsId})" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
		       </td>
		      </tr>
		   </c:forEach>   
    </tbody>
    </table>
     </div>
 </div>
</div>
<!--添加广告样式-->
<div id="add_ads_style"  style="display:none">
 <div class="add_adverts">
 <ul style="height:450px;">
  <li>
  <label class="label_name">所属分类</label>
  <span class="cont_style">
  <select name="adsType" class="form-control" id="adsType">
    <option value="">选择分类</option>
    <option value="轮播图">轮播图</option>
    <option value="幻灯片">幻灯片</option>
    <option value="其他">其他</option>
 </select></span>
  </li>
  <li>
  <label class="label_name">图片尺寸</label>
  <div style="margin-left:90px;">
  <select name="adsSize" id="adsSize" placeholder="请选择图片像素" class="col-xs-10 col-sm-5" style="width:220px">
       <option value="">请选择图片像素</option>
       <option value="1890x1080像素">1890x1080像素</option>
       <option value="1900x1100像素">1900x1100像素</option>
  </select></div>
  
  </li>
  <li><label class="label_name">链接地址</label><span class="cont_style"><input name="adsPath" type="text" id="adsPath" placeholder="地址" class="col-xs-10 col-sm-5" style="width:450px"></span></li>
  <li><label class="label_name">状&nbsp;&nbsp;态：</label>
   <span class="cont_style">
     &nbsp;&nbsp;<label><input id="state1" value="3" name="adsState.statuId" type="radio" checked="checked"  class="ace"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;
     <label><input id="state2" value="4" name="adsState.statuId" type="radio" class="ace"><span class="lbl">隐藏</span></label></span><div class="prompt r_f"></div>
     </li>
     <li><label class="label_name">图片：</label>
     <span class="cont_style">
          <div class="demo">
	        <!-- <div class="logobox"><div class="resizebox"><img src="images/image.png" width="100px" alt="" height="100px"/></div></div> -->
	         <div class="z_photo upimg-div clear" style="width:600px; height:210px;">
				 <section class="z_file fl">
					<img src="img/a11.png" class="add-img">
					<input type="file" name="adsimg" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
				 </section>
		      </div>
           </div>
       </span>
  </li>
  <li> <div class="prompt" style="float:right;color:red;"><p>图片大小小于5MB,支持.jpg;.gif;.png;.jpeg格式的图片</p></div></li>
     <li>
        <div style="margin-left:250px;">
	    <div style="width:80px;height:40px; float:left;"><a href="javascript:void(0)" onclick="saveAds()"><img alt="" src="images/tijiaoads.png"></a></div>
	    <div style="margin-top:2px;width:78px;height:40px;float:left;"><a href="${pageContext.request.contextPath}/AdsController/findAllAds"><img alt="" src="images/quxiaoads.png"></a></div>
        </div>
     </li>
 </ul>
      
 <div> 
   
 </div>
 </div>
</div>
</form>
</body>
</html>
<script>
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
 $(".Ads_list").width($(window).width()-220);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".Ads_list").width($(window).width()-220);
	});
	$(function() { 
	$("#advertising").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		stylewidth:'220',
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		set_scrollsidebar:'.Ads_style',
		table_menu:'.Ads_list'
	});
});
/*广告图片-停用启用*/
function start(statuId,adsId){
    $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/AdsController/updateAdsState?statuId="+statuId+"&adsId="+adsId,
                    data:"json",
                    success: function(msg){
                       document.getElementById("statu"+adsId).innerHTML="启用";
                       layer.msg('已经启用!',{icon:1,time:2000});
                    }
                });
             }
function stop(statuId,adsId){
    $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/AdsController/updateAdsState?statuId="+statuId+"&adsId="+adsId,
                    data:"json",
                    success: function(msg){
                       document.getElementById("statu"+adsId).innerHTML="停用";
                       layer.msg('已经停用!',{icon:2,time:2000});
                    }
                });
            }

/* function member_stop(obj,id){
	layer.confirm('确认要关闭吗？',{icon:0,},function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="显示"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").jsp('<span class="label label-defaunt radius">已关闭</span>');
		$(obj).remove();
		layer.msg('关闭!',{icon: 5,time:1000});
	});
}
/*广告图片-启用*/
/* function member_start(obj,id){
	layer.confirm('确认要显示吗？',{icon:0,},function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="关闭"><i class="fa fa-check  bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").jsp('<span class="label label-success radius">显示</span>');
		$(obj).remove();
		layer.msg('显示!',{icon: 6,time:1000});
	});
} */
/*广告图片-删除*/
function member_del(obj,id,adsId){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
	$.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/AdsController/delete?adsId="+adsId,
                    data:"json",
                    success: function(msg){
                       $(obj).parents("tr").remove();
                       layer.msg('已删除!',{icon:1,time:2000});
                    }
                });
	});
}

/* 批量删除 */
function deleteAllAds(){
          //if($("input[name='adsIds']").prop("checked", false)){
               //layer.msg('请选择要删除的广告!',{icon:0,time:2000});   
          //}else{
			   layer.confirm('确认要删除吗？',{icon:0,},function(index){
			        document.myforms.action="${pageContext.request.contextPath}/AdsController/deleteAllAds.html";
                    document.myforms.submit();
					layer.msg('已删除!',{icon:1,time:2000});
				});
			}
		//}	
/*******添加广告*********/
					function saveAds(){
					            var adsPath=$("#adsPath").val();
							    var adsType =$("#adsType").val();
							    var adsSize =$("#adsSize").val(); 
							    var file =$("#file").val(); 
							    if(adsPath==""||adsType==""||adsSize==""||file==""){
							      layer.msg('您输入的信息不完整！',{icon:2,time:2000});
							      }
							     else{ 
							      document.myform.action="${pageContext.request.contextPath}/AdsController/saveAds";
							      document.myform.submit();
							      layer.alert('添加成功！');
							   }
						}	   
					

  $('#ads_add').on('click', function(){
	  layer.open({
        type: 1,
        title: '添加广告',
		maxmin: true, 
		shadeClose: false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_ads_style'),
		/* btn:['提交','取消'], */
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_adverts input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert("信息不全！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
      });
})
</script>
<script type="text/javascript">
function updateProgress(file) {
	$('.progress-box .progress-bar > div').css('width', parseInt(file.percentUploaded) + '%');
	$('.progress-box .progress-num > b').jsp(SWFUpload.speed.formatPercent(file.percentUploaded));
	if(parseInt(file.percentUploaded) == 100) {
		// 如果上传完成了
		$('.progress-box').hide();
	}
}

function initProgress() {
	$('.progress-box').show();
	$('.progress-box .progress-bar > div').css('width', '0%');
	$('.progress-box .progress-num > b').jsp('0%');
}

function successAction(fileInfo) {
	var up_path = fileInfo.path;
	var up_width = fileInfo.width;
	var up_height = fileInfo.height;
	var _up_width,_up_height;
	if(up_width > 120) {
		_up_width = 120;
		_up_height = _up_width*up_height/up_width;
	}
	$(".logobox .resizebox").css({width: _up_width, height: _up_height});
	$(".logobox .resizebox > img").attr('src', up_path);
	$(".logobox .resizebox > img").attr('width', _up_width);
	$(".logobox .resizebox > img").attr('height', _up_height);
}


</script>
<script>
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
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
			})
</script>

