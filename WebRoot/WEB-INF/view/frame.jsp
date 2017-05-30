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
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>入学报名信息管理系统</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="js/rs-tab.js"></script>
		<style type="text/css">
			body,html{height: 100%;min-width: 560px;}
			.rs-plr5{padding-left: 5px;padding-right: 5px;}
			#rs-pageHeader,#rs-pageFooter{position:absolute;width:100%;z-index: 2;min-width: 560px;}
			#rs-pageHeader{top:0;background-color: #0BF;padding-left:20px;color: #FFF;box-shadow: 0 -1px 5px #666 inset;}
			#rs-userInfo{position:relative;display:block;text-align: right;vertical-align: middle;color: inherit;}
			#rs-userInfo>span{color: #666;}
			#rs-pageMain{position:relative;height: 100%;width: 100%;padding-top: 103px;padding-bottom: 50px;}
			#rs-frameCenter{margin-left:200px;height: 100%;}
			#rs-pageFooter{bottom:0;text-align: center;background-color: #FFF;}
			.rs-tab {padding-top: 103px;padding-bottom: 50px;width: 200px;height:100%;border-right: 1px solid #CCCCCC;color:#555;font-size: 14px;text-align: center;position: absolute;top: 0px;}
			.rs-summary {height: 40px;line-height: 40px;cursor: pointer;font-size: 16px;position: relative;border-bottom: #ccc 1px dotted;transition: background-color .6s linear;-moz-transition: background-color .6s linear;-webkit-transition: background-color .6s linear;-o-transition: background-color .6s linear;}
			.rs-summary:hover{color:#000;}
			.rs-permissions,.rs-apply,.rs-school,.rs-student,.rs-teacher,.rs-personal{position: absolute;height: 20px;width: 20px;top: 15px;left: 30px;opacity: 0.6;}
			.rs-detailed {display: none;font-size: 14px;}
			.rs-detailed ul {margin: 0;padding: 0;}
			.rs-detailed li {height: 40px;line-height: 40px;list-style: none;background-color:rgba(0,188,255,.6);;border-bottom: #ccc 1px dotted;text-align: center;} 
			.rs-detailed li a{color: #FFFFFF;text-decoration: none;display:inline-block;width:100%;height: 40px;}
			.rs-detailed li a:hover{text-decoration: none;color:#FFFFFF; font-size: 16px;}
			.rs-detailed li a:focus{color:#000000;font-size: 16px;}
            .active{background-color:#0BF;}
		</style>
	</head>
	<body>
		<div id="rs-pageHeader">
			<h1>上街区中、小学生<small style="color: #FFF;">入学报名信息管理系统</small></h1>
			<span id="rs-userInfo">
				<span class="rs-plr5">${currentUser.name }</span>
				您好，您的身份为
				<span class="rs-plr5">${currentUser.role.name }</span>
				<a class="btn btn-link" href="viewexit">
					<span class="glyphicon glyphicon-log-out" aria-hidden="true" style="padding-right: 5px;"></span>
					退出登录
				</a>
			</span>
		</div>
		<div id="rs-pageMain">
			<div class="rs-tab bg-info">
			<!--Manager-->  
			<div class="rs-summary">
				<div class="rs-permissions glyphicon glyphicon-th-list"></div>权限管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_authority_manage" target="center">教委权限</a></li>
					<li><a href="admin_authority_master" target="center">学校权限</a></li>
					<li><a href="admin_authority_teacher" target="center">教师权限</a></li>
				</ul>
			</div>
			<!--Apply  -->
			<div class="rs-summary">
				<div class="rs-apply glyphicon glyphicon-list-alt"></div>报名管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_date_view" target="center">报名时间管理</a></li>
					<li><a href="admin_fields_view" target="center">报名字段管理</a></li>
				</ul>
			</div>
			<!--manage  -->
			<div class="rs-summary">
				<div class="rs-teacher glyphicon glyphicon-inbox"></div>管理员管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_manageList" target="center">浏览管理员</a></li>
				</ul>
			</div>
			<!--School  -->
			<div class="rs-summary">
				<div class="rs-school glyphicon glyphicon-briefcase"></div>学校管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_schoolList" target="center">学校浏览</a></li>
				</ul>
			</div>
			<!--Teacher  -->
			<div class="rs-summary">
				<div class="rs-teacher glyphicon glyphicon-inbox"></div>教师管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_teacherList" target="center">教师浏览</a></li>
				</ul>
			</div>
			<!--Student  -->
			<div class="rs-summary">
				<div class="rs-student glyphicon glyphicon-tasks"></div>学生管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_student_list" target="center">增删改查</a></li>
					<li><a href="admin_student_audit" target="center">认证审核</a></li>
					<li><a href="admin_student_addExcel" target="center">批量导入</a></li>
				</ul>
			</div>
			<!--Person  -->
			<div class="rs-summary">
				<div class="rs-personal glyphicon glyphicon-user"></div>个人管理
			</div>
			<div class="rs-detailed">
				<ul>
					<li><a href="admin_personal" target="center">我的信息</a></li>
				</ul>
			</div>
			<!--end  -->
		</div>
		
			<!-- center panel -->
			<div class="embed-responsive" id="rs-frameCenter">
				<iframe class="embed-responsive-item" name="center" src="admin_mainView" width="100%" height="100%"></iframe>
			</div>
		</div>
		<div id="rs-pageFooter">
			<hr style="padding: 0px;margin: 0px;">
			<p>版权所有:zzuli-zqrc &copy; 2017&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_help" target="center">使用指南</a></p>
		</div>
	</body>
</html>
