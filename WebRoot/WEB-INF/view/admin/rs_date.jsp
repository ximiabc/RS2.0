<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>报名时间管理</title>
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css"/>
		<style type="text/css">
			.rs-ptlr50{padding: 25px 50px 0;}
			.form-horizontal .rs-radioC{padding-top:25px;padding-bottom:25px;font-size:22px;border-radius: 6px;border: 1px dashed #666;}
			.rs-radioC .rs-radio{display: none;}
			.rs-radioC.rs-active{background-color:rgba(0,188,255,.6);color: #fff;}
		</style>
	</head>
	<body>
		<div class="rs-ptlr50">
			<form class="form-horizontal" action="" method="post">
				<div class="form-group text-center">
					<label for="inlineRadio1" class="radio-inline col-xs-3 col-xs-offset-3 rs-radioC">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio1" class="rs-radio" value="option1">小学</label>
					<label for="inlineRadio2" class="radio-inline col-xs-3 rs-radioC">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio2" class="rs-radio" value="option2">中学</label>
				</div>
				<div class="col-xs-offset-1 col-xs-10">
					<div class="panel panel-default">
						<div class="panel-heading">辖区内生源报名日期</div>
						<div class="panel-body form-group">
			                <label for="startTime-in" class="col-xs-offset-2 control-label">开始报名日期<small class="rs-radioMsg"></small>：</label>
			                <div id="startTime-in" class="input-group date form_date col-xs-offset-2 col-xs-8" data-date="">
			                    <input class="form-control" size="16" type="text" value="" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
			                <label for="endTime-in" class="col-xs-offset-2 control-label">结束报名日期<small class="rs-radioMsg"></small>：</label>
			                <div id="endTime-in" class="input-group date form_date col-xs-offset-2 col-xs-8" data-date="">
			                    <input class="form-control" size="16" type="text" value="" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
						</div>
					</div>
				</div>
				<div class="col-xs-offset-1 col-xs-10">
					<div class="panel panel-default">
						<div class="panel-heading">辖区外生源报名日期</div>
						<div class="panel-body form-group">
			            	<label for="startTime-out" class="col-xs-offset-2 control-label">开始报名日期<small class="rs-radioMsg"></small>：</label>
			                <div id="startTime-out" class="input-group date form_date col-xs-offset-2 col-xs-8" data-date="">
			                    <input class="form-control" size="16" type="text" value="" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
			                <label for="endTime-out" class="col-xs-offset-2 control-label">结束报名日期<small class="rs-radioMsg"></small>：</label>
			                <div id="endTime-out" class="input-group date form_date col-xs-offset-2 col-xs-8" data-date="">
			                    <input class="form-control" size="16" type="text" value="" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
			            </div>
		            </div>
				</div>
				<div class="form-group text-center" style="padding-top: 25px;">
					<input class="btn btn-primary btn-lg col-xs-offset-4 col-xs-4" type="submit" value="提交" disabled/>
				</div>
			</form>
		</div>
		<script src="js/jquery-3.0.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
		<script>
			$('.form_date').datetimepicker({
		        language:  'zh-CN',
		        format: "yyyy-mm-dd",
		        weekStart: 0,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
		    });
		    $(function () {
		        var startTime_in = $('#startTime-in');
		        var endTime_in = $("#endTime-in");
		        var startTime_out = $('#startTime-out');
		        var endTime_out = $("#endTime-out");
		        //动态设置最小值(选择前面一个日期后：后面一个日期不能小于前面一个)
		        startTime_in.on('changeDate', function (e) {
		            endTime_in.datetimepicker('setStartDate', e.date);
		        });
		        startTime_out.on('changeDate', function (e) {
		            endTime_out.datetimepicker('setStartDate', e.date);
		        });
		        //动态设置最大值(选择后面一个日期后：前面一个日期不能大于前面一个）
		        endTime_in.on('changeDate', function (e) {
		            startTime_in.datetimepicker('setEndDate', e.date);
		        });
		        endTime_out.on('changeDate', function (e) {
		            startTime_out.datetimepicker('setEndDate', e.date);
		        });
		    });
		    //自定义单选效果
		    $(function(){
				$('.rs-radio').on("click",function(){
					$("input[name="+$(this).attr('name')+"]").parent().removeClass("rs-active");
					$(this).parent().addClass("rs-active");
					$('.rs-radioMsg').html("（"+$(this).parent().text()+"部分）");
					$('.btn').removeAttr("disabled");
				});
			});
		</script>
	</body>
</html>
