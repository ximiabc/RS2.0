<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"stylesheet" type="text/css" href="css/jquery-filer.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery.filer-dragdropbox-theme.css"/>
		<link rel="stylesheet" href="css/custom.css" />
		<style>
		.title{margin: 40px auto;}
			h1{color: #0BF;margin: 40px auto;}
			ol{width: 300px;margin: 0 auto;}
			ol li{margin: 10px auto;}
		</style>
	</head>
	<body>
		<div class="title">
			<h1 class="text-center">批量导入相关文件</h1>
			<div>
				<ol>
					<li>上传文件时请注意文件的格式</li>
					<li>每次上传只能上传一个文件</li>
				</ol>
			</div>
		</div>
		<input type="file" name="files[]" id="demo-fileInput" multiple="multiple">
		<script src="js/jquery-2.1.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.filer.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/prettify.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/scripts.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/custom.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>