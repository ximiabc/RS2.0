<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			.rs-title{margin: 70px auto 25px;color: #777;}
			.rs-title h1,.radio{color: #0BF;}
			.rs-peak{border-radius:6px;border: 2px dashed #C8CBCE;height: 200px;}
			.form-group{margin: 70px 0;}
			/*.rs-peak{border-radius:6px;border: 2px dashed #C8CBCE;height: 200px;width:400px;margin: 0 auto;}
			.form-group{margin-top:60px;}*/
			
		</style>
	</head>
	<body>
		<div class="center-block text-center">
			<div class="rs-title">
				<h1>审核相关参数</h1>
			</div>
				
			<!--1去掉大的布局，该行内-->
			<div class="container-fluid">
			<div class="rs-peak col-xs-offset-4 col-xs-4">
					<form action="auditSetPrimaryOut">
						<div class="row">
							<div class="form-group col-xs-8">
								<select name="selectId" class="form-control">
									<s:iterator value="beans" >
										<option value="${orders }" <c:if test="${orders == Audit }">selected</c:if> >${name }</option>
									</s:iterator>
							    </select>
							</div>
							<div class="form-group col-xs-4">
							<button type="submit" class="btn btn-default">确认</button>		
							</div>
						</div>
				    </form>
				</div>
			</div>
			<!--2兼容排列-->
			<!--<div class="rs-peak">
					<form class="form-inline">
							<div class="form-group">
								<select class="form-control">
									<option value="1">姓名</option>
									<option value="1">性别</option>
									<option value="1">民族</option>
									<option value="1">身份证号</option>
							    </select>
							</div>
							<div class="form-group">
							    <button type="submit" class="btn btn-default">审核</button>		
							</div>
				    </form>
			</div>-->
		</div>
		<script src="js/jquery-2.1.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
