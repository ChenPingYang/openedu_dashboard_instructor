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
<link href="./dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
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
					<h1 class="page-header">討論區資料</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<%@ include file="searchDataByDate.jsp"%>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-9">${finalUpdate}</div>
								<div class="col-md-3">
									<a id="dlink" style="display: none;"></a>
									<button type="button" class="btn btn-info "
										onclick="tableToExcel('dataTables-example', 'dataTables-example', 'BasicCourseData.xls')"
										data-toggle="tooltip" data-placement="top"
										title="下載以下的課程資料，內容欄位僅含此頁">下載此頁</button>
									<button type="button" class="btn btn-info"
										onclick="location.href='DownloadServlet?select=${select}&startDate=${selectStartDate_forDownload}&optradio=${optradio}&finalUpdate=${finalUpdate_forDownload}'"
										data-toggle="tooltip" data-placement="top"
										title="下載以下的課程資料，內容欄位含所有詳細資料">下載總表</button>
								</div>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="bg-info">
										<th>課程代碼</th>
										<th>課程編號</th>
										<th>課程名稱</th>
										<th>討論區討論次數</th>
										<th>討論區參與度</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="testList" items="${result}">
										<tr>
											<td><a
												href="ChartDataServlet?mode=2&course=${testList[0]}"
												target="_blank">${testList[0]}</a></td>
											<td><a
												href="https://courses.openedu.tw/courses/${testList[1]}/info"
												target="_blank">${testList[1]}</a></td>
											<td>${testList[2]}</td>
											<td style="text-align: right;">${testList[3]}</td>
											<td style="text-align: right;">${testList[4]}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
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

	<!-- download excel -->
	<script>
		function tableToExcel(table, name, filename) {
			var uri = 'data:application/vnd.ms-excel;base64,';

			var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office"'
               + '      xmlns:x="urn:schemas-microsoft-com:office:excel"'
               + '      xmlns="http://www.w3.org/TR/REC-html40">'
					+ '<head>'
					+ '<!--[if gte mso 9]>'
					+ '<xml>'
					+ '  <x:ExcelWorkbook>'
					+ '    <x:ExcelWorksheets>'
					+ '      <x:ExcelWorksheet>'
					+ '        <x:Name>{worksheet}</x:Name>'
					+ '        <x:WorksheetOptions>'
					+ '          <x:DisplayGridlines/>'
					+ '        </x:WorksheetOptions>'
					+ '      </x:ExcelWorksheet>'
					+ '    </x:ExcelWorksheets>'
					+ '  </x:ExcelWorkbook>'
					+ '</xml>'
					+ '<![endif]-->'
					+ '</head>'
					+ '<body>'
					+ '  <table>{table}</table>'
					+ '</body>' + '</html>';

			if (!table.nodeType)
				table = document.getElementById(table)

			var ctx = {
				worksheet : name || 'Worksheet',
				table : table.innerHTML
			}

			document.getElementById("dlink").href = uri
					+ base64(format(template, ctx));

			document.getElementById("dlink").download = filename;

			document.getElementById("dlink").click();

		}

		function base64(s) {
			return window.btoa(unescape(encodeURIComponent(s)))
		}

		function format(s, c) {
			return s.replace(/{(\w+)}/g, function(m, p) {
				return c[p];
			})
		}
	</script>

	<!-- 條件改變時，請求servlet -->
	<script>
		function conditionChange() {
			form_findData.action = "ForumDataServlet";
			form_findData.submit();
		}
	</script>

	<!-- tooltip -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
</body>
</html>