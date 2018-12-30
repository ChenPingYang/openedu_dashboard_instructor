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
				<div class="col-lg-12">
					<h1 class="page-header">課後問卷資料</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<%-- 			<%@ include file="searchDataByDate.jsp"%> --%>

			<div class="row">
				<div class="col-lg-12">
					<div>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr class="bg-info">
									<th>課程代碼</th>
									<th>課程名稱</th>
									<th>課程編號</th>
									<th>註冊總人數</th>
									<th>問卷填寫人數</th>
									<th>填寫比例</th>
									<th>課程內容滿意度</th>
									<th>平台功能的滿意度</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="testList" items="${data}">
									<tr>
										<td><a
											href="ChartDataServlet?mode=2&course=${testList[0]}"
											target="_blank">${testList[0]}</a></td>
										<td>${testList[1]}</td>
										<td>${testList[2]}</td>
										<td style="text-align: right;">${testList[3]}</td>
										<td style="text-align: right;">${testList[4]}</td>
										<td style="text-align: right;">${testList[5]}</td>
										<td style="text-align: right;">${testList[6]}</td>
										<td style="text-align: right;">${testList[7]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="./vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="./vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="./vendor/datatables/js/jquery.dataTables.js"></script>
	<script src="./vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script src="./vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="./dist/js/sb-admin-2.js"></script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>
</html>