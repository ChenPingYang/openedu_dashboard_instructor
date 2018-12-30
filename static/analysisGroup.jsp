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
			<div class="row">
				<div class="col-md-8">
					<h1 class="page-header">${courseName}</h1>
				</div>
				<div class="col-md-4">
					<div style="padding-top: 45px;">
						<form action="#" method="GET" name="form_findData">
							<select class="form-control" onchange="Change()" id="select"
								name="select" style="width: 250px">
								<option value="0">依照年齡為群組分析</option>
								<option value="1">依照學歷為群組分析</option>
								<option value="2">綜合分析</option>
							</select>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">影片觀看平均次數(${runDate_studentTotalData } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="watchcountAnalysisChart"
								style="width: 100%; height: 100%;"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">討論區發文平均次數(${runDate_studentTotalData } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="forumNumberAnalysisChart"
								style="width: 100%; height: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">學生資料分布圖(${runDate_studentTotalData } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form action="#" method="GET" name="form_findData1"></form>



							<ul class="nav nav-tabs">
								<li class="active"><a href="#watchGrade">觀看影片數目與成績分布圖<i
										data-toggle="tooltip" data-placement="top" title=""
										data-track-event="edx.bi.tooltip.displayed"
										class="ico ico-tooltip fa fa-info-circle has-tooltip"
										data-original-title="觀看影片數目與成績分布圖"></i></a></li>
								<li><a href="#ForumGrade">討論區發文數目與成績分布圖<i
										data-toggle="tooltip" data-placement="top" title=""
										data-track-event="edx.bi.tooltip.displayed"
										class="ico ico-tooltip fa fa-info-circle has-tooltip"
										data-original-title="討論區發文數目與成績分布圖"></i></a></li>

							</ul>
							<div class="tab-content">
								<!-- Tab panes -->
								<div class="tab-pane fade in active" id="watchGrade">
									<div id="div_WatchGrade">
										<div class="col-lg-8">
											<div id="scatterchart" style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均觀看影片數目</th>
														<th>平均成績</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgWatch_count_scatter}</td>
														<td>${avgTotal_grade_best}</td>

														<td>${gradeWatch}</td>
														<td>${degree_WatchGrade}</td>
													</tr>
												</tbody>
											</table>
										</div>

									</div>
									<div id="div_WatchGradeRemove">
										<div class="col-lg-8">
											<div id="scatterchart_Standard"
												style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均觀看影片數目</th>
														<th>平均成績</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgWatch_count_scatter_Correlation}</td>
														<td>${avgTotal_grade_best_Correlation}</td>

														<td>${StandardCorrelation_WatchGrade}</td>
														<td>${degree_StandardWatchGrade}</td>
													</tr>
												</tbody>
											</table>
										</div>

									</div>
									<div class="radio">
										<label><input type="radio" name="optradioWatchGrade"
											id="optradioWatchGrade" value="0"
											onchange="ChangeWatchGrade(0)">正常值</label> <label><input
											type="radio" name="optradioWatchGrade"
											id="optradioWatchGrade" value="1"
											onchange="ChangeWatchGrade(1)">移除極大與極小值</label>
									</div>
								</div>
								<div class="tab-pane fade  active" id="ForumGrade">
									<div id="div_ForumGrade">
										<div class="col-lg-8">
											<div id="scatterchart_Forum"
												style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均發文數</th>
														<th>平均成績</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgForum_num}</td>
														<td>${avgTotal_grade_best}</td>

														<td>${gradeForum}</td>
														<td>${degree_ForumGrade}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div id="div_ForumGradeRemove">
										<div class="col-lg-8">
											<div id="scatterchart_Forum_Standard"
												style="width: 100%; height: 250px;"></div>
										</div>
										<div class="col-lg-4">
											<table style="width: 100%" class="table table-hover">
												<thead>
													<tr>
														<th>平均發文數</th>
														<th>平均成績</th>
														<th>相關係數</th>
														<th>相關程度</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${avgForum_num_Correlation}</td>
														<td>${avgTotal_grade_Forum_Correlation}</td>

														<td>${StandardCorrelation_ForumGrade}</td>
														<td>${degree_StandardForumGrade}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class="radio">
										<label><input type="radio" name="optradio"
											id="optradio" value="0" onchange="ChangeForumGrade(0)">正常值</label>
										<label><input type="radio" name="optradio"
											id="optradio" value="1" onchange="ChangeForumGrade(1)">移除極大與極小值</label>
									</div>


								</div>
							</div>

							<!-- /.table-responsive -->

							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>



			</div>
		</div>
	</div>

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

	<script>
		document.form_findData.select.value = '${select}';
	</script>

	<!-- 條件改變時，請求servlet -->
	<script>
		function Change(select){
			var course = '${course}';
			document.location.href='AnalysisGroupServlet?course='+course+'&select='+document.form_findData.select.value;
		}
	</script>

	<!-- googleChart javascript for watchcountAnalysisChart -->
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ "Element", "平均次數", {role : "style"}], 
					[ "${colume[0]}", ${WatchCount[0]}, "#b87333"],
					[ "${colume[1]}", ${WatchCount[1]}, "#b87333"],
					[ "${colume[2]}", ${WatchCount[2]}, "#b87333"],
					[ "${colume[3]}", ${WatchCount[3]}, "#b87333"],
					[ "${colume[4]}", ${WatchCount[4]}, "#b87333"],
					[ "${colume[5]}", ${WatchCount[5]}, "#b87333"],
					[ "${colume[6]}", ${WatchCount[6]}, "#b87333"],
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
				}
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("watchcountAnalysisChart"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data, options);
		    });
		}
	</script>

	<!-- googleChart javascript for forumNumberAnalysisChart -->
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ "Element", "平均次數", {role : "style"}], 
					[ "${colume[0]}", ${forumNumber[0]}, "#b87333"],
					[ "${colume[1]}", ${forumNumber[1]}, "#b87333"],
					[ "${colume[2]}", ${forumNumber[2]}, "#b87333"],
					[ "${colume[3]}", ${forumNumber[3]}, "#b87333"],
					[ "${colume[4]}", ${forumNumber[4]}, "#b87333"],
					[ "${colume[5]}", ${forumNumber[5]}, "#b87333"],
					[ "${colume[6]}", ${forumNumber[6]}, "#b87333"],
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
					.getElementById("forumNumberAnalysisChart"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data, options);
		    });
		}
	</script>
	
	<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart_scatterchart);

    function drawChart_scatterchart() {
        var data = google.visualization.arrayToDataTable(${jsonArray_grade_count_scatter});

        var options = {
          
          	hAxis: {title: '觀看影片數目', titleTextStyle: {italic: false}},
          	vAxis: {title: '成績', titleTextStyle: {italic: false}},
          	tooltip:{textStyle:{fontSize:'15'}},
          	trendlines: {
            	0: {
                	type: 'linear',
                	showR2: true,
                	visibleInLegend: true
              	}
            }};

        var chart = new google.visualization.ScatterChart(document.getElementById('scatterchart'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
	    	chart.draw(data, options);
	    });
    }
    </script>

	<script type="text/javascript">
      	google.charts.load('current', {'packages':['corechart']});
      	google.charts.setOnLoadCallback(drawChart_scatterchart_Standard);

      	function drawChart_scatterchart_Standard() {
        	var data = google.visualization.arrayToDataTable(${Standard_gradeWatch});

        	var options = {
          
         	hAxis: {title: '觀看影片數目', titleTextStyle: {italic: false}},
          	vAxis: {title: '成績', titleTextStyle: {italic: false}},
          	tooltip:{textStyle:{fontSize:'15'}},
          	trendlines: {
              	0: {
                	type: 'linear',
                	showR2: true,
                	visibleInLegend: true
              	}
            }};

        var chart = new google.visualization.ScatterChart(document.getElementById('scatterchart_Standard'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
	    	chart.draw(data, options);
	    });
    }
    </script>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      	google.charts.load('current', {'packages':['corechart']});
      	google.charts.setOnLoadCallback(drawChart_scatterchart_Forum);

      	function drawChart_scatterchart_Forum() {
        	var data = google.visualization.arrayToDataTable(${jsonArray_grade_Forum_scatter});

        	var options = {
        		
         	hAxis: {title: '討論區發文數目', titleTextStyle: {italic: false}},
          	vAxis: {title: '成績', minValue: 0, maxValue: 100},
          	tooltip:{textStyle:{fontSize:'15'}},
          	trendlines: {
              	0: {
                	type: 'linear',
                	showR2: true,
                	visibleInLegend: true
              	}
            }
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('scatterchart_Forum'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
	    	chart.draw(data, options);
	    });
    }
    </script>
    
	<script type="text/javascript">
      	google.charts.load('current', {'packages':['corechart']});
      	google.charts.setOnLoadCallback(drawChart_scatterchart_Forum_Standard);

      	function drawChart_scatterchart_Forum_Standard() {
        	var data = google.visualization.arrayToDataTable(${Standard_gradeForum});

        	var options = {
        		
         	hAxis: {title: '討論區發文數目', titleTextStyle: {italic: false}},
          	vAxis: {title: '成績',titleTextStyle: {italic: false}},
          	tooltip:{textStyle:{fontSize:'15'}},
          	trendlines: {
              	0: {
                	type: 'linear',
                	showR2: true,
                	visibleInLegend: true
              	}
            }
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('scatterchart_Forum_Standard'));

        chart.draw(data, options);
        window.addEventListener("resize", function(){
	    	chart.draw(data, options);
	    });
    }
    </script>
    
	<script>
    	$(document).ready(function(){
    	    $(".nav-tabs a").click(function(){
    	        $(this).tab('show');
    	        
    	    });
    	});
    </script>
	<script>
	    div_ForumGradeRemove.style.display = 'none';
	    div_WatchGradeRemove.style.display = 'none';
	    
		function ChangeWatchGrade(select){
			if(select == '1'){
				div_WatchGradeRemove.style.display  = 'block';
				div_WatchGrade.style.display = 'none';
				drawChart_scatterchart_Standard();
			}
			else if(select == '0'){
				div_WatchGrade.style.display = 'block';
				div_WatchGradeRemove.style.display = 'none';
				drawChart_scatterchart();
				
			}
		}
		
		function ChangeForumGrade(select){
			if(select == '1'){
				div_ForumGradeRemove.style.display  = 'block';
				div_ForumGrade.style.display = 'none';
				drawChart_scatterchart_Forum_Standard();
			}
			else if(select == '0'){
				div_ForumGrade.style.display = 'block';
				div_ForumGradeRemove.style.display = 'none';
				drawChart_scatterchart_Forum();
			}
		}
	</script>
</body>

</html>
