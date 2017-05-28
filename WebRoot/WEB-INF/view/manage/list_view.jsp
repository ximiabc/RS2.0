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
		<title>管理员管理</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="js/Formtext.js"></script>
		<style>
		    .rs-school-height{margin-top: 30px;padding-bottom:50px;}
		    .rs-school-btn{position: absolute;top: 30px;right: 20px;}
			.rs-school-spacing{margin:0 10px;}
			.rs-school-center{text-align: center;}
			.rs-school-space{width: 140px;margin: 0 auto;}
			.rs-school-nav{width: 400px;}
			.rs-people:hover{cursor: pointer;text-decoration: none;}
			.text{background-color: #00BBFF;}
			.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{line-height: 34px;}
			@media (max-width: 765px){.rs-school-btn{position:absolute;top:100px;}}
			/*重构 popover */
			.popover{border:1px solid #C00;color:#000;}
			.popover .popover-content{padding:1px 5px;}
			.popover.top>.arrow:after{border-top-color:#C00;}
		</style>
		</head>
	<body>
		<!--表单部分-->
		<div>
		<form class="form-inline rs-school-height">
			<!--表单查询及添加-->
			<div class="form-group col-lg-6 col-md-8 col-xs-8 col-sm-8 col-md-offset-4 col-sm-offset-2 col-xs-offset-4 col-lg-offset-6">
				<!--下拉选项框-->
				<select name="select_type" class="form-control col-md-2 col-sm-2 col-xs-2 rs-school-spacing">
					<option selected="selected" value="1">所有</option>
		    		<option value="2">账号</option>
		    		<option value="3">名称</option>
				</select>
			    <input type="text" class="form-control col-md-2 col-sm-2 col-xs-2 col-lg-2 col-xs-2 rs-school-spacing" placeholder="number">
			    <button type="submit" class="btn btn-default col-sm-2 col-md-2 col-xs-2 rs-school-spacing" style="">检索</button>
			    </div>
		</form>
		<button type="submit" class="btn btn-default rs-school-btn" data-toggle="modal" data-target="#myModal-1">增加学校</button>
		</div>
		<!--数据表格部分--> 
		<div class="table-responsive col-xs-12 col-md-12">
			<table class="table table-striped table-bordered table-hover table-condensed rs-school-center">
				<thead>
					<tr class="info">
						<td></td>
						<td>学校账号</td>
						<td>学校名称</td>
						<td>备注</td>
						<td>联系电话</td>
						<td>管理人</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="pageBean.recordList" status="indexs">
						<tr>
							<td>${indexs.index+1 }</td>
							<td>${account }</td>
							<td>${name }</td>
							<td>${info }</td>
							<td>${phone }</td>
							<td>${user.name }</td>
							<td>
								<div class="rs-school-space">
								<input class="btn btn-default" type="submit" value="删除">
								<button class="btn btn-default" type="submit" data-toggle="modal" data-target="#myModal-2">更改</button>
								</div>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<!-- Modal 1-->
		<div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">增加学校</h4>
		      </div>
		    <div class="modal-body">
		        <form class="form-horizontal">
					<div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">权限类型</label>
					    <div class="col-sm-6">
					      <select class="form-control">
						      	<option>校级管理</option>
					      </select>
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputText" class="col-sm-4 control-label">学校账户</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="inputText" placeholder="自动生成" disabled>
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputText" class="col-sm-4 control-label">登录密码</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" id="inputText" placeholder="自动生成" disabled>
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputText" class="col-sm-4 control-label">学校名称</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="inputText" placeholder="提交后无法修改，请认真核对！" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写学校名称，只能为中文"/>
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputText" class="col-sm-4 control-label">联系电话</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="inputText" placeholder="联系电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputText" class="col-sm-4 control-label">学校备注</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="inputText" placeholder="学校备注" data-vaild="^[\u4e00-\u9fa5]{2,36}$" data-errmsg="请填写学校备注，只能为中文"/>
					    </div>
					</div>
					<div class="modal-footer">
				        <input type="button" class="btn btn-default less" data-dismiss="modal" value="取消"/>
				        <input type="button" class="btn btn-primary less" value="修改信息"/>
				    </div>
                </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Modal 2-->
		<div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">更改学校信息</h4>
				    </div>
				    <div class="modal-body">
				       <form class="form-horizontal">
							<div class="form-group">
							    <label for="inputText" class="col-sm-4 control-label">学校账号</label>
							    <label for="inputText" class="col-sm-4 control-label">100145gdsgdg48</label>
							    <!--<div class="col-sm-6">
							      <input type="password" class="form-control" id="inputText" placeholder="自动生成！" disabled>
							    </div>-->
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-sm-4 control-label">学校名称</label>
							    <label for="inputText" class="col-sm-4 control-label">正清大对我国的</label>
							    <!--<div class="col-sm-6">
							      <input type="password" class="form-control" id="inputText" placeholder="已提交，无法更改！" disabled>
							    </div>-->
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-sm-4 control-label">联系电话</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="inputText" placeholder="联系电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-sm-4 control-label">相关备注</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="inputText" placeholder="学校备注" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写学校备注，只能为中文"/>
							    </div>
							</div>
							<div class="modal-footer">
						        <input type="button" class="btn btn-default less" data-dismiss="modal" value="取消"/>
						        <input type="button" class="btn btn-primary less" value="确认更改"/>
						    </div>
		                </form>
				    </div>
			    </div>
			</div>
		</div>
		<!-- Modal 3-->
		<div class="modal fade" id="myModal-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">更改学生人数</h4>
				    </div>
				    <div class="modal-body">
				        <form class="form-horizontal">
							<div class="form-group">
							    <label for="inputText" class="col-sm-4 control-label">更改人数</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="inputText" placeholder="输入实际人数，认真核查！" data-vaild="/^[0-9]*$" data-errmsg="数字格式错误，只能填数字" >
							    </div>
							</div>
							<div class="modal-footer">
						        <button type="button" class="btn btn-default less" data-dismiss="modal">取消</button>
						        <button type="button" class="btn btn-primary less">确认更改</button>
						   </div>
						</form>
				    </div>
			    </div>
			</div>
		</div>
		<script type="text/javascript">
              $("form").Vaild();
              //	清除提示
            	setInterval(function(){
            	if($('#myModal-1').css("display") == "block" || $('#myModal-2').css("display") == "block" || $('#myModal-3').css("display") == "block"){
					return true;
				}else{
				   posclear();
				}
				},100);
			
			$('.less').on('click',function(){
				posclear();
			});
			
			function posclear(){
				$('.popover').css('display','none');
				$('.modal-body .form-group').find("div").removeClass("has-error");
				$('.modal-body .form-group').find("div").removeClass("has-success");
			}
		</script>
		<!--分页-->
		<div class="rs-school-nav center-block">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a href="#" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
			    <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			     <li><a href="#" aria-label="Previous"><span aria-hidden="true">尾页</span></a></li>
			  </ul>
			</nav>
		</div>
	</body>
</html>
