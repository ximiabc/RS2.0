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
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/jquery.filer.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery.filer-dragdropbox-theme.css"/>
		<link rel="stylesheet" href="css/custom.css" />
		<style>
			.rs-title{margin: 50px auto 25px;}
			.rs-title h1,.radio{color: #0BF;}
			.radio label{margin:5px;padding:10px 20px 10px 40px;border-radius:6px;border: 2px dashed #C8CBCE;}
		</style>
	</head>
	<body>
		<div class="center-block text-center">
			<div class="rs-title">
				<h1>批量导入相关文件</h1>
				<p>1.上传时请注意文件格式</p>
				<p>2.每次只能上传一个文件</p>
			</div>
			<div class="radio">
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios1" value="1">
					辖区内小学
				</label>
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios2" value="2">
					辖区内中学
				</label>
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios3" value="3">
					辖区外小学
				</label>
				<label>
					<input type="radio" name="optionsRadios" id="optionsRadios4" value="4">
					辖区外中学
				</label>
			</div>
			<input type="file" name="files[]" id="demo-fileInput" multiple="multiple">
		</div>
		<script src="js/jquery-2.1.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.filer.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/prettify.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/scripts.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/custom.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
