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
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>中学报名表字段（辖区内）</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/rs-registerTemplate.css" />
	</head>
	<body>
		<div id="middleIn" class="container">
			<div class="row">
				<div class="col-xs-offset-1 col-xs-10">
					<div class="btn-group btn-group-justified" role="group">
						<div class="btn-group" role="group">
							<button id="rs-up" type="button" data-toggle="modal" data-target="#uploadModal" class="btn btn-default btn-info btn-lg">
								<span class="glyphicon glyphicon-download" aria-hidden="true"></span>
								上传报名表
							</button>
						</div>
						<div class="btn-group" role="group">
							<a href="excelmiddelIn" id="rs-down" class="btn btn-default btn-info btn-lg">
								<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
								下载报名表
							</a>
						</div>
					</div>
					<button id="rs-saveItem" type="button" class="btn btn-warning btn-block hidden">保存</button>
					<div id="dragslot" class="slot">
						<ul id="slot-list" class="list-group slot-list text-center" style="margin-bottom: 0px;">
							<s:iterator value="beans" status="indexs">
								<li class="list-group-item slot-item">
									<span id='${keyName }' class="rs-itemName">${name }</span>
									<span id="rule${checks.id }" class="rs-itemRule">${checks.name }</span>
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
							</s:iterator>
						</ul>
					</div>
					<div class="input-group">
						<div class="input-group-addon">添加报名表字段名</div>
						<input id="rs-addItemText" type="text" class="form-control">
						<span class="input-group-btn">
							<button id="rs-addItem" class="btn btn-default" type="button">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								添加
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<form action="upload_InMiddleIn" method="post" enctype="multipart/form-data">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="uploadModalLabel">上传表格</h4>
						</div>
						<div class="modal-body">
							<input name="file" type="file" class="form-control">
						</div>
			    		<div class="modal-footer">
			    			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			    			<button type="submit" id="rs-modalUp" class="btn btn-primary">上传</button>
			    		</div>
		    		</form>
				</div>
			</div>
		</div>
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="editModalLabel">编辑字段名</h4>
					</div>
					<div class="modal-body">
					    <div class="input-group">
							<div class="input-group-addon">字段名</div>
							<input type="text" id="rs-modalText" class="form-control">
						</div>
						<div class="input-group">
							<div class="input-group-addon">内容填写规则</div>
							<select name="checks_id" id="rs-modalSelect" class="form-control">
								<s:iterator value="checks">
									<option value="rule${id }">${name }</option>
								</s:iterator>
							</select>
						</div>
					</div>
		    		<div class="modal-footer">
		    			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		    			<button type="button" id="rs-modalDelete" class="btn btn-danger">删除</button>
		    			<button type="button" id="rs-modalEdit" class="btn btn-primary">更改</button>
		    		</div>
				</div>
			</div>
		</div>
		<script src="js/jquery-3.0.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/dragslot.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/rs-registerTemplate.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
