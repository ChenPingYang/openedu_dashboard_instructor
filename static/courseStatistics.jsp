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


<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />


<!-- w3school  -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Bootstrap Core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="./dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="./vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">註冊人數</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_registeredPersons"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">註冊人數-標準化。平均：${avg_registeredPersons} 標準差：${sdd_registeredPersons}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_registeredPersons"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">課程影片數目</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_courseNumberOfVideos"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">課程影片數目_標準化。平均：${avg_courseNumberOfVideos} 標準差：${sdd_courseNumberOfVideos}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_courseNumberOfVideos"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">練習題數量</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_numberOfTestQuestions"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">練習題數量_標準化。平均：${avg_numberOfTestQuestions} 標準差：${sdd_numberOfTestQuestions}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_numberOfTestQuestions"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">討論區發文數</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_numbersOfPostInForum"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">討論區發文數_標準化。平均：${avg_numbersOfPostInForum} 標準差：${sdd_numbersOfPostInForum}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_numbersOfPostInForum"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">課程登入人次</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_courseLoginCount"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">課程登入人次_標準化。平均：${avg_courseLoginCount} 標準差：${sdd_courseLoginCount}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_courseLoginCount"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">影片觀看次數</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_timesOfVideosViewed"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">影片觀看次數_標準化。平均：${avg_timesOfVideosViewed} 標準差：${sdd_timesOfVideosViewed}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_timesOfVideosViewed"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">總作答數</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_totalTestAnswerNumber"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">總作答數_標準化。平均：${avg_totalTestAnswerNumber} 標準差：${sdd_totalTestAnswerNumber}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_totalTestAnswerNumber"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">討論區回應數</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_numberOfForumAreas"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">討論區回應數_標準化。平均：${avg_numberOfForumAreas} 標準差：${sdd_numberOfForumAreas}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_numberOfForumAreas"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">人數指標</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_c1" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">人數指標_標準化。平均：${avg_c1} 標準差：${sdd_c1}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_c1" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">登入指標</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_c2" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">登入指標_標準化。平均：${avg_c2} 標準差：${sdd_c2}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_c2" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-影片觀看度</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_c3_v" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-影片觀看度-標準化。平均：${avg_c3_v} 標準差：${sdd_c3_v}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_c3_v" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-作答度</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_c3_q" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-作答度-標準化。平均：${avg_c3_q} 標準差：${sdd_c3_q}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_c3_q" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-討論度-</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_c3_f" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-討論度-標準化。平均：${avg_c3_f} 標準差：${sdd_c3_f}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_c3_f" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_c3" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">參與指標-標準化。平均：${avg_c3} 標準差：${sdd_c3}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_c3" style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

			<div class="row" style="padding-top: 20px;">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">熱門參與度</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_Participation"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">熱門參與度-標準化。平均：${avg_Participation} 標準差：${sdd_Participation}</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_sd_Participation"
								style="width: 100%; height: 250px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>

		</div>


	</div>

	<!-- amChart -->
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



	<!-- chart_registeredPersons -->
	<script>
	var chart = AmCharts.makeChart("chart_registeredPersons", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_registeredPersons} ,
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "Try"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_courseNumberOfVideos -->
	<script>
	var chart = AmCharts.makeChart("chart_courseNumberOfVideos", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_courseNumberOfVideos},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "課程影片數目"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_numberOfTestQuestions -->
	<script>
	var chart = AmCharts.makeChart("chart_numberOfTestQuestions", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_numberOfTestQuestions},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "練習題數量"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_numbersOfPostInForum -->
	<script>
	var chart = AmCharts.makeChart("chart_numbersOfPostInForum", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_numbersOfPostInForum},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "討論區發文數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_courseLoginCount -->
	<script>
	var chart = AmCharts.makeChart("chart_courseLoginCount", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_courseLoginCount},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "登入次數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_timesOfVideosViewed -->
	<script>
	var chart = AmCharts.makeChart("chart_timesOfVideosViewed", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_timesOfVideosViewed},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "影片觀看人次"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_totalTestAnswerNumber -->
	<script>
	var chart = AmCharts.makeChart("chart_totalTestAnswerNumber", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_totalTestAnswerNumber},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "總作答數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_numberOfForumAreas -->
	<script>
	var chart = AmCharts.makeChart("chart_numberOfForumAreas", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_numberOfForumAreas},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "討論區回應數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_c1 -->
	<script>
	var chart = AmCharts.makeChart("chart_c1", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_c1},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "人數指標"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_c2 -->
	<script>
	var chart = AmCharts.makeChart("chart_c2", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_c2},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "登入指標"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_c3_v -->
	<script>
	var chart = AmCharts.makeChart("chart_c3_v", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_c3_v},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標-影片觀看度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_c3_q -->
	<script>
	var chart = AmCharts.makeChart("chart_c3_q", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_c3_q},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標-作答度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_c3_f -->
	<script>
	var chart = AmCharts.makeChart("chart_c3_f", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_c3_f},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標-討論度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_c3 -->
	<script>
	var chart = AmCharts.makeChart("chart_c3", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_c3},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_Participation -->
	<script>
	var chart = AmCharts.makeChart("chart_Participation", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_Participation},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "熱門參與度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- 標準化 -->

	<!-- chart_sd_registeredPersons -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_registeredPersons", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_registeredPersons} ,
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "Try"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_courseNumberOfVideos -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_courseNumberOfVideos", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_courseNumberOfVideos},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "課程影片數目"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_numberOfTestQuestions -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_numberOfTestQuestions", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_numberOfTestQuestions},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "練習題數量"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_numbersOfPostInForum -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_numbersOfPostInForum", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_numbersOfPostInForum},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "討論區發文數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_courseLoginCount -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_courseLoginCount", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_courseLoginCount},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "登入次數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_timesOfVideosViewed -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_timesOfVideosViewed", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_timesOfVideosViewed},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "影片觀看人次"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_totalTestAnswerNumber -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_totalTestAnswerNumber", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_totalTestAnswerNumber},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "總作答數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_numberOfForumAreas -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_numberOfForumAreas", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_numberOfForumAreas},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "討論區回應數"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_c1 -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_c1", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_c1},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "人數指標"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_c2 -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_c2", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_c2},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "登入指標"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_c3_v -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_c3_v", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_c3_v},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標-影片觀看度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_c3_q -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_c3_q", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_c3_q},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標-作答度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_c3_f -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_c3_f", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_c3_f},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標-討論度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_c3 -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_c3", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_c3},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "參與指標"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>

	<!-- chart_sd_Participation -->
	<script>
	var chart = AmCharts.makeChart("chart_sd_Participation", {
		  "type": "serial",
		  "theme": "light",
		  "columnWidth": 1,
		  "dataProvider": ${Json_sd_Participation},
		  "graphs": [{
		    "fillColors": "#c55",
		    "fillAlphas": 0.9,
		    "lineColor": "#fff",
		    "lineAlpha": 0.7,
		    "type": "column",
		    "valueField": "count"
		  }],
		  "categoryField": "category",
		  "categoryAxis": {
		    "startOnAxis": true,
		    "title": "熱門參與度"
		  },
		  "valueAxes": [{
		    "title": "Count"
		  }]
		});
	</script>


</body>

</html>
