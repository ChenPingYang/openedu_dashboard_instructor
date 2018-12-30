<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="img/favicon.png">
<title>中華開放教育平台</title>

<!-- Bootstrap Core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />

<!-- MetisMenu CSS -->
<link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="./dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="./vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- AmCharts CSS -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.navbar-center {
	display: inline-block;
	float: none;
	vertical-align: top;
}

.navbar-collapse-center {
	text-align: center;
}
</style>

</head>

<body>

	<%@ include file="sidebar.jsp"%>
	<div id="wrapper">

		<!-- Navigation -->

		<div id="page-wrapper">
		
			<div class="row">
				<div class="col-md-12">
					<h2 class="page-header">平台統計</h2>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<h3 class="page-header">歷年統計</h3>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年註冊人數 (latest)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_registeredYear"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年註冊學生性別 (latest)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_genderYear" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<h3 class="page-header">學員分布</h3>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">學歷分布 (latest)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_education" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">年齡分布 (latest)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_age" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">性別分布 (latest)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_gender" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-7">
					<h2 class="page-header">課程歷年統計</h2>
				</div>
				<div class="col-md-5">
					<div class="col-md-4">
						<div style="padding-top: 45px;">
							<label class="btn btn-primary"
								data-toggle="tooltip" data-placement="top"
								title="又稱長鬚圖，是一種表示資料的方法。從上到下依序為 1.全資料最大值 2.上四分位數 3.中位數 4.下四分位數 5.全資料最小值。 ">盒鬚圖 <span class="badge">?</span></label>
						</div>
					</div>
					<div class="col-md-8">
					
						<div style="padding-top: 45px;">
							<form action="#" method="GET" name="form_findData">
								<select class="form-control" onchange="Change()" id="select"
									name="select" style="width: 250px">
									<option value="0">僅自學課程</option>
									<option value="1">僅一般課程</option>
									<option value="2">自學課程及一般課程</option>
								</select>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年開課週數(固定只含一般課程)
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_durationWeek" style="width: 100%;height: 250px;"></div>
							<div id="chart_durationWeek_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_DW"
									id="radio_DW" value="0" onchange="Change_DW(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_DW" id="radio_DW" value="1"
									onchange="Change_DW(1)">標準化</label> 
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年所有註冊課程人次
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_RegisterCourseYear" style="width: 100%;height: 250px;"></div>
							<div id="chart_RegisterCourseYear_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_RCY"
									id="radio_RCY" value="0" onchange="Change_RCY(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_RCY" id="radio_RCY" value="1"
									onchange="Change_RCY(1)">標準化</label>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年課程影片觀看過半比例
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_WatchHalfYear" style="width: 100%; height: 250px;"></div>
							<div id="chart_WatchHalfYear_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_WHY"
									id="radio_WHY" value="0" onchange="Change_WHY(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_WHY" id="radio_WHY" value="1"
									onchange="Change_WHY(1)">標準化</label>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年課程作答過半比例
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_AnswerHalfYear" style="width: 100%; height: 250px;"></div>
							<div id="chart_AnswerHalfYear_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_AHY"
									id="radio_AHY" value="0" onchange="Change_AHY(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_AHY" id="radio_AHY" value="1"
									onchange="Change_AHY(1)">標準化</label>
							</div>

						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年平均課程退選率
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_DropYear" style="width: 100%; height: 250px;"></div>
							<div id="chart_DropYear_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_DY"
									id="radio_DY" value="0" onchange="Change_DY(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_DY" id="radio_DY" value="1"
									onchange="Change_DY(1)">標準化</label>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年所有課程討論區討論次數
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_NumberOfDiscussionsYear" style="width: 100%; height: 250px;"></div>
							<div id="chart_NumberOfDiscussionsYear_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_NODY"
									id="radio_NODY" value="0" onchange="Change_NODY(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_NODY" id="radio_NODY" value="1"
									onchange="Change_NODY(1)">標準化</label>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年平均課程影片數量
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_NumberOfMovieYear" style="width: 100%; height: 250px;"></div>
							<div id="chart_NumberOfMovieYear_removeExtrme" style="width: 100%; height: 250px;"></div>
							<div class="radio">
								<label><input type="radio" name="radio_NOMY"
									id="radio_NOMY" value="0" onchange="Change_NOMY(0)" CHECKED>正常值</label> <label><input
									type="radio" name="radio_NOMY" id="radio_NOMY" value="1"
									onchange="Change_NOMY(1)">標準化</label>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年開課數量
							(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_NumberOfCourseYear"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			
			
			<div class="row" style="margin-top: 20px">
				<div class="col-md-10">
					<h2 class="page-header">開課週數達兩個月以上分布圖</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">影片平均長度相關分布圖
							(${update_course_total_data } updated)</div>
						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#WatchHalfPercent">與學生影片觀看人數過半比例</a></li>
								<li><a href="#WatchPercent">與學生影片觀看人數比例</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="WatchHalfPercent">
									<div id="div_AML_WHP">
										<div class="col-lg-8">
											<div id="chart_AML_WHP" style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均影片長度</th>
														<th>平均觀看影片過半人數比例</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgAML}</td>
														<td>${avgWHP}</td>
														<td>${cc_AML_WHP_normal}</td>
														<td>${degree_AML_WHP_normal}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div id="div_AML_WHP_RE">
										<div class="col-lg-8">
											<div id="chart_AML_WHP_RE"
												style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均影片長度</th>
														<th>平均觀看影片過半人數比例</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgAML_RE}</td>
														<td>${avgWHP_RE}</td>
														<td>${cc_AML_WHP_RE}</td>
														<td>${degree_AML_WHP_RE}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-8">
											<div class="radio">
												<label><input type="radio" name="radio_AML_WHP"
													id="radio_AML_WHP" value="0" onchange="Change_AML_WHP(0)" CHECKED>正常值</label>
												<label><input type="radio" name="radio_AML_WHP"
													id="radio_AML_WHP" value="1" onchange="Change_AML_WHP(1)">移除極大與極小值</label>
											</div>
										</div>
									</div>
								</div>

								<!-- -------------------------------------------------------------------- -->

								<div class="tab-pane fade in " id="WatchPercent">
									<div id="div_AML_WP">
										<div class="col-lg-8">
											<div id="chart_AML_WP" style="width: 100%; height: 250px;"></div>

										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均影片長度</th>
														<th>平均觀看影片人數比例</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgAML}</td>
														<td>${avgWP}</td>
														<td>${cc_AML_WP_normal}</td>
														<td>${degree_AML_WP_normal}</td>
													</tr>
												</tbody>
											</table>
										</div>
										<script type="text/javascript"> drawChart_chart_AML_WP(); </script>
									</div>

									<div id="div_AML_WP_RE">
										<div class="col-lg-8">
											<div id="chart_AML_WP_RE" style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均影片長度</th>
														<th>平均觀看影片人數比例</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgAML_RE}</td>
														<td>${avgWP_RE}</td>
														<td>${cc_AML_WP_RE}</td>
														<td>${degree_AML_WP_RE}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-8">
											<div class="radio">
												<label><input type="radio" name="radio_AML_WP"
													id="radio_AML_WP" value="0" onchange="Change_AML_WP(0)" CHECKED>正常值</label>
												<label><input type="radio" name="radio_AML_WP"
													id="radio_AML_WP" value="1" onchange="Change_AML_WP(1)">移除極大與極小值</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- AmCharts js -->
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script
		src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

	<!-- jQuery -->
	<script src="./vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="./vendor/raphael/raphael.min.js"></script>
	<script src="./vendor/morrisjs/morris.min.js"></script>
	<script src="./data/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./dist/js/sb-admin-2.js"></script>

	<!-- Google chart JavaScript -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
		
	<!-- 預設選項 -->
	<script>
		document.form_findData.select.value = '${select}';
	</script>
	
	<!-- 條件改變時，請求servlet -->
	<script>
		function Change(select){
			document.location.href='analysisServlet?select='+document.form_findData.select.value;
		}
	</script>

	<!-- tab -->
	<script>
    	$(document).ready(function(){
    	    $(".nav-tabs a").click(function(){
    	        $(this).tab('show');
    	        
    	    });
    	});
    </script>
    
    <!-- 驚嘆號 -->
    <script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip(); 
		});
	</script>

	<!-- chart_registeredYear 歷年註冊人數-->
	<script>
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(${Json_registeredYear});

		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "", 
			bar : {
				groupWidth : "95%"
			},
			legend : {
				position : "none"
			},
			
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById("chart_registeredYear"));
		chart.draw(view, options);
		window.addEventListener("resize", function(){
	    	chart.draw(view, options);
	    });
	}
	</script>

	<!-- chart_NumberOfDiscussionsYear 歷年所有課程討論區討論次數-->
	<script>
	var chart = AmCharts.makeChart("chart_NumberOfDiscussionsYear", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "課程討論區討論次數",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "次數",
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_NumberOfDiscussionsYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	<!-- chart_NumberOfDiscussionsYear_removeExtrme 歷年所有課程討論區討論次數_標準化-->
	<script>
	var chart = AmCharts.makeChart("chart_NumberOfDiscussionsYear_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "課程討論區討論次數_標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "次數",
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_NumberOfDiscussionsYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>

	<!-- chart_NumberOfMovieYear 歷年課程影片數量-->
	<script>
	var chart = AmCharts.makeChart("chart_NumberOfMovieYear", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "課程影片數量",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "數量",
		    "maximum": 250,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_NumberOfMovieYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	<!-- chart_NumberOfMovieYear_removeExtrme 歷年課程影片數量_標準化-->
	<script>
	var chart = AmCharts.makeChart("chart_NumberOfMovieYear_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "課程影片數量_標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "數量",
		    "maximum": 250,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_NumberOfMovieYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>

	<!-- chart_numbersOfCourseYear 歷年開課數量-->
	<script>
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(${Json_numbersOfCourseYear});

		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "", 
			bar : {
				groupWidth : "95%"
			},
			legend : {
				position : "none"
			},
			
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById("chart_numbersOfCourseYear"));
		chart.draw(view, options);
		window.addEventListener("resize", function(){
	    	chart.draw(view, options);
	    });
	}
	</script>

	<!-- chart_genderYear 歷年註冊學生性別 -->
	<script>
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.load('current', {'packages':['bar']});
  	google.charts.setOnLoadCallback(drawChart);
  	
  	function drawChart() {
	  	var data = google.visualization.arrayToDataTable(${Json_genderYear});

	  	var options_fullStacked = {
	    	isStacked: 'percent',
	        legend: {position: 'top', maxLines: 3},
	        vAxis: {
	        	minValue: 0,
	            options_fullStacked ,
	            format: 'decimal'
	        }
	    };
    	var chart = new google.charts.Bar(document.getElementById('chart_genderYear'));
    	chart.draw(data, google.charts.Bar.convertOptions(options_fullStacked ));
    	window.addEventListener("resize", function(){
    		chart.draw(data, google.charts.Bar.convertOptions(options_fullStacked ));
	    });
  	}
    </script>

	<!-- chart_durationWeek 歷年開課週數平均_正常值-->
	<script type="text/javascript">
	var chart = AmCharts.makeChart("chart_durationWeek", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "歷年開課週數",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Yaer",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Duration Week",
		    "maximum": 80,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_DurationWeekYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
    </script>

	<!-- chart_durationWeek_removeExtrme 歷年開課週數平均_標準化-->
	<script type="text/javascript">
	var chart = AmCharts.makeChart("chart_durationWeek_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "歷年開課週數-標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Duration Week",
		    "maximum": 80,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_DurationWeekYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
    </script>

	<!-- chart_RegisterCourseYear 歷年註冊課程人次-->
	<script type="text/javascript">
	var chart = AmCharts.makeChart("chart_RegisterCourseYear", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "註冊課程人次",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "人次",
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_RegisterCourseYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
    </script>
    
    <!-- chart_RegisterCourseYear_removeExtrme 歷年註冊課程人次_標準化-->
	<script type="text/javascript">
	var chart = AmCharts.makeChart("chart_RegisterCourseYear_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "註冊課程人次_標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "人次",
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_RegisterCourseYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
    </script>

	<!-- chart_WatchHalfYear 影片觀看過半比例-->
	<script>
	var chart = AmCharts.makeChart("chart_WatchHalfYear", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "影片觀看過半比例",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Pecent(%)",
		    "maximum": 80,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_WatchHalfYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	<!-- chart_WatchHalfYear_removeExtrme 影片觀看過半比例_標準化-->
	<script>
	var chart = AmCharts.makeChart("chart_WatchHalfYear_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "影片觀看過半比例_標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Pecent(%)",
		    "maximum": 80,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_WatchHalfYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	
	<!-- chart_AnswerHalfYear 作答過半人數比例-->
	<script>
	var chart = AmCharts.makeChart("chart_AnswerHalfYear", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "作答過半人數比例",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Pecent(%)",
		    "maximum": 80,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_AnswerHalfYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	<!-- chart_AnswerHalfYear_removeExtrme 作答過半人數比例_標準化-->
	<script>
	var chart = AmCharts.makeChart("chart_AnswerHalfYear_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "作答過半人數比例_標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Pecent(%)",
		    "maximum": 80,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_AnswerHalfYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>

	<!-- chart_DropYear 退選率 -->
	<script>
	var chart = AmCharts.makeChart("chart_DropYear", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "退選率",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Pecent(%)",
		    "maximum": 40,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_DropYear},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	<!-- chart_DropYear_removeExtrme 退選率_標準化 -->
	<script>
	var chart = AmCharts.makeChart("chart_DropYear_removeExtrme", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "退選率_標準化",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "title": "Year",
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "Pecent(%)",
		    "maximum": 40,
		    "axisAlpha": 0,
		  }],
		  "dataProvider": ${Json_DropYear_RE},
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>

	<!-- chart_NumberOfCourseYear 歷年開課數量 -->
	<script>
	var chart = AmCharts.makeChart("chart_NumberOfCourseYear", {
	    "type": "serial",
		"theme": "light",
	    "legend": {
	        "horizontalGap": 10,
	        "maxColumns": 1,
	        "position": "right",
			"useGraphSettings": true,
			"markerSize": 10
	    },
	    "dataProvider": ${Json_NumberOfCourseYear}
	    ,
	    "valueAxes": [{
	        "stackType": "regular",
	        "axisAlpha": 0.3,
	        "gridAlpha": 0
	    }],
	    "graphs": [{
	        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
	        "fillAlphas": 0.8,
	        "labelText": "[[value]]",
	        "lineAlpha": 0.3,
	        "title": "自學課程",
	        "type": "column",
			"color": "#000000",
	        "valueField": "europe"
	    }, {
	        "balloonText": "<b>[[category]]</b><br><span style='font-size:14px'>[[title]]: <b>[[value]]</b></span>",
	        "fillAlphas": 0.8,
	        "labelText": "[[value]]",
	        "lineAlpha": 0.3,
	        "title": "一般課程",
	        "type": "column",
			"color": "#000000",
	        "valueField": "namerica"
	    }, ],
	    "categoryField": "year",
	    "categoryAxis": {
	        "gridPosition": "start",
	        "axisAlpha": 0,
	        "gridAlpha": 0,
	        "position": "left"
	    },
	    "export": {
	    	"enabled": true
	     }

	});
	</script>

	<!-- chart_education 學歷分布 -->
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				[ "Element", "人數", {role : "style"}], 
				['博士', ${education_p} , "#b87333"],
			    ['碩士', ${education_m} , "#50a4e5" ],
			    ['學士', ${education_b} , "silver" ],
			    ['副學士', ${education_a} , "gold" ],
			    ['高中', ${education_hs} , "#CC0000" ],
			    ['國中', ${education_jhs} , "#b87333" ],
			    ['國小', ${education_el} , "#50a4e5" ],
			    ['其他', ${education_other} , "#silver" ],
			]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "", 
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("chart_education"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data, options);
		    });
		}
	</script>

	<!-- chart_age 年齡分布 -->
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				[ "Element", "人數", {role : "style"}], 
				['<=15', ${age[0]} , "#b87333"],
			    ['16-19', ${age[1]} , "#50a4e5" ],
			    ['20-23', ${age[2]} , "silver" ],
			    ['24-27', ${age[3]} , "gold" ],
			    ['28-31', ${age[4]} , "#CC0000" ],
			    ['32-35', ${age[5]} , "#b87333" ],
			    ['>35', ${age[6]} , "#50a4e5" ],
			    ['其他', ${age[7]} , "#silver" ],
			]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "", 
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("chart_age"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data, options);
		    });
		}
	</script>

	<!-- chart_gender 性別分布 -->
	<script>
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
					[ '性別', '人數' ], 
					[ '男性', ${gender[0]}] ,
					[ '女性', ${gender[1]}] ,
					[ '其他', ${gender[2]}] ,
					]);

			var options = {
				title : ''
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('chart_gender'));

			chart.draw(data, options);
		 	window.addEventListener("resize", function(){
	        	chart.draw(data, options);
	        });
		}
	</script>

	<!-- chart_AML_WHP 影片平均長度 & 影片觀看過半人數比例 分布圖 _一般-->
	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart_chart_AML_WHP);

      function drawChart_chart_AML_WHP() {
        var data = google.visualization.arrayToDataTable(${Json_AML_WHP});

        var options = {
         
          hAxis: {title: '影片平均長度', titleTextStyle: {italic: false}},
          vAxis: {title: '影片觀看過半人數比例', titleTextStyle: {italic: false}},
          
          trendlines: {
              0: {
                type: 'linear',
               
                visibleInLegend: true
              }
            } 
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_AML_WHP'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
        	chart.draw(data, options);
	    });
      }
    </script>

	<!-- chart_AML_WHP_RE 影片平均長度 & 影片觀看過半人數比例 分布圖_標準化-->
	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart_chart_AML_WHP_RE);

      function drawChart_chart_AML_WHP_RE() {
        var data = google.visualization.arrayToDataTable(${Json_AML_WHP_RE});

        var options = {
         
          hAxis: {title: '影片平均長度', titleTextStyle: {italic: false}},
          vAxis: {title: '影片觀看過半人數比例', titleTextStyle: {italic: false}},
          
          trendlines: {
              0: {
                type: 'linear',
               
                visibleInLegend: true
              }
            } 
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_AML_WHP_RE'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
        	chart.draw(data, options);
	    });
      }
    </script>

	<!-- chart_AML_WP 影片平均長度 & 影片觀看人數比例 分布圖 _一般-->
	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart_chart_AML_WP);

      function drawChart_chart_AML_WP() {
        var data = google.visualization.arrayToDataTable(${Json_AML_WP});

        var options = {
         
          hAxis: {title: '影片平均長度', titleTextStyle: {italic: false}},
          vAxis: {title: '影片觀看人數比例', titleTextStyle: {italic: false}},
          
          trendlines: {
              0: {
                type: 'linear',
               
                visibleInLegend: true
              }
            } 
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_AML_WP'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
        	chart.draw(data, options);
	    });
      }
    </script>

	<!-- chart_AML_WP_RE 影片平均長度 & 影片觀看人數比例 分布圖_標準化-->
	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart_chart_AML_WHWPE);

      function drawChart_chart_AML_WP_RE() {
        var data = google.visualization.arrayToDataTable(${Json_AML_WP_RE});

        var options = {
         
          hAxis: {title: '影片平均長度', titleTextStyle: {italic: false}},
          vAxis: {title: '影片觀看人數比例', titleTextStyle: {italic: false}},
          
          trendlines: {
              0: {
                type: 'linear',
               
                visibleInLegend: true
              }
            } 
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_AML_WP_RE'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
        	chart.draw(data, options);
	    });
      }
    </script>


	<script type="text/javascript">
    	chart_durationWeek_removeExtrme.style.display = 'none';
    	chart_RegisterCourseYear_removeExtrme.style.display = 'none';
    	chart_WatchHalfYear_removeExtrme.style.display = 'none';
    	chart_AnswerHalfYear_removeExtrme.style.display = 'none';
    	chart_DropYear_removeExtrme.style.display = 'none';
    	chart_NumberOfDiscussionsYear_removeExtrme.style.display = 'none';
    	chart_NumberOfMovieYear_removeExtrme.style.display = 'none';
    	
    	div_AML_WHP_RE.style.display = 'none';
    	div_AML_WP_RE.style.display = 'none';
    	
    	//控制開課週數顯示
    	function Change_DW(select){
			if(select == '1'){
				chart_durationWeek.style.display = 'none';
				chart_durationWeek_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_durationWeek.style.display = 'block';
				chart_durationWeek_removeExtrme.style.display = 'none';
			}
		}
    	
    	//控制註冊課程人次顯示
    	function Change_RCY(select){
			if(select == '1'){
				chart_RegisterCourseYear.style.display = 'none';
				chart_RegisterCourseYear_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_RegisterCourseYear.style.display = 'block';
				chart_RegisterCourseYear_removeExtrme.style.display = 'none';
			}
		}
    	
    	//控制觀看過半顯示
    	function Change_WHY(select){
			if(select == '1'){
				chart_WatchHalfYear.style.display = 'none';
				chart_WatchHalfYear_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_WatchHalfYear.style.display = 'block';
				chart_WatchHalfYear_removeExtrme.style.display = 'none';
			}
		}
    	
    	//控制作答過半顯示
    	function Change_AHY(select){
			if(select == '1'){
				chart_AnswerHalfYear.style.display = 'none';
				chart_AnswerHalfYear_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_AnswerHalfYear.style.display = 'block';
				chart_AnswerHalfYear_removeExtrme.style.display = 'none';
			}
		}
    	
    	//控制退選率顯示
    	function Change_DY(select){
			if(select == '1'){
				chart_DropYear.style.display = 'none';
				chart_DropYear_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_DropYear.style.display = 'block';
				chart_DropYear_removeExtrme.style.display = 'none';
			}
		}
    	
    	//控制討論區討論次數顯示
    	function Change_NODY(select){
			if(select == '1'){
				chart_NumberOfDiscussionsYear.style.display = 'none';
				chart_NumberOfDiscussionsYear_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_NumberOfDiscussionsYear.style.display = 'block';
				chart_NumberOfDiscussionsYear_removeExtrme.style.display = 'none';
			}
		}
    	
    	//控制影片數目顯示
    	function Change_NOMY(select){
			if(select == '1'){
				chart_NumberOfMovieYear.style.display = 'none';
				chart_NumberOfMovieYear_removeExtrme.style.display = 'block';
			}
			else if(select == '0'){
				chart_NumberOfMovieYear.style.display = 'block';
				chart_NumberOfMovieYear_removeExtrme.style.display = 'none';
			}
		}
    	
    	function Change_AML_WHP(select){
			if(select == '1'){
				div_AML_WHP.style.display = 'none';
				div_AML_WHP_RE.style.display = 'block';
				drawChart_chart_AML_WHP_RE();
			}
			else if(select == '0'){
				div_AML_WHP.style.display = 'block';
				div_AML_WHP_RE.style.display = 'none';
				drawChart_chart_AML_WHP();
			}
		}
    	function Change_AML_WP(select){
			if(select == '1'){
				div_AML_WP.style.display = 'none';
				div_AML_WP_RE.style.display = 'block';
				drawChart_chart_AML_WP_RE();
			}
			else if(select == '0'){
				div_AML_WP.style.display = 'block';
				div_AML_WP_RE.style.display = 'none';
				drawChart_chart_AML_WP();
			}
		}
    </script>
</body>

</html>
