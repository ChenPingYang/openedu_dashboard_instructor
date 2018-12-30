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
<meta http-equiv="Content-Type" content="text/html;">
<link rel="shortcut icon" href="img/favicon.png">
<title>中華開放教育平台</title>



<!-- Bootstrap Core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="./vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="./vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNInG: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<style>
#chartdiv_courseRadar {
	width: 100%;
	height: 300px;
}
</style>

<body>

	<%@ include file="sidebar.jsp"%>
	<div id="wrapper">

		<!-- Navigation -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-10">
					<h1 class="page-header">${courseName}</h1>
				</div>
			</div>
			
			
			
			<div class="row">
              <div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								每日註冊人數變化圖(${update_student_total_data } updated) <i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title="註冊人數日變化圖 "></i>
							</h3>
						</div>
						<div id="chartdiv_RegisteredPersons" style="width: 100%; height: 250px;"></div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								總註冊人數(${update_course_total_data } updated) <i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title="目前選修課程人數"></i>
							</h3>
						</div>
						<div class="panel-body">${totalRegisteredPersons}</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								退選人數(${update_course_total_data } updated) <i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title="選修課程但取消註冊之總人數"></i>
							</h3>
						</div>
						<div class="panel-body">${withDrew}</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								課程開始日期(${update_course_total_data } updated) 
							</h3>
						</div>
						<div class="panel-body">${start_date}</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								課程結束日期(${update_course_total_data } updated) 
							</h3>
						</div>
						<div class="panel-body">${end_date}</div>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">課程資訊雷達圖(${update_course_total_data } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-5">
									<div id="chartdiv_courseRadar"></div>
								</div>
								<div class="col-lg-7">
									<table style="width: 100%" class="table table-hover">
										<thead>
											<tr>
												<th>資料名</th>
												<th>全資料最大值</th>
												<th>雷達採用最大值</th>
												<th>雷達採用最大值落點</th>
												<th>平均資料真實數值</th>
												<th>本課程真實數值</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="testList" items="${RadarData}">
												<tr>
													<td>${testList[0] }</td>
													<td>${testList[1] }</td>
													<td>${testList[2] }</td>
													<td>${testList[3] }</td>
													<td>${testList[4] }</td>
													<td>${testList[5] }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<label>去極端值做法採用 Hampel identifier，平均資料是使用去極端值後產生出來的</label>
									<label>黃色區塊為本課程表現值，藍色為所有課程平均值</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
		
				<div class="row">
					<!-- /.col-lg-6 -->
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								登入人數折線圖(${update_login_data } updated) <i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title="登入人數折線圖"></i>
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div id="chartdiv_login" style="width: 100%; height: 400px;"></div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>
		</div>
	</div>
	
	
	<!-- amchart js -->
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/radar.js"></script>
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	
	<!-- jQuery -->
	<script src="./vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./dist/js/sb-admin-2.js"></script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->

	<!-- google chart JavaScript -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>

	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
	
	<script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip(); 
		});
	</script>

	<!-- chartdiv_courseRadar 課程雷達圖 -->
	<script>
    var chart = AmCharts.makeChart("chartdiv_courseRadar", {
        "type": "radar",
        "theme": "light",
        "dataProvider": [{
            "country": "註冊人數(%)",
            "litres": ${avg_registered_percent},
            "units": ${registered_percent}
        },  {
            "country": "練習題答對率\n(%)",
            "litres": ${avg_mobile_percent},
            "units": ${mobile_percent}
        }, {
            "country": "練習題作答率(%)",
            "litres": ${avg_test_percent},
            "units": ${test_percent}
        }, {
            "country": "影片觀看人數(%)",
            "litres":  ${avg_video_percent},
            "units": ${video_percent}
        }, {
            "country": "討論區討論次數\n(%)",
            "litres": ${avg_countVideo_percent},
            "units": ${countVideo_percent}
        }],
        "valueAxes": [{
            "axisTitleOffset": 20,
            "minimum": 0,
            "maximum": 100,
            "axisAlpha": 0.15
        }, {
            "id": "v2",
            "axisTitleOffset": 20,
            "minimum": 0,
            "axisAlpha": 0,
            "inside": true
        }],
        "startDuration": 2,
        "graphs": [{
            "balloonText": "[[value]] 為所有課程平均值",
            "bullet": "round",
            "valueField": "litres",
            "fillAlphas": 0.3,
            "bulletSize" : 1,
        }, {
            "balloonText": "[[value]] 為本課程表現值",
            "bullet": "square",
            "valueField": "units",
            "fillAlphas": 0.3,
            "bulletSize" : 1,
        }],
        "categoryField": "country"
    });
    </script>
    
	
	<!-- chartdiv_RegisteredPersons 註冊人數折線圖 -->
	<script>
	var chart = AmCharts.makeChart("chartdiv_RegisteredPersons", {
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
	    "chartCursor": {
	        "pan": true,
	        "valueLineEnabled": true,
	        "valueLineBalloonEnabled": true,
	        "cursorAlpha":1,
	        "cursorColor":"#258cbb",
	        "limitToGraph":"g1",
	        "valueLineAlpha":0.2,
	        "valueZoomable":true
	    },
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
	    "dataProvider": ${jsonArray_RegisteredPersons}
	});

	chart.addListener("rendered", zoomChart);

	zoomChart();

	function zoomChart() {
	    chart.zoomToIndexes(chart.dataProvider.length , chart.dataProvider.length - 1);
	}
    </script>

	<!-- chartdiv_login 課程登入折線圖  -->
    <script>
    var chart = AmCharts.makeChart("chartdiv_login", {
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
        "chartCursor": {
            "pan": true,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha":1,
            "cursorColor":"#258cbb",
            "limitToGraph":"g1",
            "valueLineAlpha":0.2,
            "valueZoomable":true
        },
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
        "dataProvider": ${jsonArray_temp}
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
</body>
</html>