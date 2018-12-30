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
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">單元觀看人數</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="table_course" style="width: 100%; height: 400px;"></div>
						</div>
						<!-- /.panel-body -->
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

	

	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
    google.charts.setOnLoadCallback(drawTable_course);

    function drawTable_course() {
      	var data = new google.visualization.DataTable();
      	data.addColumn('string', '章節名稱');
		data.addColumn('string', '影片名稱');
		data.addColumn('string', '網址');
		data.addColumn('number', '觀看人數');
		data.addRows(${jsonArray_sequential_name});
	
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
   		formatter.format(data, [1,2]);

		var view = new google.visualization.DataView(data);
		view.setColumns([0,1,3]); // Create a view with the first column only.

  		table.draw(view,options);
        
    }
	</script>

</body>

</html>
