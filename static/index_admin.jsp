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
				<div class="col-lg-3" >
					<div class="panel panel-red" id="div_RegisteredAll">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-user fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${registered_All}</div>
									<div>註冊總人數<br>(latest)</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-info" id="div_courseAll">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-book fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${course_All}</div>
									<div>課程總數<br>(${finalUpdate_course_total_data } updated)</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-green" id="div_todayLogin">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-user fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${todayLogin}</div>
									<div>今日登入人數<br>(latest)</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-yellow" id="div_studyingCourse">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-2">
									<i class="fa fa-book  fa-5x"></i>
								</div>
								<div class="col-xs-10 text-right">
									<div class="huge">${studyingCourse}</div>
									<div>開課中課程<br>(${finalUpdate_course_total_data } updated)</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">近一年登入人數與前年同期之人數 (${finalUpdate_recent_Year_Login } updated)
							<div class="pull-right">
                            	<i id="open_RYL" class="glyphicon glyphicon-triangle-bottom" onclick="openRYL()"></i>
                            	<i id="close_RYL" class="glyphicon glyphicon-triangle-top" onclick="closeRYL()"></i>
                            </div>
						</div>
						<!-- /.panel-heading -->
						<div id="div_recentYearLogin" class="panel-body">
							<label><font color="yellow">黃色</font>為最近一年資料，<font color="blue">藍色</font>為前年同一日期的資料</label>
							<div id="recentYearLogin" style="width: 100%; height: 400px;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary" style="height: 400px;">
						<div class="panel-heading">歷年註冊人數成長折線圖 (latest)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#registered_2017">2017</a></li>
								<li><a href="#registered_2016">2016</a></li>
								<li><a href="#registered_2015">2015</a></li>
								<li><a href="#registered_2014">2014</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="registered_2017">
									<div id="chart_div_2017" style="width: 100%; height: 250px;"></div>
								</div>
								<div class="tab-pane fade  active" id="registered_2016">
									<div id="chart_div_2016" style="width: 100%; height: 250px;"></div>
								</div>
								<div class="tab-pane fade  active" id="registered_2015">
									<div id="chart_div_2015" style="width: 100%; height: 250px;"></div>
								</div>
								<div class="tab-pane fade  active" id="registered_2014">
									<div id="chart_div_2014" style="width: 100%; height: 250px;"></div>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary ">
						<div class="panel-heading">最近一個月內課程登入人數排行 (${finalUpdate_course_total_data } updated)</div>
						<div class="panel-body">
							<table style="width: 100%" class="table table-hover">
								<thead>
									<tr>
										<th>課程名稱</th>
										<th>課程編號</th>
										<th>人數</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="testList" items="${courseLogin}">
										<tr>
											<td><a
												href="ChartDataServlet?mode=2&course=${testList[3]}"
												target="_blank">${testList[0] }</a></td>
											<td><a
												href="https://courses.openedu.tw/courses/${testList[1]}/info"
												target="_blank">${testList[1]}</a></td>
											<td>${testList[2] }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
	</div>


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

	<!-- chart_div_2014 -->
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		
		function drawChart() {
			var data_2014 = google.visualization.arrayToDataTable([
			    ['Year', '人數'],
			    ['五月', ${numberOfPeopleEveryMonth_2014[0]} ],
			    ['六月', ${numberOfPeopleEveryMonth_2014[1]} ],
			    ['七月', ${numberOfPeopleEveryMonth_2014[2]} ],
			    ['八月', ${numberOfPeopleEveryMonth_2014[3]} ],
			    ['九月', ${numberOfPeopleEveryMonth_2014[4]} ],
			    ['十月', ${numberOfPeopleEveryMonth_2014[5]} ],
			    ['十一月', ${numberOfPeopleEveryMonth_2014[6]} ],
			    ['十二月', ${numberOfPeopleEveryMonth_2014[7]} ]
		  	]);
		
			var options = {
			    hAxis: {titleTextStyle: {color: '#333'}},
			    vAxis: {minValue: 0}
			};
		
		  	var chart = new google.visualization.AreaChart(document.getElementById('chart_div_2014'));
		  	
		  	chart.draw(data_2014, options);
		  	window.addEventListener("resize", function(){
				chart.draw(data_2014, options);
			});
		}
   	</script>

	<!-- chart_div_2015 -->
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart_2015);
		
		function drawChart_2015() {
			var data_2015 = google.visualization.arrayToDataTable([
			    ['Year', '人數'],
			    ['一月', ${numberOfPeopleEveryMonth_2015[0]} ],
			    ['二月', ${numberOfPeopleEveryMonth_2015[1]} ],
			    ['三月', ${numberOfPeopleEveryMonth_2015[2]} ],
			    ['四月', ${numberOfPeopleEveryMonth_2015[3]} ],
			    ['五月', ${numberOfPeopleEveryMonth_2015[4]} ],
			    ['六月', ${numberOfPeopleEveryMonth_2015[5]} ],
			    ['七月', ${numberOfPeopleEveryMonth_2015[6]} ],
			    ['八月', ${numberOfPeopleEveryMonth_2015[7]} ],
			    ['九月', ${numberOfPeopleEveryMonth_2015[8]} ],
			    ['十月', ${numberOfPeopleEveryMonth_2015[9]} ],
			    ['十一月', ${numberOfPeopleEveryMonth_2015[10]} ],
			    ['十二月', ${numberOfPeopleEveryMonth_2015[11]} ]
		  	]);
			var options = {
				    hAxis: {titleTextStyle: {color: '#333'}},
				    vAxis: {minValue: 0}
				};
		  	var chart = new google.visualization.AreaChart(document.getElementById('chart_div_2015'));
		 	chart.draw(data_2015, options);
		  	window.addEventListener("resize", function(){
				chart.draw(data_2015, options);
			});
		}
   	</script>

	<!-- chart_div_2016 -->
	<script type="text/javascript">
	   	google.charts.load('current', {'packages':['corechart']});
	   	google.charts.setOnLoadCallback(drawChart_2016);
		
		function drawChart_2016() {
			var data_2016 = google.visualization.arrayToDataTable([
			    ['Year', '人數'],
			    ['一月', ${numberOfPeopleEveryMonth_2016[0]} ],
			    ['二月', ${numberOfPeopleEveryMonth_2016[1]} ],
			    ['三月', ${numberOfPeopleEveryMonth_2016[2]} ],
			    ['四月', ${numberOfPeopleEveryMonth_2016[3]} ],
			    ['五月', ${numberOfPeopleEveryMonth_2016[4]} ],
			    ['六月', ${numberOfPeopleEveryMonth_2016[5]} ],
			    ['七月', ${numberOfPeopleEveryMonth_2016[6]} ],
			    ['八月', ${numberOfPeopleEveryMonth_2016[7]} ],
			    ['九月', ${numberOfPeopleEveryMonth_2016[8]} ],
			    ['十月', ${numberOfPeopleEveryMonth_2016[9]} ],
			    ['十一月', ${numberOfPeopleEveryMonth_2016[10]} ],
			    ['十二月', ${numberOfPeopleEveryMonth_2016[11]} ]
		  	]);
			var options = {
				    hAxis: {titleTextStyle: {color: '#333'}},
				    vAxis: {minValue: 0}
				};
		  	var chart = new google.visualization.AreaChart(document.getElementById('chart_div_2016'));
		  	chart.draw(data_2016, options);
		  	window.addEventListener("resize", function(){
				chart.draw(data_2016, options);
			});
		}
   	</script>

	<!-- chart_div_2017 -->
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart_2017);
		
		function drawChart_2017() {
			var data_2017 = google.visualization.arrayToDataTable([
			    ['Year', '人數'],
			    ['一月', ${numberOfPeopleEveryMonth_2017[0]} ],
			    ['二月', ${numberOfPeopleEveryMonth_2017[1]} ],
			    ['三月', ${numberOfPeopleEveryMonth_2017[2]} ],
			    ['四月', ${numberOfPeopleEveryMonth_2017[3]} ],
			    ['五月', ${numberOfPeopleEveryMonth_2017[4]} ],
			    ['六月', ${numberOfPeopleEveryMonth_2017[5]} ],
			    ['七月', ${numberOfPeopleEveryMonth_2017[6]} ],
			    ['八月', ${numberOfPeopleEveryMonth_2017[7]} ],
			    ['九月', ${numberOfPeopleEveryMonth_2017[8]} ],
			    ['十月', ${numberOfPeopleEveryMonth_2017[9]} ]
		  	]);
			var options = {
				    hAxis: {titleTextStyle: {color: '#333'}},
				    vAxis: {minValue: 0}
				};
		  	var chart = new google.visualization.AreaChart(document.getElementById('chart_div_2017'));
		  	chart.draw(data_2017, options);
		  	window.addEventListener("resize", function(){
				chart.draw(data_2017, options);
			});
		}
    </script>

	<!-- 最近一年登入人數 -->
	<script>
    var chart = AmCharts.makeChart("recentYearLogin", {
        "type": "serial",
        "theme": "light",
        "marginRight": 40,
        "marginLeft": 40,
        "autoMarginOffset": 20,
        "mouseWheelZoomEnabled":true,
        "dataDateFormat": "YYYY-MM-DD",
        "valueAxes": [{
            "id": "v1",
            "axisAlpha": 0,
            "position": "left",
            "ignoreAxisWidth":true
        }],
        "balloon": {
            "borderThickness": 1,
            "shadowAlpha": 0
        },
        "graphs": [{
            "id": "g1",
            "balloon":{
              "drop":true,
              "adjustBorderColor":false,
              "color":"#ffffff"
            },
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "bulletColor": "#FFFFFF",
            "bulletSize": 5,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "title": "red line",
            "useLineColorForBulletBorder": true,
            "valueField": "value",
            "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
        },{
            "id": "g2",
            "balloon":{
              "drop":true,
              "adjustBorderColor":false,
              "color":"#ffffff"
            },
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "bulletColor": "#FFFFFF",
            "bulletSize": 5,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "title": "red line",
            "useLineColorForBulletBorder": true,
            "valueField": "value2",
            "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
        }],
        "chartScrollbar": {
            "graph": "g1",
            "oppositeAxis":false,
            "offset":30,
            "scrollbarHeight": 80,
            "backgroundAlpha": 0,
            "selectedBackgroundAlpha": 0.1,
            "selectedBackgroundColor": "#888888",
            "graphFillAlpha": 0,
            "graphLineAlpha": 0.5,
            "selectedGraphFillAlpha": 0,
            "selectedGraphLineAlpha": 1,
            "autoGridCount":true,
            "color":"#AAAAAA"
        },
        "chartCursor": [{
            "pan": true,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha":1,
            "cursorColor":"#258cbb",
            "limitToGraph":"g1",
            "valueLineAlpha":0.2,
            "valueZoomable":true
        },{
            "pan": true,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha":1,
            "cursorColor":"#258cbb",
            "limitToGraph":"g2",
            "valueLineAlpha":0.2,
            "valueZoomable":true
        }]
        
        ,
        "valueScrollbar":{
          "oppositeAxis":false,
          "offset":50,
          "scrollbarHeight":10
        },
        "categoryField": "date",
        "categoryAxis": {
            "parseDates": true,
            "dashLength": 1,
            "minorGridEnabled": true
        },
        "export": {
            "enabled": true
        },
        "dataProvider": ${recentYearLogin}
    });

    chart.addListener("rendered", zoomChart);

    zoomChart();

    function zoomChart() {
        chart.zoomToIndexes(chart.dataProvider.length , chart.dataProvider.length - 1);
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

	<!-- 驚嘆號圖示 -->
	<script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip(); 
		});
	</script>
	
	<!-- div_recentYearLogin 是否隱藏 -->
	<script>
		open_RYL.style.display = 'none';
		function openRYL(){
			close_RYL.style.display = 'block';
			open_RYL.style.display = 'none';
			div_recentYearLogin.style.display = 'block';
		}
		function closeRYL(){
			close_RYL.style.display = 'none';
			open_RYL.style.display = 'block';
			div_recentYearLogin.style.display = 'none';
		}
	
	</script>
</body>

</html>
