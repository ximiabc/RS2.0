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
		<title>学生管理</title>
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
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-1">增加教师</button>
				</div>
				<div class="col-xs-offset-1 col-xs-9 clearfix">
					<form class="form-inline pull-right">
						<!--下拉选项框-->
						<select name="select_name" class="form-control">
							<option selected="selected" value="1">所有学校</option>
							<option value="2">学校账号</option>
				    		<option value="3">学校名称</option>
				    		<option value="4">教师账号</option>
				    		<option value="4">教师名称</option>
						</select>
					    <input type="text" class="form-control" placeholder="number">
					    <button type="submit" class="form-control">检索</button>	
				    </form>
				</div>
			</div>
		<!--数据表格部分--> 
			<table class="table table-striped table-bordered table-hover table-condensed text-center">
					<thead>
					<tr class="info">
						<td></td>
						<td>学校编号</td>
						<td>学校名字</td>
						<td>教师账号</td>
						<td>教师姓名</td>
						<td>联系电话</td>
						<td>备注</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="pageBean.recordList" status="indexs">
						<tr>
							<td>${indexs.index+1 }</td>
							<td>${user.account }</td>
							<td>${user.name }</td>
							<td>${account }</td>
							<td>${name }</td>
							<td>${phone }</td>
							<td>${info }</td>
							<td>
								<div class="rs-school-space">
								<a href="admin_teacherDel?id=${id }" onclick="return confirm('确认删除此老师吗？');" class="btn btn-default">删除</a>
								<button class="btn btn-default" type="submit" data-toggle="modal" data-target="#myModal-2">更改</button>
								</div>
							</td>
						</tr>
					</s:iterator>
				</tbody>
				</table>
		<!--分页开始-->
			<div class="clearfix">
				<div class="message">
					共<i class="blue_page">
						<s:property value="pageBean.pageCount" />
					</i>页， 
					<i class="blue_page">
						<s:property value="pageBean.recordCount" />
					</i>条记录， 当前显示第&nbsp;<i class="blue_page"> 
					<s:if test="pageBean.currentPage == 0">
						1
					</s:if>
					<s:else>
						<s:property value="pageBean.currentPage" />
					</s:else>
					&nbsp;</i>页
				</div>
				<s:set name="uri" value="admin_teacherList"></s:set>
				<div class="message pull-right">
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
		<div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">增加老师</h4>
			      </div>
			      <form action="admin_teacherAdd" class="form-horizontal">
				    <div class="modal-body">
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">学校编号</label>
							    <div class="col-xs-5">
							   		<input value="${currentUser.account }" type="text" class="form-control" id="inputText" placeholder="学校编号" disabled></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">学校名称</label>
							    <div class="col-xs-5">
							   		<input value="${currentUser.name }" type="text" class="form-control" id="inputText" placeholder="学校名称" disabled></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">教师账号</label>
							    <div class="col-xs-5">
							    	<input value="${bean.account }"  type="text" class="form-control" id="inputText" placeholder="账号自动生成" disabled></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">教师姓名</label>
							    <div class="col-xs-5">
							    	<input name="name" value="${bean.name }" type="text" class="form-control" id="inputText" placeholder="描述信息" ></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">联系电话</label>
							    <div class="col-xs-5">
							      <input name="phone" value="${bean.phone }" type="text" class="form-control" id="inputText" placeholder="联系电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">相关描述</label>
							    <div class="col-xs-5">
							      <input name="info" value="${bean.info }" type="text" class="form-control" id="inputText" placeholder="描述信息" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写家庭地址，只能为中文"/>
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
		<div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">更改学校信息</h4>
				    </div>
				    <form  class="form-horizontal">
				    <div class="modal-body">
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">学校编号</label>
							    <div class="col-xs-5">
							   		<input value="${currentUser.account }" type="text" class="form-control" id="inputText" placeholder="学校编号" disabled></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">学校名称</label>
							    <div class="col-xs-5">
							   		<input value="${currentUser.name }" type="text" class="form-control" id="inputText" placeholder="学校名称" disabled></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">教师账号</label>
							    <div class="col-xs-5">
							    	<input value="${bean.account }"  type="text" class="form-control" id="inputText" placeholder="账号自动生成" disabled></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">教师姓名</label>
							    <div class="col-xs-5">
							    	<input name="name" value="${bean.name }" type="text" class="form-control" id="inputText" placeholder="描述信息" ></input>
								</div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">联系电话</label>
							    <div class="col-xs-5">
							      <input name="phone" value="${bean.phone }" type="text" class="form-control" id="inputText" placeholder="联系电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group">
							    <label for="inputText" class="col-xs-offset-3 col-xs-2 control-label">相关描述</label>
							    <div class="col-xs-5">
							      <input name="info" value="${bean.info }" type="text" class="form-control" id="inputText" placeholder="描述信息" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写家庭地址，只能为中文"/>
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
		<!-- Modal 3-->
		<div class="modal fade" id="myModal-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">更改学生人数</h4>
				    </div> 
				    <form class="form-horizontal">
					    <div class="modal-body row">
							<div class="form-group col-xs-6">
								    <label for="inputText" class="col-xs-4 control-label">学生编号</label>
								    <label for="inputText" class="col-xs-4 control-label">216000062105478985</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">学生姓名</label>
							    <label for="inputText" class="col-xs-4 control-label">张宇说</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">性别</label>
							    <label for="inputText" class="col-xs-4 control-label">男</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">民族</label>
							    <label for="inputText" class="col-xs-4 control-label">汉族</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">身份证号</label>
							    <label for="inputText" class="col-xs-4 control-label">410106201005150034</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">报名学校</label>
							    <label for="inputText" class="col-xs-4 control-label">201600000621</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">入学前幼儿园</label>
							    <label for="inputText" class="col-xs-4 control-label">实验幼儿园</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">家庭地址</label>
							    <label for="inputText" class="col-xs-4 control-label">我凛真乌云社区</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">家庭电话</label>
							    <label for="inputText" class="col-xs-4 control-label">135255880563</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">所在居委会</label>
							    <label for="inputText" class="col-xs-4 control-label">老在和促进</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">监护人1姓名</label>
							    <label for="inputText" class="col-xs-4 control-label">张贝</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">监护人1电话</label>
							    <label for="inputText" class="col-xs-4 control-label">1362588062</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">监护人1身份证</label>
							    <label for="inputText" class="col-xs-4 control-label">410121198009125432</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">监护人2姓名</label>
							     <label for="inputText" class="col-xs-4 control-label">陈伟欧</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">监护人2电话</label>
							    <label for="inputText" class="col-xs-4 control-label">13679850000</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">监护人2身份证</label>
							     <label for="inputText" class="col-xs-4 control-label">410121198009125432</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">学生类型</label>
							    <label for="inputText" class="col-xs-4 control-label">辖区内学生</label>
							</div>
							<div class="form-group col-xs-6">
							    <label for="inputText" class="col-xs-4 control-label">报名状态</label>
							    <label for="inputText" class="col-xs-4 control-label">已报名</label>
							</div>
					    </div>
					    <div class="modal-footer">
					        <button type="button" class="btn btn-default less" data-dismiss="modal">取消</button>
					        <button type="submit" class="btn btn-primary less">审核通过</button>
						</div>
					</form>
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
	</body>
</html>