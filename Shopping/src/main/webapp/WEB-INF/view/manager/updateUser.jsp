<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>resources/">
    
    <title>My JSP 'updateUser.jsp' starting page</title>
    
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style3.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<script src="assets/js/jquery.min.js"></script> 
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="js/H-ui.js"></script> 
        <script type="text/javascript" src="js/H-ui.admin.js"></script> 
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script> 

  </head>
  
  <body>
    <div class="add_menber" id="add_menber_style">
		  <form  action="${pageContext.request.contextPath}/UserBackController/updateUser" method="post" id="form-admin-add" name="myform">
		    <ul class=" page-content">
		     <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="${requestScope.user.userName}" name="userName" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
		     <li><label class="label_name">固定电话：</label><span class="add_name"><input value="${requestScope.user.userPhone}" name="userPhone" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
		     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input value="${requestScope.user.userEmail}" name="userEmail" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
		     <li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input value="${requestScope.user.userAddress}" name="userAddress" type="text"  class="text_add" style=" width:350px"/></span><div class="prompt r_f"></div></li>
		     <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
		     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
		     <label><input name="form-field-radio1"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
		   <li><div><input class="btn btn-primary radius" type="submit" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;"></input>
			<a href="" onclick="member_edit()">
			<input class="btn btn-primary radius" type="button" id="Add_Administrator" value="&nbsp;&nbsp;取消&nbsp;&nbsp;"></input>
								</a>
							</div>
						</li>
		    </ul>
		    </form>
		 </div>
		 <script>
		 
		 
		 function member_edit(){
	  layer.open({
        type: 1,
        title: '修改用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , '400px'],
        content:'${pageContext.request.contextPath}/UserBackController/findAllUser',
        end:function(){//回调函数
					window.location.reload(); 
					}
        
		/* btn:['提交','取消'], */
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
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
}
</script>
  </body>
</html>
