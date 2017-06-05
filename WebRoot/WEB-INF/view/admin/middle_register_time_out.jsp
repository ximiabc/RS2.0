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
		<title>中学辖区外生源报名日期</title>
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css"/>
	</head>
	<body>
		<div style="padding: 100px 50px 0;">
			<form class="form-horizontal" action="admin_date_middleOutUpdate" method="post">
				<div class="col-xs-offset-1 col-xs-10">
					<div class="panel panel-default">
						<div class="panel-heading">中学辖区外生源报名日期</div>
						<div class="panel-body form-group">
			            	<label for="startTime" class="col-xs-offset-2 control-label">开始报名日期：</label>
			                <div id="startTime" class="input-group date form_date col-xs-offset-2 col-xs-8" data-date="">
			                    <input name="startDates" class="form-control" size="16" type="text" value="<s:date name='bean.startDate' format='yyyy-MM-dd'/>" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
			                <label for="endTime" class="col-xs-offset-2 control-label">结束报名日期：</label>
			                <div id="endTime" class="input-group date form_date col-xs-offset-2 col-xs-8" data-date="">
			                    <input name="endDates" class="form-control" size="16" type="text" value="<s:date name="bean.endDate" format="yyyy-MM-dd"/>" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
							<input type="submit" class="btn btn-primary btn-lg col-xs-offset-4 col-xs-4" style="margin-top: 25px;" value="提交"/>
			            </div>
		            </div>
				</div>
				<div class="form-group text-center" >
				</div>
			</form>
			<s:actionmessage/>
		</div>
		<script src="js/jquery-3.0.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/rs-datetimepicker.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
