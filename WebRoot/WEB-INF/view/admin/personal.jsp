<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>manage-personal</title>
		<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
   		<script src="js/jquery-3.0.0.min.js"></script>
   		<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
   		<script src="js/Formtext.js"></script>
   		<style type="text/css">
  		 	.rs-content{margin-top: 80px;width: 500px;}
			.rs-font{font-size: 16px;}
   		</style>
	</head>
	<body>
		<div class="rs-content center-block">
			<table class="table table-striped table-bordered table-hover text-center rs-font">
				<thead>
					<tr class="info">
						<td colspan="2" class="text-left">个人信息</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>账号：</td>
						<td>${bean.account }</td>
					</tr>
					<tr>
						<td>名称：</td>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<td>角色：</td>
						<td>${bean.role.name }</td>
					</tr>
					<tr>
						<td>电话：</td>
						<td>${bean.phone }</td>
					</tr>
					<tr>
						<td>备注：</td>
						<td>${bean.info }</td>
					</tr>
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><button class="btn btn-info" type="submit" data-toggle="modal" data-target="#myModal">修改</button></td>	
					</tr>
				</tfoot>
			</table>
			<s:actionmessage/>
			<s:actionerror/>
		</div>
			
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							修改权限
						</h4>
					</div>
				<div class="modal-body">
					<form action="admin_personalUpdate" class="form-horizontal" id="myform">
		 			  <div class="form-group">
					    	<label for="input1" class="col-xs-4 control-label text-right">账号：</label>
					    	<div class="col-xs-6">
					      	<input name="account" readonly value="${bean.account }" type="text" class="form-control" id="input1" placeholder="账号" data-vaild="^\d{5,20}$" data-errmsg="请填写正确，至少是6位的数字"/>
					    	</div>
					  </div>
					  <div class="form-group">
					    <label for="input0" class="col-xs-4 control-label text-right">名称：</label>
						    <div class="col-xs-6">
						      <input name="name" value="${bean.name }" <c:if test="${currentUser.role.value == '3' }">disabled</c:if> type="text" class="form-control" id="input0" placeholder="名称" data-errmsg="名称信息"/>
						    </div>
					  </div>
					  <div class="form-group">
					    <label for="input2" class="col-xs-4 control-label text-right">电话：</label>
						    <div class="col-xs-6">
						      <input name="phone" value="${bean.phone }" type="text" class="form-control" id="input2" placeholder="电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
						    </div>
					  </div>
					  <div class="form-group">
						 	<label for="password1" class="col-xs-4 control-label text-right">密码：</label>
							<div class="col-xs-6">
								<input name="pass0" type="password" class="form-control" id="password1" placeholder="请输入密码" data-vaild="^[a-zA-Z\d_]{6}$" data-errmsg="请输入6位密码"/>
							</div>
					  </div>
					  <div class="form-group">
						 	<label for="password" class="col-xs-4 control-label text-right">新密码：</label>
							<div class="col-xs-6">
								<input name="pass" type="password" class="form-control" id="password" name="password" placeholder="请输入新密码" data-vaild="^[a-zA-Z\d_]{6}$" data-errmsg="请输入6位密码"/>
							</div>
						</div>
						    
					  <div class="form-group">
						 	<label for="password_again" class="col-xs-4 control-label text-right">确认密码：</label>
							<div class="col-xs-6">
								<input name="pass1" type="password" class="form-control" id="password_again" name="password_again" placeholder="请输入确认密码"  data-errmsg="密码输入不一致"/>
							</div>
					  </div>
					  <div class="form-group">
						    <label for="input3" class="col-xs-4 control-label text-right">备注：</label>
						    <div class="col-xs-6">
						      <input name="info" value="${bean.info }" type="text" class="form-control" id="input3" placeholder="备注信息" data-vaild="^[\u4e00-\u9fa5]{1,36}$" data-errmsg="请填写备注，只能为中文">
						    </div>
					  </div>
					  <div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<input type="submit" class="btn btn-primary" value="提交更改">
						</div>
				   </form>
				</div>
						</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		<script type="text/javascript">
			   $("#password_again").on('blur',function(){
//		      	console.log($(this).val());
		      	var pas1=$('#password').val();
		      	var pas2=$('#password_again').val();
				if(pas1 == pas2){
					$(this).parent().removeClass('has-error').addClass('has-success');
					$(this).popover("destroy");
				}else{
					$(this).parent().removeClass('has-success').addClass('has-error');
					$(this).data("toogle", "top").data("placement", "top").data("container", "body").data("content", $(this).data("errmsg")).popover({"trigger":"manual"}).popover("show");
				}
		      });
              $("form").Vaild();
              setInterval(function(){
//          	if($('#myModal-1').css("display") == "block"||$('#myModal-2').css("display") == "block"||$('#myModal-3').css("display") == "block"){
				if($('#myModal').css("display") == "block"){
				return true;
				}else{
				   $('.popover').css('display','none');	
				   $('.modal-body .form-group').find("div").removeClass("has-error");
				   $('.modal-body .form-group').find("div").removeClass("has-success");
				}
				},100);
			$('.less').on('click',function(){
				$('.popover').css('display','none');
				$('.modal-body .form-group').find("div").removeClass("has-error");
				$('.modal-body .form-group').find("div").removeClass("has-success");
			});
			
			jQuery.validator.setDefaults({
			  debug: true,
			  success: "valid"});$( "#myform" ).validate({
			  rules: {
			    password: "required",
			    password_again: {
			      equalTo: "#password"
			    }
			  }});
		</script>
	</body>
</html>
