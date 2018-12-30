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

.cssHeaderRow {
	background-color: #2A94D6;
}

.cssTableRow {
	background-color: #F0F1F2;
}

.cssOddTableRow {
	background-color: #F0F1F2;
}

.cssSelectedTableRow {
	font-size: 20px;
	font-weight: bold;
}

.cssHoverTableRow {
	background: #ccc;
}

.cssHeaderCell {
	color: #FFFFFF;
	font-size: 16px;
	padding: 10px !important;
	border: solid 1px #FFFFFF;
}

.cssTableCell {
	font-size: 16px;
	padding: 10px !important;
	border: solid 1px #FFFFFF;
}

.cssRowNumberCell {
	text-align: center;
}
</style>

</head>

<body>

	<%@ include file="sidebar.jsp"%>
	<div id="wrapper">

		<!-- Navigation -->

		<div id="page-wrapper">

			<div class="row" style="padding-top: 30px">



















				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">已取得證書人數資料表</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="patternformat_div" style="width: 100%; height: 100%;"></div>
						</div>
						<!-- /.panel-body -->
					</div>

					<div class="panel panel-primary">
						<div class="panel-heading">近五年取得證書人次</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="chart_countWatch" style="width: 100%; height: 100%;"></div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">學生排名</div>
						<form action="#" method="GET" name="form_findData">
							<div class="radio" style="padding-left: 1cm">
								<label><input type="radio" name="optradio" id="optradio"
									value="0" onchange="Change(0)" CHECKED>修課數目排名</label> <label><input
									type="radio" name="optradio" id="optradio" value="1"
									onchange="Change(1)">證書數目排名</label>
							</div>
						</form>


						<!-- /.panel-heading -->
						<div id="div_course">
							<div class="panel-body">
								<div id="table_course" style="width: 100%; height: 100%;"></div>
							</div>
						</div>
						<div id="div_coursePass">
							<div class="panel-body">
								<div id="table_coursePass" style="width: 100%; height: 100%;"></div>
							</div>
						</div>


						<!-- /.panel-body -->
					</div>



				</div>









			</div>









			<!-- 	<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">歷年取得證書學生平均觀看影片比例</div>
						<!-- /.panel-heading -->
			<!-- 	<div class="panel-body">
							<form action="#" method="GET" name="form_findData1"></form>




							<div class="tab-content">
								<!-- Tab panes -->
			<!-- 			<div class="tab-pane fade in active" id="watch">
									<div id="div_Watch">
										<div class="col-lg-12">
											<div id="chart_avgWatch" style="width: 100%; height: 100%;"></div>
										</div>


									</div>


								</div>

							</div>

							<!-- /.table-responsive -->

			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
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

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>




	<script>
    	$(document).ready(function(){
    	    $(".nav-tabs a").click(function(){
    	        $(this).tab('show');
    	        
    	    });
    	});
    </script>

	<!-- chart_div_education -->














	<script>
    google.charts.load('current', {'packages':['table']});
    google.charts.setOnLoadCallback(drawTable);

   

        function drawTable() {
      var data = new google.visualization.DataTable();
  data.addColumn('string', '課程名稱');
  data.addColumn('string', '網址');
  data.addColumn('number', '證書人數');
  
  data.addRows(${jsonArray_table});

  var table = new google.visualization.Table(document.getElementById('patternformat_div'));
  
  
  var cssClassNames = {
		  'headerRow': 'cssHeaderRow',
          'tableRow': 'cssTableRow',
          'oddTableRow': 'cssOddTableRow',
          'selectedTableRow': 'cssSelectedTableRow',
          'hoverTableRow': 'cssHoverTableRow',
          'headerCell': 'cssHeaderCell',
          'tableCell': 'cssTableCell',
          'rowNumberCell': 'cssRowNumberCell'
      };
  
  options = {
  	    page: 'enable',
  	    cssClassNames: cssClassNames,
  	  showRowNumber: true,
  	  allowHtml: true,
  	      width: '100%', 
  		  height: '100%',
  	    pageSize:20
  	};

  
  
  
  
  
  var formatter = new google.visualization.PatternFormat(
  '<a href="{1}">{0}</a>');
// Apply formatter and set the formatted value of the first column.
   formatter.format(data, [0,1]);

var view = new google.visualization.DataView(data);
view.setColumns([0,2]); // Create a view with the first column only.

  
  


  table.draw(view,options);
        
    }
	</script>



	<script>
 
    
    
    google.charts.load('current', {'packages':['table']});
    google.charts.setOnLoadCallback(drawTable_course);

   

        function drawTable_course() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', '姓名');
      data.addColumn('string', '網址');
      data.addColumn('number', '總修課課程');
     
  
  data.addRows(${jsonArray_course});

  var table = new google.visualization.Table(document.getElementById('table_course'));
  
  
  var cssClassNames = {
		  'headerRow': 'cssHeaderRow',
          'tableRow': 'cssTableRow',
          'oddTableRow': 'cssOddTableRow',
          'selectedTableRow': 'cssSelectedTableRow',
          'hoverTableRow': 'cssHoverTableRow',
          'headerCell': 'cssHeaderCell',
          'tableCell': 'cssTableCell',
          'rowNumberCell': 'cssRowNumberCell'
      };
  
  options = {
  	    page: 'enable',
  	    cssClassNames: cssClassNames,
  	  showRowNumber: true,
  	  allowHtml: true,
  	      width: '100%', 
  		  height: '100%',
  	    pageSize:20
  	};

  
  
  
  
  
  var formatter = new google.visualization.PatternFormat(
  '<a href="{1}">{0}</a>');
// Apply formatter and set the formatted value of the first column.
   formatter.format(data, [0,1]);

var view = new google.visualization.DataView(data);
view.setColumns([0,2]); // Create a view with the first column only.

  
  


  table.draw(view,options);
        
    }
	</script>
	<script>
 
    
    
    google.charts.load('current', {'packages':['table']});
    google.charts.setOnLoadCallback(drawTable_pass);

   

        function drawTable_pass() {
      var data = new google.visualization.DataTable();
      data.addColumn('string', '姓名');
      data.addColumn('string', '網址');
      data.addColumn('number', '取得證書課程數');
     
  
  data.addRows(${jsonArray_pass});

  var table = new google.visualization.Table(document.getElementById('table_coursePass'));
  
  
  var cssClassNames = {
		  'headerRow': 'cssHeaderRow',
          'tableRow': 'cssTableRow',
          'oddTableRow': 'cssOddTableRow',
          'selectedTableRow': 'cssSelectedTableRow',
          'hoverTableRow': 'cssHoverTableRow',
          'headerCell': 'cssHeaderCell',
          'tableCell': 'cssTableCell',
          'rowNumberCell': 'cssRowNumberCell'
      };
  
  options = {
  	    page: 'enable',
  	    cssClassNames: cssClassNames,
  	  showRowNumber: true,
  	  allowHtml: true,
  	      width: '100%', 
  		  height: '100%',
  	    pageSize:20
  	};

  
  
  
  
  
  var formatter = new google.visualization.PatternFormat(
  '<a href="{1}">{0}</a>');
// Apply formatter and set the formatted value of the first column.
   formatter.format(data, [0,1]);

var view = new google.visualization.DataView(data);
view.setColumns([0,2]); // Create a view with the first column only.

  
  


  table.draw(view,options);
        
    }
	</script>













	<script>
	var chart = AmCharts.makeChart("chart_countCourseYear", {
	    "type": "serial",
		"theme": "light",
	    "legend": {
	        "horizontalGap": 10,
	        "maxColumns": 1,
	        "position": "right",
			"useGraphSettings": true,
			"markerSize": 10
	    },
	    "dataProvider": [{
	        "year": ${recentYear[0]},
	        "europe": ${countSelfCourseYear[0]},
	        "namerica": ${countNormalCourseYear[0]}
	       
	    }, {
	        "year":  ${recentYear[1]},
	        "europe": ${countSelfCourseYear[1]},
	        "namerica":  ${countNormalCourseYear[1]}
	       
	    }, {
	        "year":  ${recentYear[2]},
	        "europe":${countSelfCourseYear[2]},
	        "namerica": ${countNormalCourseYear[2]}
	      
	    },{
	        "year":  ${recentYear[3]},
	        "europe": ${countSelfCourseYear[3]},
	        "namerica":  ${countNormalCourseYear[3]}
	      
	    },{
	        "year":  ${recentYear[4]},
	        "europe": ${countSelfCourseYear[4]},
	        "namerica":  ${countNormalCourseYear[4]}
	      
	    }],
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

	<script>
	var chart = AmCharts.makeChart( "chartdiv_course", {
		  "type": "serial",
		  "theme": "light",
		  "dataProvider": ${jsonArray_temp},
		  "valueAxes": [ {
		    "gridColor": "#FFFFFF",
		    "gridAlpha": 0.2,
		    "dashLength": 0
		  } ],
		  "gridAboveGraphs": true,
		  "startDuration": 1,
		  "graphs": [ {
		    "balloonText": "[[category]]: <b>[[value]]</b>",
		    "fillAlphas": 0.8,
		    "lineAlpha": 0.2,
		    "type": "column",
		    "valueField": "value"
		  } ],
		  "chartCursor": {
		    "categoryBalloonEnabled": false,
		    "cursorAlpha": 0,
		    "zoomable": false
		  },
		  "categoryField": "courseName",
		  "categoryAxis": {
		    "gridPosition": "start",
		    "gridAlpha": 0,
		    "tickPosition": "start",
		    "tickLength": 20
		  },
		  "export": {
		    "enabled": true
		  }

		} );
	</script>
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart_avg_watch);
		function drawChart_avg_watch() {
			var data = google.visualization.arrayToDataTable([
				[ "Element", "平均觀看影片數目百分比", {role : "style"}], 
				['${recentYearDuration[0]}', ${avg_watch[0]} , "#b87333"],
			    ['${recentYearDuration[1]}', ${avg_watch[1]} , "#50a4e5" ],
			    ['${recentYearDuration[2]}', ${avg_watch[2]} , "silver" ],
			    ['${recentYearDuration[3]}', ${avg_watch[3]} , "gold" ],
			    ['${recentYearDuration[4]}', ${avg_watch[4]} , "#CC0000" ],
			    
			]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				
				bar : {
					groupWidth : "95%"
				},
				
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("chart_avgWatch"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data,google.charts.Line.convertOptions( options));
		    });
		}
	</script>
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart_avg_watch);
		function drawChart_avg_watch() {
			var data = google.visualization.arrayToDataTable([
				[ "Element", "人次", {role : "style"}], 
				['${recentYearDuration[0]}', ${count_watch[0]} , "#b87333"],
			    ['${recentYearDuration[1]}', ${count_watch[1]} , "#50a4e5" ],
			    ['${recentYearDuration[2]}', ${count_watch[2]} , "silver" ],
			    ['${recentYearDuration[3]}', ${count_watch[3]} , "gold" ],
			    ['${recentYearDuration[4]}', ${count_watch[4]} , "#CC0000" ],
			    
			]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				
				bar : {
					groupWidth : "95%"
				},
				
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("chart_countWatch"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data,google.charts.Line.convertOptions( options));
		    });
		}
	</script>
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart_avg_realWatch);
		function drawChart_avg_realWatch() {
			var data = google.visualization.arrayToDataTable([
				[ "Element", "平均觀看影片數目百分比", {role : "style"}], 
				['${recentYearDuration[0]}', ${avg_realWatch[0]} , "#b87333"],
			    ['${recentYearDuration[1]}', ${avg_realWatch[1]} , "#50a4e5" ],
			    ['${recentYearDuration[2]}', ${avg_realWatch[2]} , "silver" ],
			    ['${recentYearDuration[3]}', ${avg_realWatch[3]} , "gold" ],
			    ['${recentYearDuration[4]}', ${avg_realWatch[4]} , "#CC0000" ],
			    
			]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				
				bar : {
					groupWidth : "95%"
				},
				
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("chart_realWatch"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data,google.charts.Line.convertOptions( options));
		    });
		}
	</script>






	<script>
		var optradio = '${optradio}'
		document.form_findData.select.value = '${select}';
		document.form_findData.optradio[optradio].checked=true;
	</script>



	<script>
  
    div_WatchRemove.style.display = 'none';
    
   
		
		function ChangeWatch(select){
			if(select == '1'){
				div_WatchRemove.style.display  = 'block';
				div_Watch.style.display = 'none';
				drawChart_avg_realWatch();
			}
			else if(select == '0'){
				div_Watch.style.display = 'block';
				div_WatchRemove.style.display = 'none';
				
				drawChart_avg_watch();
			}
		}
		
		
		 </script>


	<script>
	div_coursePass.style.display = 'none';
	    
	    
		function Change(select){
			if(select == '1'){
				div_coursePass.style.display  = 'block';
				div_course.style.display = 'none';
				drawTable_pass();
			}
			else if(select == '0'){
				div_course.style.display = 'block';
				div_coursePass.style.display = 'none';
				drawTable_course();
				
			}
		}
		</script>
</body>

</html>
