<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title></title>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			.rs-infoBox{position:relative;padding: 10px;margin-top:10px;}
			.rs-infoIcon{position: absolute;top:auto;bottom: 0;right: 10px;color: rgba(0,188,255,.6);font-size: 66px;z-index: 0;transition: all .3s linear;-moz-transition: all .3s linear;-webkit-transition: all .3s linear;-o-transition: all .3s linear;}
			.rs-infoBox:hover .rs-infoIcon{font-size: 88px;}
			.rs-pie .rs-infoBox{height: 400px;}
			@media (min-width: 768px){.rs-pie .rs-infoBox{height: 300px;}}
			@media (min-width: 992px){.rs-pie .rs-infoBox{height: 240px;}}
		</style>
		<!--[if lt IE 9]>
			<style type="text/css">
				.rs-infoIcon{color: rgb(0,188,255);}
			</style>
			<script src="js/respond.min.js" type="text/javascript" charset="utf-8"></script>
		<![endif]-->
	</head>
	<body>
		<!-- 教委视图 -->
		<c:if test="${currentUser.role.id == 1 }">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${primaryReal }/${primaryPlan }</h2>
							<p>小学报名指标</p>
							<span class="rs-infoIcon glyphicon glyphicon-stats" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${middleReal }/${middlePlan }</h2>
							<p>中学</p>
							<span class="rs-infoIcon glyphicon glyphicon-signal
							" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${primaryReal+middleReal }/${primaryPlan+middlePlan }</h2>
							<p>完成/计划人数总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-align-right" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2><fmt:formatNumber type="number" pattern="0.00" value="${((primaryReal+middleReal)/(primaryPlan+middlePlan)*100) }"/>%</h2>
							<p>报名总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-equalizer" aria-hidden="true"></span>
						</div>
					</div>
					<div class="rs-infoBox table-responsive col-md-6 col-xs-6">
						<table class="table table-striped table-bordered table-hover table-condensed">
							<caption class="text-center">小学各校报名信息统计统计</caption>
							<thead>
								<tr class="info">
									<td>学校名</td>
									<td>实际人数</td>
									<td>计划人数</td>
									<td>完成率（%）</td>
									<td>联系电话</td>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="primary">
								<tr>
									<td>${name }</td>
									<td>${belongSchool.size() }</td>
									<td>${num }</td>
									<td><fmt:formatNumber type="number" pattern="0.00" value="${(((belongSchool.size())/num)*100) }"/>%</td>
									<td>${phone }</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
					<!-- <div class="rs-pie table-responsive col-md-2 col-xs-6">
						<div class="rs-infoBox" id="container1"></div>
					</div> -->
					<div class="rs-infoBox table-responsive col-md-6 col-xs-6">
						<table class="table table-striped table-bordered table-hover table-condensed">
							<caption class="text-center">中学各校报名信息统计统计</caption>
							<thead>
								<tr class="info">
									<td>学校名</td>
									<td>实际人数</td>
									<td>计划人数</td>
									<td>完成率（%）</td>
									<td>联系电话</td>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="middle">
								<tr>
									<td>${name }</td>
									<td>${belongSchool.size() }</td>
									<td>${num }</td>
									<td><fmt:formatNumber type="number" pattern="0.00" value="${((belongSchool.size()/num)*100) }"/>%</td>
									<td>${phone }</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- 教委普通 -->
		<c:if test="${currentUser.role.id == 2 }">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${primaryReal }/${primaryPlan }</h2>
							<p>小学报名指标</p>
							<span class="rs-infoIcon glyphicon glyphicon-stats" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${middleReal }/${middlePlan }</h2>
							<p>中学</p>
							<span class="rs-infoIcon glyphicon glyphicon-signal
							" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${primaryReal+middleReal }/${primaryPlan+middlePlan }</h2>
							<p>完成/计划人数总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-align-right" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2><fmt:formatNumber type="number" pattern="0.00" value="${((primaryReal+middleReal)/(primaryPlan+middlePlan)*100) }"/>%</h2>
							<p>报名总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-equalizer" aria-hidden="true"></span>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- 学校 -->
		<c:if test="${currentUser.role.id == 3 }">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${school.belongSchool.size() }/${school.num }</h2>
							<p>完成/计划人数总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-align-right" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2><fmt:formatNumber type="number" pattern="0.00" value="${((school.belongSchool.size())/(school.num)*100) }"/>%</h2>
							<p>报名总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-equalizer" aria-hidden="true"></span>
						</div>
					</div>
					<div class="rs-infoBox table-responsive col-md-12 col-xs-6">
						<table class="table table-striped table-bordered table-hover table-condensed">
							<caption class="text-center">本校教师报名信息统计</caption>
							<thead>
								<tr class="info">
									<td>老师名</td>
									<td>报名人数</td>
									<td>联系电话</td>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="school.users">
								<tr>
									<td>${name }</td>
									<td>${belongTeacher.size() }</td>
									<td>${phone }</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- 教师 -->
		<c:if test="${currentUser.role.id == 4 }">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${primaryReal }/${primaryPlan }</h2>
							<p>小学报名指标</p>
							<span class="rs-infoIcon glyphicon glyphicon-stats" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${middleReal }/${middlePlan }</h2>
							<p>中学</p>
							<span class="rs-infoIcon glyphicon glyphicon-signal
							" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2>${primaryReal+middleReal }/${primaryPlan+middlePlan }</h2>
							<p>完成/计划人数总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-align-right" aria-hidden="true"></span>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="rs-infoBox bg-info">
							<h2><fmt:formatNumber type="number" pattern="0.00" value="${((primaryReal+middleReal)/(primaryPlan+middlePlan)*100) }"/>%</h2>
							<p>报名总比</p>
							<span class="rs-infoIcon glyphicon glyphicon-equalizer" aria-hidden="true"></span>
						</div>
					</div>
					<div class="rs-infoBox table-responsive col-md-6 col-xs-6">
						<table class="table table-striped table-bordered table-hover table-condensed">
							<caption class="text-center">小学各校报名信息统计统计</caption>
							<thead>
								<tr class="info">
									<td>学校名</td>
									<td>实际人数</td>
									<td>计划人数</td>
									<td>完成率（%）</td>
									<td>联系电话</td>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="primary">
								<tr>
									<td>${name }</td>
									<td>${belongSchool.size() }</td>
									<td>${num }</td>
									<td><fmt:formatNumber type="number" pattern="0.00" value="${(((belongSchool.size())/num)*100) }"/>%</td>
									<td>${phone }</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
					<!-- <div class="rs-pie table-responsive col-md-2 col-xs-6">
						<div class="rs-infoBox" id="container1"></div>
					</div> -->
					<div class="rs-infoBox table-responsive col-md-6 col-xs-6">
						<table class="table table-striped table-bordered table-hover table-condensed">
							<caption class="text-center">中学各校报名信息统计统计</caption>
							<thead>
								<tr class="info">
									<td>学校名</td>
									<td>实际人数</td>
									<td>计划人数</td>
									<td>完成率（%）</td>
									<td>联系电话</td>
								</tr>
							</thead>
							<tbody>
							<s:iterator value="middle">
								<tr>
									<td>${name }</td>
									<td>${belongSchool.size() }</td>
									<td>${num }</td>
									<td><fmt:formatNumber type="number" pattern="0.00" value="${((belongSchool.size()/num)*100) }"/>%</td>
									<td>${phone }</td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		
		<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/highcharts/highcharts.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/highcharts/exporting.js" type="text/javascript" charset="utf-8"></script>
		<!-- <script type="text/javascript">
			$(document).ready(function () {
			    // Build the chart
			    Highcharts.chart('container1', {
			        chart: {
			            plotBackgroundColor: null,
			            plotBorderWidth: null,
			            plotShadow: false,
			            type: 'pie'
			        },
			        title: {
			            text: '报名统计图'
			        },
			        tooltip: {
			            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: false
			                },
			                showInLegend: true
			            }
			        },
			        series: [{
			            name: '比例（百分比）',
			            colorByPoint: true,
			            data: [{
			                name: '报名人数',
			                y: 56.33
			            }, {
			                name: '未报名人数',
			                y: 24.03,
			                sliced: true,
			                selected: true
			            }]
			        }]
			    });
			    
			     Highcharts.chart('container2', {
			        chart: {
			            plotBackgroundColor: null,
			            plotBorderWidth: null,
			            plotShadow: false,
			            type: 'pie'
			        },
			        title: {
			            text: '报名统计图'
			        },
			        tooltip: {
			            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: false
			                },
			                showInLegend: true
			            }
			        },
			        series: [{
			            name: '比例（百分比）',
			            colorByPoint: true,
			            data: [{
			                name: '报名人数',
			                y: 56.33
			            }, {
			                name: '未报名人数',
			                y: 24.03,
			                sliced: true,
			                selected: true
			            }]
			        }]
			    });
			});
		</script> -->
	</body>
</html>
