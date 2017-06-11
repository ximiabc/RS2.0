<%@page import="com.zqrc.rs.until.PageBean"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
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
		<title>学校管理</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="js/Formtext.js"></script>
		<style>
		    .rs-school-height{margin-top: 30px;padding-bottom:20px;}
		    .rs-people:hover{text-decoration: none;cursor: pointer;}
			.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{line-height: 34px;}
			.form-horizontal .rs-text{text-align: left;}
			/*@media (max-width: 765px){.rs-school-btn{position:absolute;top:100px;}}*/
			/*重构 popover */
			.popover{border:1px solid #C00;color:#000;}
			.popover .popover-content{padding:1px 5px;}
			.popover.top>.arrow:after{border-top-color:#C00;}
			.form-inline .form-control {
			    display: inline-block;
			    width: auto;
			    vertical-align: middle;
			}
		</style>
		</head>
	<body>
		<!--表单部分-->
		<div class="container-fluid">
			<!--表单查询及添加-->
			<div class="rs-school-height row">
				<div class="col-xs-2">
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-1">增加学校</button>
				</div>
				<div class="col-xs-offset-1 col-xs-9 clearfix">
					<form class="form-inline pull-right">
						<select name="select_type" class="form-control col-md-2 col-sm-2 col-xs-2 rs-school-spacing">
							<option selected="selected" value="1">关联学校</option>
							<option value="4">所有学校</option>
				    		<option value="2">学校账号</option>
				    		<option value="3">学校名称</option>
				    		<option value="5">所有小学</option>
				    		<option value="6">所有中学</option>
						</select>
					    <input name="values" type="text" class="form-control" placeholder="查询参数">
					    <button type="submit" class="form-control">检索</button>	
				    </form>
				</div>
			</div>
		<!--数据表格部分-->
			<table class="table table-striped table-bordered table-hover table-condensed text-center">
					<thead>
						<tr class="info">
							<td></td>
							<td>学校账号</td>
							<td>学校名称</td>
							<td>描述</td>
							<td>联系电话</td>
							<td>实际招生</td>
							<td>计划招生</td>
							<td>备注</td>
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
								<td>${belongSchool.size() }</td>
								<td>${num }</td>
								<td>${user.name }</td>
								<td>
									<div class="rs-school-space">
									<a href="admin_schoolDel?id=${id }" onclick="return confirm('确定删除该学校吗？')" class="btn btn-default">删除</a>
									<button id="n${id }" class="btn btn-default rs-modalBtn" type="button">更改</button>
									</div>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
		<!--分页开始-->
			<div class="clearfix">
				<span style="font-size:16px;">共<i><s:property value="pageBean.pageCount" /></i>页，<i>
				 <s:property value="pageBean.recordCount" /></i>条记录， 当前显示第<i>
					<s:if test="pageBean.currentPage == 0">
						1
					</s:if>
					<s:else>
						<s:property value="pageBean.currentPage" />
					</s:else>
					</i>页</span>
				<s:set name="uri" value="admin_schoolList"></s:set>
				<div class="pull-right">
				<ul class="pagination pull-right">
					<!-- 首页键 -->
				  	<li>
				  		<s:if test="pageBean.pageCount <= 1">
							<a aria-label="Previous">
					     		<span aria-hidden="true">首页</span>
					     	</a>
						</s:if>
						<s:else>
					  		<a href="${uri }?pageNum=1" aria-label="Previous">
					  			<span aria-hidden="true">首页</span>
					  		</a>
				  		</s:else>
				  	</li>
				  	<!-- 上页键 -->
				    <li>
				    	<s:if test="pageBean.currentPage-1 > 0">
					    	<a href="${uri }?pageNum=${pageBean.currentPage-1 }" href="#" aria-label="Previous">
					    		<span aria-hidden="true">&laquo;</span>
					    	</a>
				    	</s:if>
				    	<s:else>
					  		<a aria-label="Previous">
					  			<span aria-hidden="true">&laquo;</span>
					  		</a>
				  		</s:else>
				    </li>
				    <!-- 分页键 -->
				    <s:iterator begin="pageBean.beginPageIndex" end="pageBean.endPageIndex" var="pageNums">
				    	<c:if test="${pageBean.currentPage == pageNums }">
				    		<li><a>${pageNums }</a></li>
				    	</c:if>
				    	<c:if test="${pageBean.currentPage != pageNums }">
				    		<li><a href="${uri }?pageNum=${pageNums }">${pageNums }</a></li>
				    	</c:if>
				    </s:iterator>
					<!-- 下页键 -->
				    <li>
				    	<s:if test="pageBean.currentPage+1 <= pageBean.pageCount">
					    	<a href="${uri }?pageNum=${pageBean.currentPage+1 }" aria-label="Next">
					    		<span aria-hidden="true">&raquo;</span>
					    	</a>
				    	</s:if>
				    	<s:else>
				    		<a href="#" aria-label="Next">
					    		<span aria-hidden="true">&raquo;</span>
					    	</a>
				    	</s:else>
				    </li>
				    <!-- 尾页键 -->
				    <li>
				    	<s:if test="pageBean.pageCount <= 1">
							<a aria-label="Previous">
					     		<span aria-hidden="true">尾页</span>
					     	</a>
						</s:if>
						<s:else>
							<a href="${uri }?pageNum=${pageBean.pageCount }" aria-label="Previous">
					     		<span aria-hidden="true">尾页</span>
					     	</a>
						</s:else>
				    </li>
				</ul>
				</div>
			</div>
			<!-- 分页结束 -->
		</div>
		<!-- Modal 1-->
		<div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabelp">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabelp">增加学校</h4>
			      </div>
			      <form action="admin_schoolAdd" class="form-horizontal">
				    <div class="modal-body">
							<div class="form-group">
							    <label for="inputEmail3" class="col-xs-offset-2 col-xs-2 control-label">权限类型</label>
							    <div class="col-xs-6">
							      <select class="form-control">
								      	<option>校级管理</option>
							      </select>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputEmail3" class="col-xs-offset-2 col-xs-2 control-label">中/小学</label>
							    <div class="col-xs-6">
							      <select name="grade_id" class="form-control">
								      	<option value="1">小学</option>
								      	<option value="2">中学</option>
							      </select>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-2 col-xs-2 control-label">学校账户</label>
							    <div class="col-xs-6">
							      <input value="${bean.account }" type="text" class="form-control" id="inputText" placeholder="自动生成" disabled>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-2 col-xs-2 control-label">登录密码</label>
							    <div class="col-xs-6">
							      <input value="${bean.pass }" type="password" class="form-control" id="inputText" placeholder="自动生成" disabled>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-2 col-xs-2 control-label">学校名称</label>
							    <div class="col-xs-6">
							      <input name="name" value="${bean.name }" type="text" class="form-control" id="inputText" placeholder="提交后无法修改，请认真核对！" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写学校名称，只能为中文"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-2 col-xs-2 control-label">计划名额</label>
							    <div class="col-xs-6">
							      <input name="num" value="${bean.num }" type="text" class="form-control" id="inputText" placeholder="计划报名人数" data-vaild="" data-errmsg="请填写计划报名的人数"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-2 col-xs-2 control-label">联系电话</label>
							    <div class="col-xs-6">
							      <input name="phone" value="${bean.phone }" type="text" class="form-control" id="inputText" placeholder="联系电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-2 col-xs-2 control-label">学校备注</label>
							    <div class="col-xs-6">
							      <input name="info" value="${bean.info }" type="text" class="form-control" id="inputText" placeholder="学校备注" data-vaild="^[\u4e00-\u9fa5]{2,36}$" data-errmsg="请填写学校备注，只能为中文"/>
							    </div>
							</div>
				    </div>
				    <div class="modal-footer">
				        <input type="button" class="btn btn-default less" data-dismiss="modal" value="取消"/>
				        <input type="submit" class="btn btn-primary" value="确认添加"/>
				    </div>
					</form>
			    </div>
			</div>
		</div>
		<!-- Modal 2-->
		<div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabele">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabele">更改学校信息</h4>
				    </div>
				    <form action="admin_schoolUpdate"  class="form-horizontal">
				    <div class="modal-body">
							<div class="form-group">
							    <label for="rs-school1" class="control-label col-xs-offset-2 col-xs-2">学校账号</label>
							    <!--<label class="control-label col-xs-6 rs-text">100145gdsgdg48</label>-->
							    <div class=" col-xs-6">
							      <input value="${bean.account }" type="text" class="form-control" id="rs-school1" disabled/>
							      <input id="rs-id" name="id" hidden="true">
							    </div>
							</div>
							<div class="form-group">
							    <label for="rs-school2" class="control-label col-xs-offset-2 col-xs-2">学校名称</label>
							    <!--<label for="inputText" class="control-label col-xs-6 control-label rs-text">正清大对我国的</label>-->
							    <div class=" col-xs-6">
							      <input value="${bean.name }"  type="text" class="form-control" id="rs-school2" disabled/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="rs-school3" class="col-xs-offset-2 col-xs-2 control-label">联系电话</label>
							    <div class=" col-xs-6">
							      <input name="phone" value="${bean.phone }" type="text" class="form-control" id="rs-school3" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="rs-school4" class="col-xs-offset-2 col-xs-2 control-label">招生人数</label>
							    <div class=" col-xs-6">
							      <input name="num" value="${bean.num }" type="text" class="form-control" id="rs-school4" data-vaild="^[0-9]*$" data-errmsg="数字格式错误，只能填数字" />
							    </div>
							</div>
							<div class="form-group">
							    <label for="rs-school5" class="col-xs-offset-2 col-xs-2 control-label">相关备注</label>
							    <div class="col-xs-6">
							      <input name="info" value="${bean.info }" type="text" class="form-control" id="rs-school5" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写学校备注，只能为中文"/>
							    </div>
							</div>
				    </div>
				    <div class="modal-footer">
					        <input type="button" class="btn btn-default less" data-dismiss="modal" value="取消"/>
					        <input type="submit" class="btn btn-primary" value="确认更改"/>
				    </div>
					</form>
			    </div>
			</div>
		</div>
		<script type="text/javascript">
              $("form").Vaild();
              //	清除提示
            	setInterval(function(){
            	if($('#myModal-1').css("display") == "block" || $('#myModal-2').css("display") == "block"){
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
			//设置模态框值
			$('.rs-modalBtn').click(function(e){
				var num = $(this).attr('id').slice(1);
				$.ajax({ 
					type: "GET",
					url: "asyn_user_schoolById?id=" + num,
					dataType: "json",
					success: function(data){
						var data = $.parseJSON(data);
						$('#rs-id').val(data.id);
						$('#rs-school1').val(data.account);
						$('#rs-school2').val(data.name);
						$('#rs-school3').val(data.phone);
						$('#rs-school4').val(data.num);
						$('#rs-school5').val(data.info);
						$('#myModal-2').modal('show');
					},
					error: function(XHR){alert("获取信息失败");}
				});
			});
		</script>
</html>
