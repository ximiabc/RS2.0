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
		<title>报名审核</title>
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
				<div class="col-xs-offset-3 col-xs-9 clearfix">
					<form class="form-inline pull-right">
						<!--下拉选项框-->
					   <select name="select_year" class="form-control">
							<option selected="selected" value="1">2017</option>
							<option value="2">2016</option>
						</select>
						<select name="select_name" class="form-control">
							<option selected="selected" value="1">关联查询</option>
							<option value="2">学校编号</option>
				    		<option value="3">学校名称</option>
				    		<option value="4">学生编号</option>
				    		<option value="5">学生姓名</option>
				    		<option value="6">未报名</option>
				    		<option value="7">已报名</option>
				    		<option value="8">申请撤回</option>
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
						<s:iterator value="fields">
							<td id>${name }</td>
						</s:iterator>
						<td>学历</td>
						<td>辖区内外</td>
						<td>报名学校</td>
						<td>报名状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="pageBean.recordList" status="indexs">
						<tr>
							<td>${indexs.index+1 }</td>
							<!-- 横排处理列 -->
							<s:iterator value="fields" status="indexs"> 
								<td>
									<c:if test="${keyName=='item1' }">${item1 }</c:if>
									<c:if test="${keyName=='item2' }">${item2 }</c:if>
									<c:if test="${keyName=='item3' }">${item3 }</c:if>
									<c:if test="${keyName=='item4' }">${item4 }</c:if>
									<c:if test="${keyName=='item5' }">${item5 }</c:if>
									<c:if test="${keyName=='item6' }">${item6 }</c:if>
									<c:if test="${keyName=='item7' }">${item7 }</c:if>
									<c:if test="${keyName=='item8' }">${item8 }</c:if>
									<c:if test="${keyName=='item9' }">${item9 }</c:if>
									<c:if test="${keyName=='item10' }">${item10 }</c:if>
									<c:if test="${keyName=='item11' }">${item11 }</c:if>
									<c:if test="${keyName=='item12' }">${item12 }</c:if>
									<c:if test="${keyName=='item13' }">${item13 }</c:if>
									<c:if test="${keyName=='item14' }">${item14 }</c:if>
									<c:if test="${keyName=='item15' }">${item15 }</c:if>
									<c:if test="${keyName=='item16' }">${item16 }</c:if>
									<c:if test="${keyName=='item17' }">${item17 }</c:if>
									<c:if test="${keyName=='item18' }">${item18 }</c:if>
									<c:if test="${keyName=='item19' }">${item19 }</c:if>
									<c:if test="${keyName=='item20' }">${item20 }</c:if>
									<c:if test="${keyName=='item21' }">${item21 }</c:if>
									<c:if test="${keyName=='item22' }">${item22 }</c:if>
									<c:if test="${keyName=='item23' }">${item23 }</c:if>
									<c:if test="${keyName=='item24' }">${item24 }</c:if>
									<c:if test="${keyName=='item25' }">${item25 }</c:if>
									<c:if test="${keyName=='item26' }">${item26 }</c:if>
									<c:if test="${keyName=='item27' }">${item27 }</c:if>
									<c:if test="${keyName=='item28' }">${item28 }</c:if>
									<c:if test="${keyName=='item29' }">${item29 }</c:if>
									<c:if test="${keyName=='item30' }">${item30 }</c:if>
									<c:if test="${keyName=='item31' }">${item31 }</c:if>
									<c:if test="${keyName=='item32' }">${item32 }</c:if>
									<c:if test="${keyName=='item33' }">${item33 }</c:if>
									<c:if test="${keyName=='item34' }">${item34 }</c:if>
									<c:if test="${keyName=='item35' }">${item35 }</c:if>
									<c:if test="${keyName=='item36' }">${item36 }</c:if>
									<c:if test="${keyName=='item37' }">${item37 }</c:if>
									<c:if test="${keyName=='item38' }">${item38 }</c:if>
									<c:if test="${keyName=='item39' }">${item39 }</c:if>
									<c:if test="${keyName=='item40' }">${item40 }</c:if>
								 </td>
							</s:iterator>
							<td>${grade.name }</td>
							<td>${type.name }</td>
							<td>${school.name }</td>
							<td>${states.name }</td>
							<td>
								<div class="rs-school-space">
								<button id="n${id }" class="btn btn-default rs-modalBtn" type="button">报名</button>
								</div>
							</td>
						</tr>
					</s:iterator>
				</tbody>
				</table>
			<!--分页开始-->
			<s:set name="uri" value="admin_student_audit"></s:set>
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
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">更改学生人数</h4>
				    </div> 
				    <form action="admin_student_auditPass" class="form-horizontal container-fluid">
					    <div class="modal-body row">
							<s:iterator value="fieldAll" status="indexs">
								<div class="form-group col-xs-6">
									<label class="col-xs-6 control-label">${name }</label>
							   		<label id="${keyName }"  class="col-xs-6 control-label rs-text"></label>
								</div>
							</s:iterator>
					    </div>
					    <div class="modal-footer">
					        <div class="input-group pull-right" style="width: 260px; margin-right: 40px;">
					        	<input id="ids" type="text" name="id" hidden>
							    <input name="audit_str" type="text" class="form-control" placeholder="输入验证信息">
							    <span class="input-group-btn">
							        <input class="btn btn-info" type="submit" value="审核通过"/>
							    </span>
						    </div>
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
			//设置模态框值
			$('.rs-modalBtn').click(function(){
				var num = $(this).attr('id').slice(1);
				$.ajax({
					type: "GET",
					url: "asyn_studentById?id="+num,
					dataType: "json",
					success: function(data){
						var data = $.parseJSON(data);
						$('#ids').val(data.id);
						for(var key in data){
							console.group(key);console.log(data[key]);console.groupEnd();
							$('#'+key).text(data[key]);
						}
						$('#myModal').modal('show');
					},
					error: function(XHR){alert("获取信息失败");}
				});
			});
		</script>
	</body>
</html>
