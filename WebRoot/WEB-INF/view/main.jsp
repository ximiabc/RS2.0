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
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3 col-xs-6">
					<div class="rs-infoBox bg-info">
						<h2>800/1200</h2>
						<p>小学</p>
						<span class="rs-infoIcon glyphicon glyphicon-stats" aria-hidden="true"></span>
					</div>
				</div>
				<div class="col-md-3 col-xs-6">
					<div class="rs-infoBox bg-info">
						<h2>1150/2000</h2>
						<p>中学</p>
						<span class="rs-infoIcon glyphicon glyphicon-user" aria-hidden="true"></span>
					</div>
				</div>
				<div class="col-md-3 col-xs-6">
					<div class="rs-infoBox bg-info">
						<h2>3200</h2>
						<p>计划人数</p>
						<span class="rs-infoIcon glyphicon glyphicon-stats" aria-hidden="true"></span>
					</div>
				</div>
				<div class="col-md-3 col-xs-6">
					<div class="rs-infoBox bg-info">
						<h2>70%</h2>
						<p>报名总比</p>
						<span class="rs-infoIcon glyphicon glyphicon-user" aria-hidden="true"></span>
					</div>
				</div>
				<div class="rs-infoBox table-responsive col-md-4 col-xs-6">
					<table class="table table-striped table-bordered table-hover table-condensed">
						<caption class="text-center">小学各校报名信息统计统计</caption>
						<thead>
							<tr class="info">
								<td>学校名</td>
								<td>实际人数</td>
								<td>计划人数</td>
								<td>完成率（%）</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>小红花</td>
								<td>205</td>
								<td>300</td>
								<td>72</td>
							</tr>
							<tr>
								<td>小红花</td>
								<td>205</td>
								<td>300</td>
								<td>72</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="rs-pie table-responsive col-md-2 col-xs-6">
					<div class="rs-infoBox" id="container1"></div>
				</div>
				<div class="rs-infoBox table-responsive col-md-4 col-xs-6">
					<table class="table table-striped table-bordered table-hover table-condensed">
						<caption class="text-center">中学各校报名信息统计统计</caption>
						<thead>
							<tr class="info">
								<td>学校名</td>
								<td>实际人数</td>
								<td>计划人数</td>
								<td>完成率（%）</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>大红花</td>
								<td>205</td>
								<td>300</td>
								<td>72</td>
							</tr>
							<tr>
								<td>小红花</td>
								<td>205</td>
								<td>300</td>
								<td>72</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="rs-pie table-responsive col-md-2 col-xs-6">
					<div class="rs-infoBox" id="container2"></div>
				</div>
			</div>
		</div>
		<script src="js/jquery-3.0.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/highcharts/highcharts.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/highcharts/exporting.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
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
		</script>
	</body>
</html>
