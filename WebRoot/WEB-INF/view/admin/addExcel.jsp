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
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/jquery.filer.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery.filer-dragdropbox-theme.css"/>
		<link rel="stylesheet" href="css/custom.css" />
	</head>
	<body>
		<div class="center-block text-center">
			<div class="rs-title">
				<h1 style="color: #0BF;">批量导入相关文件</h1>
			</div>
			<c:if test="${grade_id == 1 && type_id == 1 }">
				<form action="upload_DatePrimaryIn" method="post" enctype="multipart/form-data" class="text-center">
	              <center style="margin-left: 70px;"><input type="file" name="file"></center>
	              <input type="submit" class="btn-custom blue-light" value="上传电子表格" style="margin-top: 20px;margin-bottom: 25px;">
	            </form>
			</c:if>
			<c:if test="${grade_id == 1 && type_id == 2 }">
				<form action="upload_DatePrimaryOut" method="post" enctype="multipart/form-data" class="text-center">
	              <center style="margin-left: 70px;"><input type="file" name="file"></center>
	              <input type="submit" class="btn-custom blue-light" value="上传电子表格" style="margin-top: 20px;margin-bottom: 25px;">
	            </form>
			</c:if>
			<c:if test="${grade_id == 2 && type_id == 1 }">
				<form action="upload_DateMiddleIn" method="post" enctype="multipart/form-data" class="text-center">
	              <center style="margin-left: 70px;"><input type="file" name="file"></center>
	              <input type="submit" class="btn-custom blue-light" value="上传电子表格" style="margin-top: 20px;margin-bottom: 25px;">
	            </form>
			</c:if>
			<c:if test="${grade_id == 2 && type_id == 2 }">
				<form action="upload_DateMiddleOut" method="post" enctype="multipart/form-data" class="text-center">
	              <center style="margin-left: 70px;"><input type="file" name="file"></center>
	              <input type="submit" class="btn-custom blue-light" value="上传电子表格" style="margin-top: 20px;margin-bottom: 25px;">
	            </form>
			</c:if>
		</div>
		<script src="js/jquery-2.1.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.filer.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/prettify.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/scripts.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/custom.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
