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
		<title>登录系统</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
   		<style type="text/css">	
   			body{
   				margin: 0;
   				padding: 0;
   				height: auto;
   				background: #0BF;
   			}
   			.rs-headH1{
   				color:#FFF; 
   				font-size: 50px;
   			}
   			.rs-fontColor{color: #0BF;}
   			.rs-content{
   			    border-radius: 30px;
			    background: rgb(255,255,255);
			    padding-bottom: 30px;
			    width: 400px;
			    margin-top: 50px;
			    overflow: hidden;
   			}
   			.container-fluid .row{margin-top: 50px;}
   			.well{margin-bottom: 0;}
			@media (min-width: 992px){.rs-headH1{margin-top: 145px;}.rs-content{margin-top: 0;}.container-fluid .row{margin-top: 150px;}}
   		</style>	
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-offset-1 col-md-6 col-xs-12">	
					<h1 class="center-block rs-headH1 text-center">中小学生</br>入学报名信息管理系统</h1>
				</div>
	 			<div class="col-md-5 col-xs-12">
	 			 	<div class="center-block rs-content">
						<h1 class="rs-fontColor text-center">登录</h1>
						<hr />
			 			<form class="form-horizontal container-fluid" action="login" method="post">
			 				<!--用户名--> 		
				 			<div class="form-group">
							    <span class="rs-fontColor col-xs-12" style="font-size:20px;">用户名：</span>
							    <div class="col-xs-10 col-xs-offset-1">
							        <input name="account" type="text" class="form-control input-lg well" style="padding: 10px 16px;" id="exampleInputName1"placeholder="请输入账号" >
							  		<span class="glyphicon glyphicon-user form-control-feedback" style="padding-right:20px;"></span>
							    </div>
							</div>
				 			<!--密码--> 		
				 			<div class="form-group">
							    <span class="rs-fontColor col-xs-12" style="font-size:20px;">密　码：</span>
							    <div class="col-xs-10 col-xs-offset-1">
							    	<input name="pass" type="password" class="  form-control input-lg well" style="padding: 10px 16px;" id="exampleInputPassword1" placeholder="请输入密码">
							    	<span class="glyphicon glyphicon-lock form-control-feedback"style="padding-right:20px;"></span>
							    </div>
							</div>
				 			 <div class="form-group">
				 				<div class="col-xs-12 col-xs-offset-1" >
									 <input type="text" name="checkCode" class="login_text_input " style="width: 100px;text-indent: 5px;">
									 <img src="<c:url value='images'/>" onclick="location.reload()" id="checks" style="width: 100px;height: 30px;margin-left: 10px"/>
									 <a style="color: red; font-size:15px;font-weight: 900"></a>
								</div>
				 			</div>
				 			<s:actionerror/>
				 			<!--登录-->
			 				<input type="submit" class="btn btn-primary btn-lg center-block" style="background-color: #0BF; width: 60%;" value="登录"/>
			 			</form>
					</div>
	 			</div>
			</div>
		</div>
	</body>
</html>
