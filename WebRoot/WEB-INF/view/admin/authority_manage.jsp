<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
				<table class="table table-striped table-bordered table-hover " style="text-align:center; font-size:large ;">
					<thead>
						<tr class="info">
							<td colspan="2" style="text-align: left;">修改权限</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>权限类型：</td>
							<td>教委管理</td>
						</tr>
						<tr>
							<td>操作权限等级：</td>
							<td>1</td>
						</tr>
						<tr>
							<td>个人操作权限：</td>
							<td>
								<select class="form-control" name="select_1" style="height:100%;">
									<option value="0">所有操作</option>
									<option value="1">查询修改</option>
									<option value="2">仅查询</option>
									<option value="3">无权限</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>下级操作权限：</td>
							<td>
								<select class="form-control" name="select_2" style="height:100%;">
									<option value="0">所有操作</option>
									<option value="1">查询修改</option>
									<option value="2">仅查询</option>
									<option value="3">无权限</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>学生操作权限：</td>
							<td>
								<select class="form-control" name="select_3" style="height:100%;">
									<option value="0">所有操作</option>
									<option value="1">查询修改</option>
									<option value="2">仅查询</option>
									<option value="3">无权限</option>
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
			</div>
		</div>
	</body>
</html>
