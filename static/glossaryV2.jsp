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

<body>
<%@ include file="sidebar.jsp"%>
	<div id="wrapper">

		<!-- Navigation -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-12">
					<h1 class="page-header">名詞解釋</h1>
				</div>
				
			</div>
			<form action="#" method="get" name="form_showGlossary">
				<select class="form-control" onchange="chgSelect()" id="select" name="select">
					<c:forEach var="data" items="${option}">
						<option value="${data[0]}">${data[1]}</option>
					</c:forEach>
				</select>
			</form>
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-header">定義</h4>
				</div>
			</div>
			<div>
				${definition }
			</div>
			
			<c:if test="${haveCalculation == true}">
				<div class="row">
					<div class="col-md-12">
						<h4 class="page-header">計算方式</h4>
					</div>
				</div>
				<div>
					${calculation }
				</div>
			</c:if>
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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script>
	
	<!-- 若selectCourse內容經過改變，即傳送請求ChartDataServlet -->
	<script>
		function chgSelect()
		{	
			document.location.href='GlossaryServlet?id='+ document.getElementById("select").value;
		}
		document.form_showGlossary.select.value = '${id}';
	</script>
</body>
</html>