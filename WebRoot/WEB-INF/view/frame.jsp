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
		<script src="js/jquery-1.8.3.min.js"></script>
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
			.rs-sider{position: absolute;top: 0px;left: 0px;width: 200px;height:100%;padding-top: 103px;padding-bottom: 50px;overflow:hidden;}
			.rs-tab {height:100%;border-right: 1px solid #CCCCCC;color:#666;text-align: center;overflow:auto;}
			.rs-summary {line-height: 40px;cursor: pointer;font-size: 16px;position: relative;border-bottom: #ccc 1px dotted;transition: background-color .6s linear;-moz-transition: background-color .6s linear;-webkit-transition: background-color .6s linear;-o-transition: background-color .6s linear;}
			.rs-summary:hover{color:#000;}
			.rs-summary.rs-active{background-color:#0BF;}
			.rs-summary .glyphicon{top: 2px;left: -20px;}
			.rs-detailed {display: none;}
			.rs-detailed ul {margin: 0;padding: 0;}
			.rs-detailed li , .rs-detailed .rs-summary{font-size: 14px;line-height: 40px;list-style: none;background-color:rgba(0,188,255,.6);border-bottom: #ccc 1px dotted;text-align: center;} 
			.rs-detailed li a , .rs-detailed .rs-summary{color: #FFFFFF;text-decoration: none;display:inline-block;width:100%;height: 40px;}
			.rs-detailed li a:hover , .rs-detailed .rs-summary:hover{text-decoration: none;color:#FFFFFF; font-size: 16px;}
			.rs-detailed li a.rs-focus , .rs-detailed .rs-summary.rs-active{color:#000000;font-size: 16px;}
			.rs-detailed .rs-detailed li{background-color:#FFF;}
			.rs-detailed .rs-detailed li a{color: #0BF;font-size: 16px;}
            .rs-detailed .rs-detailed li a.rs-focus{background-color:#f5f5f5;}
		</style>
		<!--[if lt IE 9]>
		   <style type="text/css">
		   .rs-detailed li , .rs-detailed .rs-summary {
		       background-color:transparent;
		       filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#9900BBFF,endColorstr=#9900BBFF);
		       zoom: 1;
		    }
		    .rs-detailed .rs-detailed li{
		    	background-color:transparent;
		    	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#FFFFFF,endColorstr=#FFFFFF);
		    	zoom: 1;
		    }
		    </style>
		<![endif]-->
	</head>
	<body>
		<div id="rs-pageHeader">
			<h1>中小学生<small style="color: #FFF;">入学报名信息管理系统</small></h1>
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
			<div class="rs-sider">
				<div class="rs-tab bg-info">
					<!-- 测试 -->
					<c:set var="juint" value="1"></c:set>
					
					<!-- 教委高级 -->
					<c:if test="${currentUser.role.value == '1' || juint == '1' }">
						<!-- 小学  -->
						<div class="rs-summary">
							<span class="glyphicon glyphicon-list-alt"></span>小学管理
						</div>
						<div class="rs-detailed">
							<!-- 报名时间 -->
							<div class="rs-summary">报名时间</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_date_primaryIn" target="center">辖区内时间</a></li>
									<li><a href="admin_date_primaryOut" target="center">辖区外时间</a></li>
								</ul>
							</div>
							<!-- 报名字段 -->
							<div class="rs-summary">报名字段</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_fields_primaryIn" target="center">辖区内字段</a></li>
									<li><a href="admin_fields_primaryOut" target="center">辖区外字段</a></li>
								</ul>
							</div>
							<!-- 审核字段 -->
							<div class="rs-summary">审核字段</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="auditfindPrimaryIn"  target="center">辖区内审核</a></li>
									<li><a href="auditfindPrimaryOut" target="center">辖区外审核</a></li>
								</ul>
							</div>
						</div>
						
						<!-- 中学  -->
						<div class="rs-summary">
							<span class="glyphicon glyphicon-list-alt"></span>中学管理
						</div>
						<div class="rs-detailed">
							<!-- 时间 -->
							<div class="rs-summary">报名时间</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_date_middleIn" target="center">辖区内时间</a></li>
									<li><a href="admin_date_middleOut" target="center">辖区外时间</a></li>
								</ul>
							</div>
							<!-- 字段 -->
							<div class="rs-summary">报名字段</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_fields_middleIn" target="center">辖区内字段</a></li>
									<li><a href="admin_fields_middleOut" target="center">辖区外字段</a></li>
								</ul>
							</div>
							<!-- 审核 -->
							<div class="rs-summary">审核字段</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="auditfindMiddleIn" target="center">辖区内审核</a></li>
									<li><a href="auditfindMiddleOut" target="center">辖区外审核</a></li>
								</ul>
							</div>
						</div>
						
						<!--Manager-->
						<div class="rs-summary">
							<span class="glyphicon glyphicon-th-list"></span>权限管理
						</div>
						<div class="rs-detailed">
							<ul>
								<li><a href="admin_authority_manage" target="center">教委权限</a></li>
								<li><a href="admin_authority_master" target="center">学校权限</a></li>
								<li><a href="admin_authority_teacher" target="center">教师权限</a></li>
							</ul>
						</div>
						
							<!--manage  -->
							<div class="rs-summary">
								<span class="glyphicon glyphicon-inbox"></span>教委管理
							</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_manageList" target="center">浏览管理员</a></li>
								</ul>
							</div>
					</c:if>
					
					<c:if test="${(currentUser.role.value == '1' || currentUser.role.value == '2') || juint == '1'}">
						<!-- 教委权限限制 -->
						<c:if test="${(currentPower.subs.id != 9 ) || juint == '1'}" >
							<!--School  -->
							<div class="rs-summary">
								<span class="glyphicon glyphicon-briefcase"></span>学校管理
							</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_schoolList" target="center">学校浏览</a></li>
								</ul>
							</div>
						</c:if>
					</c:if>
					
					<!-- 基本逻辑操作 -->
					<c:if test="${(currentUser.role.value == '1' || currentUser.role.value == '2' || currentUser.role.value == '3') || juint == '1' }">
						<!-- 学校操作权限限制 -->
						<c:if test="${(currentPower.subs.id != 9 ) || juint == '1'}" >
							<!--Teacher  -->
							<div class="rs-summary">
								<span class="glyphicon glyphicon-inbox"></span>教师管理
							</div>
							<div class="rs-detailed">
								<ul>
									<li><a href="admin_teacherList" target="center">教师浏览</a></li>
								</ul>
							</div>
						</c:if>
					</c:if>
					
					<!-- 基本逻辑操作-->
					<c:if test="${(currentUser.role.value == '1' || currentUser.role.value == '3' || currentUser.role.value == '4') || juint == '1' }">
						<!-- 权限限定 -->
						<c:if test="${(currentPower.stus.id != 9 ) || juint == '1'}" >
							<!--Student  -->
							<div class="rs-summary">
								<span class="glyphicon glyphicon-tasks"></span>学生管理
							</div>
							<div class="rs-detailed">
								<!-- 仅高级人员操作 -->
								<c:if test="${currentUser.role.value == '1' || juint == '1' }">
									<c:if test="${(currentUser.role.value == '1' || currentUser.role.value == '2' || currentUser.role.value == '3' ) || juint == '1' }">
									<div class="rs-summary">学生浏览</div>
										<div class="rs-detailed">
											<ul>
												<li><a href="admin_student_list?grade_id=1&type_id=1" target="center">辖区内小学</a></li>
												<li><a href="admin_student_list?grade_id=2&type_id=1" target="center">辖区内中学</a></li>
												<li><a href="admin_student_list?grade_id=1&type_id=2" target="center">辖区外小学</a></li>
												<li><a href="admin_student_list?grade_id=2&type_id=2" target="center">辖区外中学</a></li>
											</ul>
										</div>
									</c:if>
									<c:if test="${currentUser.role.value == '1' || juint == '1' }">
										<div class="rs-summary">批量导入</div>
										<div class="rs-detailed">
											<ul>
												<li><a href="admin_student_addExcel?grade_id=1&type_id=1" target="center">辖区内小学</a></li>
												<li><a href="admin_student_addExcel?grade_id=2&type_id=1" target="center">辖区内中学</a></li>
												<li><a href="admin_student_addExcel?grade_id=1&type_id=2" target="center">辖区外小学</a></li>
												<li><a href="admin_student_addExcel?grade_id=2&type_id=2" target="center">辖区外中学</a></li>
											</ul>
										</div>
									</c:if>
								</c:if>
								<!-- 学校和教师的操作 -->
								<c:if test="${(currentUser.role.value == '3' || currentUser.role.value == '4') }">
									<div class="rs-summary">报名审核</div>
									<div class="rs-detailed">
										<ul>
											<li><a href="admin_student_audit?type_id=1" target="center">辖区内</a></li>
											<li><a href="admin_student_audit?type_id=2" target="center">辖区外</a></li>
										</ul>
									</div>
								</c:if>
							</div>
						</c:if>
					</c:if>
					
					<!-- 个人操作权限限制 -->
					<c:if test="${(currentPower.self.id != 9 ) || juint == '1'}" >
						<!--Person  -->
						<div class="rs-summary">
							<span class="glyphicon glyphicon-user"></span>个人管理
						</div>
						<div class="rs-detailed">
							<ul>
								<li><a href="admin_personal" target="center">我的信息</a></li>
							</ul>
						</div>
					</c:if>
				<!--end  -->
				</div>
			</div>
			<!-- center panel -->
			<div class="embed-responsive" id="rs-frameCenter">
				<iframe class="embed-responsive-item" name="center" src="admin_mainView" width="100%" height="100%" frameborder="0"></iframe>
			</div>
		</div>
		<div id="rs-pageFooter">
			<a href="admin_help" target="center">使用指南</a>
			<p>版权所有:zzuli-zqrc &copy; 2017</p>
		</div>
	</body>
</html>
