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


<style>
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

#donutchart,#chart,#chart_pass,#chart_video {
	width: 300px;
	height: 300px;
	font-family: Arial;
}

#donutchart {
	position: relative;
}

#labelOverlay {
	width: 90px;
	height: 45px;
	position: absolute;
	top: 125px;
	left: 105px;
	text-align: center;
	cursor: default;
}

#labelOverlay p {
	line-height: 0.3;
	padding: 0;
	margin: 8px;
}

#labelOverlay p.used-size {
	line-height: 0.5;
	font-size: 20pt;
	color: #8e8e8e;
}

#labelOverlay p.total-size {
	line-height: 0.5;
	font-size: 12pt;
	color: #cdcdcd;
}
</style>

</head>


<body>
	<%@ include file="sidebar.jsp"%>
	<div id="wrapper">

		<!-- Navigation -->

		<div id="page-wrapper">
			<div class="row"></div>
			<div class="row" style="padding-top:20px"> 
				<div class="col-lg-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								學生修課圓餅圖<i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title=""></i>
							</h3>
						</div>
						<div id="donutchart">
							<div id="chart" style="width: 100%; height: 100%;"></div>
							<div id="labelOverlay">
								<p class="used-size">
									${studentCourse}<span></span>
								</p>
								<p class="total-size">of ${totalCourse}</p>
							</div>
						</div>

						<div class="panel-body"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								取得證書課程圓餅圖<i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title=""></i>
							</h3>
						</div>
						<div id="donutchart">
							<div id="chart_pass" style="width: 100%; height: 100%;"></div>
							<div id="labelOverlay">
								<p class="used-size">
									${passCount}<span></span>
								</p>
								<p class="total-size">of ${studentCourse}</p>
							</div>
						</div>

						<div class="panel-body"></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								觀看課程影片數圓餅圖<i data-toggle="tooltip" data-placement="top" title=""
									data-track-event="edx.bi.tooltip.displayed"
									class="ico ico-tooltip fa fa-info-circle has-tooltip"
									data-original-title=""></i>
							</h3>
						</div>
						<div id="donutchart">
							<div id="chart_video" style="width: 100%; height: 100%;"></div>
							<div id="labelOverlay">
								<p class="used-size">
									${studentCourseVideo}<span></span>
								</p>
								<p class="total-size">of ${totalCourseVideo}</p>
							</div>
						</div>

						<div class="panel-body"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">學生資料表(${runDate } updated)</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<form action="#" name="form_findData" id="form_findData">
										<div class="radio">
											<label><input type="radio" name="optradio"
												id="optradio" value="0" onchange="Change(0)" CHECKED>全部</label> 
												
											<label><input type="radio" name="optradio" id="optradio" value="1"
												onchange="Change(1)">取得證書課程資料</label>
										</div>
									</form>
								</div>
								<div class="col-md-2 col-md-offset-4">
									<button type="button" class="btn btn-primary"
										onclick="download()"
										data-toggle="tooltip" data-placement="top"
										title="下載以下所有表格的學生資料，內容僅含選項篩選後結果，欄位新增信箱。">下載</button>
								</div>
							</div>


							<!-- Tab panes -->
							<div class="tab-content">
								<div id="tableCourse_div">
									<div class="tab-pane fade in active" id="registered_2017">
										<div id="table_div" style="width: 100%; height: 100%;"></div>
									</div>
								</div>
								<div id="tablePass_div">
									<div class="tab-pane fade in active" id="registered_2017">
										<div id="passtable_div" style="width: 100%; height: 100%;"></div>
									</div>
								</div>

								<!-- /.table-responsive -->
							</div>
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

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          
          ['影片問答題答對率超過50%人數比率',${count_person}],
          ['影片問答題答對率少於50%人數比率',${noHalfPerson}]
          
        ]);

        var options = {
        		tooltip: {textStyle:  {fontSize: 15,bold: false}}	,
        legend:{textStyle:{fontSize:'15'}}
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
        chart.draw(data, options);
      }
      </script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
      
        var data = new google.visualization.DataTable();
        
        data.addColumn('string', '姓名');     
        data.addColumn('string', '教育程度');     
        data.addColumn('number', '第一次作答的分數');  
        data.addColumn('number', '最佳作答分數');
        
        data.addRows(${jsonArray_grade});
     
        var table = new google.visualization.Table(document.getElementById('table_grade'));
        
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
        	      width: '100%', 
        		  height: '100%',
        	    pageSize:30
        	};
        table.draw(data,options);
      }
    </script>

	<script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable(${jsonArray_grade});
     
        var options = {
          title: '人數',
          curveType: 'function',
     
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTableCourse);

      function drawTableCourse() {
      
        var data = new google.visualization.DataTable();
        
        data.addColumn('string', '課程名稱');     
        data.addColumn('number', '討論次數');    
        data.addColumn('number', '觀看影片數'); 
        data.addColumn('number', '觀看影片數百分比'); 
        data.addColumn('number', '觀看影片次數'); 
       
       
        data.addColumn('number', '問答題完成率');  
        data.addColumn('number', '問答題答對率'); 
      

        
        data.addRows(${jsonArray_table});
        var formatter = new google.visualization.NumberFormat({pattern: '#%'});
     // format column 1 of the DataTable
      formatter.format(data, 3);
     formatter.format(data, 5);
     formatter.format(data, 6);
        var table = new google.visualization.Table(document.getElementById('table_div'));
        
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
        	      width: '100%', 
        		  height: '100%',
        	    pageSize:30
        	};
        table.draw(data,options);
      }
    </script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable_pass);

      function drawTable_pass() {
      
        var data = new google.visualization.DataTable();
        
        data.addColumn('string', '課程名稱');     
        data.addColumn('number', '討論次數');    
        data.addColumn('number', '觀看影片數'); 
        data.addColumn('number', '觀看影片數百分比'); 
        data.addColumn('number', '觀看影片次數'); 
       
       
        data.addColumn('number', '問答題完成率');  
        data.addColumn('number', '問答題答對率'); 
      

        
        data.addRows(${jsonArray_passCourse});
        var formatter = new google.visualization.NumberFormat({pattern: '#%'});
     // format column 1 of the DataTable
      formatter.format(data, 3);
     formatter.format(data, 5);
     formatter.format(data, 6);
        var table = new google.visualization.Table(document.getElementById('passtable_div'));
        
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
        	      width: '100%', 
        		  height: '100%',
        	    pageSize:30
        	};
        table.draw(data,options);
      }
    </script>
	<script>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Content', 'Size'],
			['已修習課程',${studentCourse}],
			['未修習課程', ${nonStudyCourse}],
		
		]);

		var options = {
			title: "",
			pieHole: 0.5,
			pieSliceBorderColor: "none",
	     colors: ['#66B3FF', '#CFCFCF', '#eaeaea' ],
			legend: {
				position: "none",	
			},
			pieSliceText: "none",
			
		};

		var chart = new google.visualization
				.PieChart(document.getElementById('chart'));
	        
		chart.draw(data, options);
	  
	}
	</script>
	
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Content', 'Size'],
			['已觀看影片數目',${studentCourseVideo}],
			['未觀看影片數目', ${nonWatchVideo}],
		
		]);

		var options = {
			title: "",
			pieHole: 0.5,
			pieSliceBorderColor: "none",
	     colors: ['#1E90FF', '#CFCFCF', '#eaeaea' ],
			legend: {
				position: "none",	
			},
			pieSliceText: "none",
			
		};

		var chart = new google.visualization
				.PieChart(document.getElementById('chart_video'));
	        
		chart.draw(data, options);
	  
	}
	</script>
	
	
	<script>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			['Content', 'Size'],
			['已取得證書數',${passCount}],
			['未取得證書數', ${nonPass}],
		
		]);

		var options = {
			title: "",
			pieHole: 0.5,
			pieSliceBorderColor: "none",
	     colors: ['#2894FF', '#CFCFCF', '#eaeaea' ],
			legend: {
				position: "none",	
			},
			pieSliceText: "none",
			
		};

		var chart = new google.visualization
				.PieChart(document.getElementById('chart_pass'));
	        
		chart.draw(data, options);
	  
	}
	</script>

	<!-- 若selectCourse內容經過改變，即傳送請求ChartDataServlet -->
	<script>
		function chgSelect()
		{	
			var select = document.getElementById("selectCourse").value;
			form_showChart.action = "ChartDataServlet?mode=1&course="+select;
			form_showChart.submit();
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
	tablePass_div.style.display = 'none';
	    
	    
		function Change(select){
			if(select == '1'){
				tablePass_div.style.display  = 'block';
				tableCourse_div.style.display = 'none';
				drawTable_pass();
			}
			else if(select == '0'){
				tableCourse_div.style.display = 'block';
				tablePass_div.style.display = 'none';
				drawTableCourse();
				
			}
		}
	</script>
	
	<script>
		function download(){
			var form = document.getElementById("form_findData");
			alert(444);
			//取得radio的值
			for (var i=0; i<form.optradio.length; i++)
			{
			   if (form.optradio[i].checked)
			   {
			      var optradio = form.optradio[i].value;
			      break;
			   }
			}
			
			document.location.href='DownloadStudentStudyServlet?userId='+ ${userId} +'&select='+optradio;
		}
	</script>
</body>
</html>