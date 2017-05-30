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
		<title>manage-education</title>
		<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
   		<script src="js/jquery-3.0.0.min.js"></script>
   		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			.rs-location{
				padding-left:30% ;
				padding-top:10% ;
				padding-right: 30%;
			}
		</style>
	</head>
	<body>
		<div class="">
			<div class="rs-infoBox table-responsive col-xs-12 rs-location">
				<form action="admin_authority_update">
				<table class="table table-striped table-bordered table-hover " style="text-align:center; font-size:large ;">
					<thead>
						<tr class="info">
							<td colspan="2" style="text-align: left;">修改权限 </td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>权限类型：</td>
							<td>${bean.name }<input name="id" value="${bean.id }" hidden="true"/></td>
						</tr>
						<tr>
							<td>个人操作权限：</td>
							<td>
								<select class="form-control" name="self_id" style="height:100%;">
									<s:iterator value="key">
										<option value="${id }" <c:if test='${bean.self.id == id }'>selected="selected"</c:if>>${name }</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td>下级操作权限：</td>
							<td>
								<select class="form-control" name="subs_id" style="height:100%;">
									<s:iterator value="key">
										<option value="${id }" <c:if test='${bean.subs.id == id }'>selected="selected"</c:if>>${name }</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td>学生操作权限：</td>
							<td>
								<select class="form-control" name="stus_id" style="height:100%;">
									<s:iterator value="key">
										<option value="${id }" <c:if test='${bean.stus.id == id }'>selected="selected"</c:if>>${name }</option>
									</s:iterator>
								</select>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><button class="btn btn-info" type="submit" style="width: 30%;">修改</button></td>	
						</tr>
					</tfoot>
				</table>
				</form>
				<s:actionmessage/>
			</div>
		</div>
	</body>
</html>
