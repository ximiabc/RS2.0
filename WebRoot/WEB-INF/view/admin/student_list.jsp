<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>学生管理</title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="js/jquery-3.0.0.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="js/Formtext.js"></script>
		<style>
		    .rs-school-height{margin-top: 30px;padding-bottom:50px;}
		    .rs-school-btn{position: absolute;top: 30px;right: 20px;}
			.rs-school-spacing{margin:0 10px;}
			.rs-school-center{text-align: center;}
			.rs-school-nav{width: 400px;}
			.text{background-color: #00BBFF;}
			.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{line-height: 34px;}
			@media (max-width: 765px){.rs-school-btn{position:absolute;top:100px;}}
			/*重构 popover */
			.popover{border:1px solid #C00;color:#000;}
			.popover .popover-content{padding:1px 5px;}
			.popover.top>.arrow:after{border-top-color:#C00;}
		</style>
		</head>
	<body>
		<!--表单部分-->
		<div>
		<form class="form-inline rs-school-height">
			<!--表单查询及添加-->
			<div class="form-group col-lg-6 col-md-8 col-xs-8 col-sm-8 col-md-offset-4 col-sm-offset-2 col-xs-offset-4 col-lg-offset-6">
				<!--下拉选项框-->
				<select name="select_type" class="form-control col-md-2 col-sm-2 col-xs-2 rs-school-spacing">
					<option selected="selected" value="1">关联查询</option>
					<option value="2">学校编号</option>
		    		<option value="3">学校名称</option>
		    		<option value="4">学生编号</option>
		    		<option value="5">学生姓名</option>
		    		<option value="6">未报名</option>
		    		<option value="7">已报名</option>
		    		<option value="8">申请撤回</option>
				</select>
			    <input type="text" class="form-control col-md-2 col-sm-2 col-xs-2 col-lg-2 col-xs-2 rs-school-spacing" placeholder="number">
			    <button type="submit" class="btn btn-default col-sm-2 col-md-2 col-xs-2 rs-school-spacing" style="">检索</button>
			    </div>
		</form>
		<button type="submit" class="btn btn-default rs-school-btn" data-toggle="modal" data-target="#myModal-1">增加学生</button>
		</div>
		<!--数据表格部分--> 
		<div class="table-responsive col-xs-12 col-md-12">
			<table class="table table-striped table-bordered table-hover table-condensed rs-school-center">
				<thead>
					<tr class="info">
						<td>编号</td>
						<td>序列号</td>
						<td>姓名</td>
						<td>性别</td>
						<td>民族</td>
						<td>身份证号</td>
						<td>报名学校</td>
						<td>报名老师</td>
						<td>毕业学校</td>
						<td>家庭地址</td>
						<td>联系电话</td>
						<td>学生类型</td>
						<td>报名状态</td>
						<td>详细信息</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2016000015648484845</td>
						<td>张雨欣</td>
						<td>男</td>
						<td>汉族</td>
						<td>41060151548541517442</td>
						<td>实验小学</td>
						<td>周伟伟</td>
						<td>实验有认识</td>
						<td>事估计钙一个</td>
						<td>13456487224</td>
						<td>辖区内儿童</td>
						<td>已提交</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-3">详情</button></td>
						<td>
							<div class="rs-school-space">
							<input class="btn btn-default" type="submit" value="删除">
							<button class="btn btn-default" type="submit" data-toggle="modal" data-target="#myModal-2">更改</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2016000015648484845</td>
						<td>张雨欣</td>
						<td>男</td>
						<td>汉族</td>
						<td>41060151548541517442</td>
						<td>实验小学</td>
						<td>周伟伟</td>
						<td>实验有认识</td>
						<td>事估计钙一个</td>
						<td>13456487224</td>
						<td>辖区内儿童</td>
						<td>已提交</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-3">详情</button></td>
						<td>
							<div class="rs-school-space">
							<input class="btn btn-default" type="submit" value="删除">
							<button class="btn btn-default" type="submit" data-toggle="modal" data-target="#myModal-2">更改</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2016000015648484845</td>
						<td>张雨欣</td>
						<td>男</td>
						<td>汉族</td>
						<td>41060151548541517442</td>
						<td>实验小学</td>
						<td>周伟伟</td>
						<td>实验有认识</td>
						<td>事估计钙一个</td>
						<td>13456487224</td>
						<td>辖区内儿童</td>
						<td>已提交</td>
						<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-3">详情</button></td>
						<td>
							<div class="rs-school-space">
							<input class="btn btn-default" type="submit" value="删除">
							<button class="btn btn-default" type="submit" data-toggle="modal" data-target="#myModal-2">更改</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- Modal 1-->
		<div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">增加学生</h4>
				    </div>
				    <form class="form-horizontal" method="post">
					    <div class="modal-body">
					       	<div class="form-group col-sm-6">
								    <label for="inputText" class="col-sm-4 control-label">学生编号</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputText" placeholder="学生编号" data-vaild="^\d{5,20}$" data-errmsg="请填写正确，至少是6位的数字"/>
								    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生姓名*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="姓名" data-vaild="^[\u4e00-\u9fa5]{2,5}$" data-errmsg="姓名必须为2-5位的中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生性别*</label>
							    <div class="col-sm-8">
							         <select class="form-control">
						      	           <option value="男">男</option>
						      	           <option value="女">女</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生民族*</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	            <option value="汉族">汉族</option>
					 						<option value="蒙古族">蒙古族</option>
					 						<option value="彝族">彝族</option>
					 						<option value="侗族">侗族</option>
					 						<option value="哈萨克族">哈萨克族</option>
					 						<option value="畲族">畲族</option>
					 						<option value="纳西族">纳西族</option>
					 						<option value="仫佬族">仫佬族</option>
					 						<option value="仡佬族">仡佬族</option>
					 						<option value="怒族">怒族</option>
											<option value="保安族">保安族</option>
					 						<option value="鄂伦春族">鄂伦春族</option>
					 						<option value="回族">回族</option>
					 						<option value="壮族">壮族</option>
					 						<option value="瑶族">瑶族</option>
					 						<option value="傣族">傣族</option>
					 						<option value="高山族">高山族</option>
					 						<option value="景颇族">景颇族</option>
					 						<option value="羌族">羌族</option>
					 						<option value="锡伯族">锡伯族</option>
					 						<option value="乌孜别克族">乌孜别克族</option>
					 						<option value="裕固族">裕固族</option>
					 						<option value="赫哲族">赫哲族</option>
					 						<option value="藏族">藏族</option>
					 						<option value="布依族">布依族</option>
					 						<option value="白族">白族</option>
					 						<option value="黎族">黎族</option>
					 						<option value="拉祜族">拉祜族</option>
					 						<option value="柯尔克孜族">柯尔克孜族</option>
											<option value="布朗族">布朗族</option>
					 						<option value="阿昌族">阿昌族</option>
					 						<option value="俄罗斯族">俄罗斯族</option>
					 						<option value="京族">京族</option>
					 						<option value="门巴族">门巴族</option>
					 						<option value="维吾尔族">维吾尔族</option>
					 						<option value="朝鲜族">朝鲜族</option>
					 						<option value="土家族">土家族</option>
					 						<option value="傈僳族">傈僳族</option>
					 						<option value="水族">水族</option>
					 						<option value="土族">土族</option>
					 						<option value="撒拉族">撒拉族</option>
					 						<option value="普米族">普米族</option>
					 						<option value="鄂温克族">鄂温克族</option>
					 						<option value="塔塔尔族">塔塔尔族</option>
					 						<option value="珞巴族">珞巴族</option>
					 						<option value="苗族">苗族</option>
					 						<option value="满族">满族</option>
					 						<option value="哈尼族">哈尼族</option>
					 						<option value="佤族">佤族</option>
					 						<option value="东乡族">东乡族</option>
					 						<option value="达斡尔族">达斡尔族</option>
					 						<option value="毛南族">毛南族</option>
					 						<option value="塔吉克族">塔吉克族</option>
					 						<option value="德昂族">德昂族</option>
					 						<option value="独龙族">独龙族</option>
					 						<option value="基诺族">基诺族</option>
					 						<option value="其他">其它</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">身份证号*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="身份证" data-vaild="^[\dX]{18}$" data-errmsg="身份证号码格式错误，只能包含数字和字母X"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">报名学校*</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	           <option value="实验小学">实验小学</option>
						      	           <option value="新建路小学">新建路小学</option>
						      	           <option value="外国语小学">外国语小学</option>
						      	           <option value="金华小学">金华小学</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">入学前幼儿园</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="入学前幼儿园" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写入学前幼儿园，只能为中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">家庭地址*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="家庭地址" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写家庭住址，只能为中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">所在居委会</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="所在居委会" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写所在居委会，只能为中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1姓名*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人1姓名" data-vaild="^[\u4e00-\u9fa5]{2,5}$" data-errmsg="姓名必须为2-5位的中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1电话*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人1电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1身份证</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人1身份证" data-vaild="^[\dX]{18}$" data-errmsg="身份证号码格式错误，只能包含数字和字母X"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2姓名</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人2姓名" data-vaild="^[\u4e00-\u9fa5]{2,5}$" data-errmsg="姓名必须为2-5位的中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2电话</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人2电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2身份证</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人2身份证" placeholder="监护人2身份证" data-vaild="^[\dX]{18}$" data-errmsg="身份证号码格式错误，只能包含数字和字母X"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生类型</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	            <option value=0>辖区内儿童</option>
											<option value=1>非辖区儿童</option>
											<option value=2>留守儿童</option>
											<option value=3>三类儿童</option>
											<option value=4>外来务工子弟</option>
					                 </select>
							    </div>
							</div>
							<div class="modal-footer" style="border:none">
					        <input type="button" class="btn btn-default less" data-dismiss="modal" value="取消"/>
					        <input type="button" class="btn btn-primary less" value="确认添加"/>
				            </div>
					    </div>
		            </form>
			    </div>
			</div>
		
		</div>
		<!-- Modal 2-->
		<div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close less" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
				    </div>
				    <form class="form-horizontal">
					    <div class="modal-body">
					       	<div class="form-group col-sm-6">
								    <label for="inputText" class="col-sm-4 control-label">学生编号</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputText" placeholder="学生编号"data-vaild="^\d{5,20}$" data-errmsg="请填写正确，至少是6位的数字"/>
								    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生姓名*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="姓名" data-vaild="^[\u4e00-\u9fa5]{2,5}$" data-errmsg="姓名必须为2-5位的中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">性别*</label>
							    <div class="col-sm-8">
							         <select class="form-control">
						      	           <option value="男">男</option>
						      	           <option value="女">女</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">民族*</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	            <option value="汉族">汉族</option>
					 						<option value="蒙古族">蒙古族</option>
					 						<option value="彝族">彝族</option>
					 						<option value="侗族">侗族</option>
					 						<option value="哈萨克族">哈萨克族</option>
					 						<option value="畲族">畲族</option>
					 						<option value="纳西族">纳西族</option>
					 						<option value="仫佬族">仫佬族</option>
					 						<option value="仡佬族">仡佬族</option>
					 						<option value="怒族">怒族</option>
											<option value="保安族">保安族</option>
					 						<option value="鄂伦春族">鄂伦春族</option>
					 						<option value="回族">回族</option>
					 						<option value="壮族">壮族</option>
					 						<option value="瑶族">瑶族</option>
					 						<option value="傣族">傣族</option>
					 						<option value="高山族">高山族</option>
					 						<option value="景颇族">景颇族</option>
					 						<option value="羌族">羌族</option>
					 						<option value="锡伯族">锡伯族</option>
					 						<option value="乌孜别克族">乌孜别克族</option>
					 						<option value="裕固族">裕固族</option>
					 						<option value="赫哲族">赫哲族</option>
					 						<option value="藏族">藏族</option>
					 						<option value="布依族">布依族</option>
					 						<option value="白族">白族</option>
					 						<option value="黎族">黎族</option>
					 						<option value="拉祜族">拉祜族</option>
					 						<option value="柯尔克孜族">柯尔克孜族</option>
											<option value="布朗族">布朗族</option>
					 						<option value="阿昌族">阿昌族</option>
					 						<option value="俄罗斯族">俄罗斯族</option>
					 						<option value="京族">京族</option>
					 						<option value="门巴族">门巴族</option>
					 						<option value="维吾尔族">维吾尔族</option>
					 						<option value="朝鲜族">朝鲜族</option>
					 						<option value="土家族">土家族</option>
					 						<option value="傈僳族">傈僳族</option>
					 						<option value="水族">水族</option>
					 						<option value="土族">土族</option>
					 						<option value="撒拉族">撒拉族</option>
					 						<option value="普米族">普米族</option>
					 						<option value="鄂温克族">鄂温克族</option>
					 						<option value="塔塔尔族">塔塔尔族</option>
					 						<option value="珞巴族">珞巴族</option>
					 						<option value="苗族">苗族</option>
					 						<option value="满族">满族</option>
					 						<option value="哈尼族">哈尼族</option>
					 						<option value="佤族">佤族</option>
					 						<option value="东乡族">东乡族</option>
					 						<option value="达斡尔族">达斡尔族</option>
					 						<option value="毛南族">毛南族</option>
					 						<option value="塔吉克族">塔吉克族</option>
					 						<option value="德昂族">德昂族</option>
					 						<option value="独龙族">独龙族</option>
					 						<option value="基诺族">基诺族</option>
					 						<option value="其他">其它</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">出生年月</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="出生年月" data-vaild="^\d{4}\-\d{1,2}\-\d{1,2}$" data-errmsg="出生日期格式错误，格式：2000-1-1"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">身份证号*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="身份证号" data-vaild="^[\dX]{18}$" data-errmsg="身份证号码格式错误，只能包含数字和字母X"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">毕业学校</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="毕业学校" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写毕业学校，只能为中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">报名学校*</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	           <option value="实验小学">实验小学</option>
						      	           <option value="新建路小学">新建路小学</option>
						      	           <option value="外国语小学">外国语小学</option>
						      	           <option value="金华小学">金华小学</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">家庭地址*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="家庭地址" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="请填写家庭住址，只能为中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">所在居委会</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="所在居委会" data-vaild="^[\u4e00-\u9fa5]{2,30}$" data-errmsg="所在居委会，只能为中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1姓名*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人1姓名" data-vaild="^[\u4e00-\u9fa5]{2,5}$" data-errmsg="姓名必须为2-5位的中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1电话*</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人1电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1身份证</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人1身份证" placeholder="监护人1身份证" data-vaild="^[\dX]{18}$" data-errmsg="身份证号码格式错误，只能包含数字和字母X"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2姓名</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人2姓名" data-vaild="^[\u4e00-\u9fa5]{2,5}$" data-errmsg="姓名必须为2-5位的中文"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2电话</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人2电话" data-vaild="^(1[\d]{10}|0\d{2,3}\-\d{7,8})$" data-errmsg="联系电话格式错误"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2身份证</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="inputText" placeholder="监护人2身份证" placeholder="监护人1身份证" data-vaild="^[\dX]{18}$" data-errmsg="身份证号码格式错误，只能包含数字和字母X"/>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生类型</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	            <option>辖区内儿童</option>
											<option>非辖区儿童</option>
											<option>留守儿童</option>
											<option>三类儿童</option>
											<option>外来务工子弟</option>
					                 </select>
							    </div>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">报名状态</label>
							    <div class="col-sm-8">
							      <select class="form-control">
						      	            <option>未提交</option>
											<option>已提交</option>
											<option>申请撤回</option>
											<option>已撤回</option>
					                 </select>
							    </div>
							</div>
							<div class="modal-footer" style="border:none">
					        <input type="button" class="btn btn-default less" data-dismiss="modal" value="取消"/>
					        <input type="button" class="btn btn-primary less" value="确认添加"/>
				            </div>
					    </div>
		            </form>
			    </div>
			</div>
		</div>
		<!-- Modal 3-->
		<div class="modal fade" id="myModal-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">学生详细信息</h4>
				    </div>
				    <form class="form-horizontal">
					    <div class="modal-body">
					       	<div class="form-group col-sm-6">
								    <label for="inputText" class="col-sm-4 control-label">学生编号</label>
								    <label for="inputText" class="col-sm-4 control-label">216000062105478985</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生姓名</label>
							    <label for="inputText" class="col-sm-4 control-label">张宇说</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">性别</label>
							    <label for="inputText" class="col-sm-4 control-label">男</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">民族</label>
							    <label for="inputText" class="col-sm-4 control-label">汉族</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">身份证号</label>
							    <label for="inputText" class="col-sm-4 control-label">410106201005150034</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">报名学校</label>
							    <label for="inputText" class="col-sm-4 control-label">201600000621</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">入学前幼儿园</label>
							    <label for="inputText" class="col-sm-4 control-label">实验幼儿园</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">家庭地址</label>
							    <label for="inputText" class="col-sm-4 control-label">我凛真乌云社区</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">家庭电话</label>
							    <label for="inputText" class="col-sm-4 control-label">135255880563</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">所在居委会</label>
							    <label for="inputText" class="col-sm-4 control-label">老在和促进</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1姓名</label>
							    <label for="inputText" class="col-sm-4 control-label">张贝</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1电话</label>
							    <label for="inputText" class="col-sm-4 control-label">1362588062</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人1身份证</label>
							    <label for="inputText" class="col-sm-4 control-label">410121198009125432</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2姓名</label>
							     <label for="inputText" class="col-sm-4 control-label">陈伟欧</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2电话</label>
							    <label for="inputText" class="col-sm-4 control-label">13679850000</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">监护人2身份证</label>
							     <label for="inputText" class="col-sm-4 control-label">410121198009125432</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">学生类型</label>
							    <label for="inputText" class="col-sm-4 control-label">辖区内学生</label>
							</div>
							<div class="form-group col-sm-6">
							    <label for="inputText" class="col-sm-4 control-label">报名状态</label>
							    <label for="inputText" class="col-sm-4 control-label">已报名</label>
							</div>
							<div class="modal-footer" style="border:none">
					        <input type="button" class="btn btn-default less" data-dismiss="modal" value="返回"/>
					        <input type="button" class="btn btn-primary less" value="审核通过"/>
				            </div>
					    </div>
		            </form>
			    </div>
			</div>
		</div>
		<!--分页-->
		<script type="text/javascript">
              $("form").Vaild();
              //	清除提示
            	setInterval(function(){
            	if($('#myModal-1').css("display") == "block" || $('#myModal-2').css("display") == "block" || $('#myModal-3').css("display") == "block"){
					return true;
				}else{
				   posclear();
				}
				},100);
			
			$('.less').on('click',function(){
				posclear();
			});
			
			function posclear(){
				$('.popover').css('display','none');
				$('.modal-body .form-group').find("div").removeClass("has-error");
				$('.modal-body .form-group').find("div").removeClass("has-success");
			}
		</script>
		<div class="rs-school-nav center-block">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a href="#" aria-label="Previous"><span aria-hidden="true">首页</span></a></li>
			    <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			     <li><a href="#" aria-label="Previous"><span aria-hidden="true">尾页</span></a></li>
			  </ul>
			</nav>
		</div>
	</body>
</html>