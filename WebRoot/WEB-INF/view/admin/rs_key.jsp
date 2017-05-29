<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>报名模板管理</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			#rs-wrap{margin: 6%;}
			.drag-item{position: absolute;opacity: .8;}
			.placeholder{position:relative;border: 2px dashed rgba(0,188,255,.6);}
			.slot-item{padding-right:40px;line-height: 1;cursor: pointer;}
			.slot-item .glyphicon{
				position: absolute;top: 0;right: 0;padding: 10px 15px;
				transition: background-color .3s;
				-moz-transition: background-color .3s;
				-webkit-transition: background-color .3s;
				-o-transition: background-color .3s;
			}
			.slot-item .glyphicon:hover{background-color: rgba(0,188,255,.6);}
			.btn-group-justified  .glyphicon{top: 3px;}
		</style>
	</head>
	<body>
		<div id="rs-wrap">
			<div class="panel panel-default">
				<div class="panel-heading">报名字段管理</div>
				<div class="panel-body row">
					<div class="col-md-offset-1 col-md-2 col-xs-offset-0 col-xs-12">
						<div class="list-group row">
							<div class="col-md-12 col-xs-3">
								<button type="button" class="list-group-item">中学报名表字段（辖区内）</button>
							</div>
							<div class="col-md-12 col-xs-3">
								<button type="button" class="list-group-item">中学报名表字段（辖区外）</button>
							</div>
							<div class="col-md-12 col-xs-3">
								<button type="button" class="list-group-item">小学报名表字段（辖区内）</button>
							</div>
							<div class="col-md-12 col-xs-3">
								<button type="button" class="list-group-item">小学报名表字段（辖区外）</button>
							</div>
						</div>
					</div>
					<div class="col-md-offset-0 col-md-8 col-xs-offset-1 col-xs-10">
						<div class="btn-group btn-group-justified" role="group">
							<div class="btn-group" role="group">
								<button type="button" data-toggle="modal" data-target="#uploadModal" class="btn btn-default btn-info btn-lg">
									<span class="glyphicon glyphicon-download" aria-hidden="true"></span>
									上传报名表
								</button>
							</div>
							<div class="btn-group" role="group">
								<button id="rs-down" type="button" class="btn btn-default btn-info btn-lg">
									<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
									下载报名表
								</button>
							</div>
						</div>
						<button id="rs-saveItem" type="button" class="btn btn-warning btn-block hidden">保存</button>
						<div id="dragslot" class="slot">
							<ul id="slot-list" class="list-group slot-list text-center" style="margin-bottom: 0px;">
								<li class="list-group-item slot-item">姓名
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">性别
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">民族
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">身份证号
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">报名学校
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">入学前幼儿园
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">家庭地址
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">所在居委会
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">监护人1姓名
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">监护人1电话
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">监护人1身份证号
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">监护人2姓名
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">监护人2电话
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">监护人2身份证号
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
								<li class="list-group-item slot-item">学生类型
									<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>
								</li>
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
				<!--<div class="panel-footer clearfix"></div>-->
			</div>
		</div>
		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="uploadModalLabel">上传表格</h4>
					</div>
					<div class="modal-body">
						<input type="file" class="form-control">
					</div>
		    		<div class="modal-footer">
		    			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		    			<button type="button" id="rs-modalUp" class="btn btn-primary">上传</button>
		    		</div>
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
		<script>
			function itemListfunc(){
				//获取当前页面上字段名列表中的值
				var itemList = [];
				$('.slot-item').each(function(){
					itemList.push($.trim($(this).text()));
				});
				return itemList;
			}
			/*
			 * stopImmediatePropagation
			 * 阻止剩余的事件处理函数执行并且防止事件冒泡到DOM树上
			 */
			$('#slot-list').on('mousedown','.slot-item .glyphicon',function(e){
				e.stopImmediatePropagation();
				var slotItem = $(this).parent();
				$('#editModal').modal('show');
				//设置模态框中文本
				$('#rs-modalText').val($.trim(slotItem.text()));
				//点击删除，删除此节点
				$('#rs-modalDelete').click(function (e){
					e.stopImmediatePropagation();
					slotItem.remove();
					$('#editModal').modal('hide');
					$('#rs-down').prop("disabled",true);
					$('#rs-saveItem').removeClass("hidden");
					console.log(0-0);
					console.log('***');
				});
				//点击修改，修改此节点值
				$('#rs-modalEdit').click(function (e){
					e.stopImmediatePropagation();
					var editText = $('#rs-modalText').val();
					var itemList = [];
					itemList = itemListfunc();
					if($.inArray(editText,itemList) != -1){alert("已存在此字段名。");return;}
					slotItem.html(editText);
					slotItem.append('<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span>');
					$('#editModal').modal('hide');
					$('#rs-down').prop("disabled",true);
					$('#rs-saveItem').removeClass("hidden");
				});
			});
			//点击添加
			$('#rs-addItem').click(function(){
				var addText = $.trim($('#rs-addItemText').val());
				var itemList = [];
				itemList = itemListfunc();
				if(addText == ''){return;}
				if($.inArray(addText,itemList) != -1){alert("已存在此字段名。");return;}
				if($('.slot-item').length >= 40){alert("字段数量过多，无法添加。");return;}
				//缺少一套对添加字段的校验
				$('#slot-list').append('<li class="list-group-item slot-item">'+addText+
					'<span class="glyphicon glyphicon-edit pull-right" aria-hidden="true"></span></li>');
				$('#rs-addItemText').val('');
				$('#rs-down').prop("disabled",true);
				$('#rs-saveItem').removeClass("hidden");
			});
			//点击保存
			$('#rs-saveItem').click(function(){
				var itemList = [];
				itemList = itemListfunc();
				$('#rs-saveItem').addClass("hidden");
				$('#rs-down').prop("disabled",false);
			});
			jQuery(function($){
				$('#dragslot').dragslot({
					dropCallback: function(el){/*alert(el);*/}
				});
			});
		</script>
	</body>
</html>