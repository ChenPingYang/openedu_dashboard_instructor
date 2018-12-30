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

<!-- Bootstrap Core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
	<div id="wrapper">
		<div class="row" style="padding: 20px 0px">
			<form action="#" method="POST" name="form_findData">
				<div class="col-lg-7">
					<div class="panel panel-primary" id="ageChartDiv">
						<div class="panel-heading">複合條件</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-md-4 ">
								<label for="bookdate">開課日期：</label> <input type="date"
									id="startDate" name="startDate" min="2014-09-14"
									value="${selectStartDate }" placeholder="2014-01-01"
									onchange="conditionChange()" class="form-control">
							</div>
							<div class="col-md-4">
								<label for="bookdate">日期範圍：</label> <select class="form-control"
									onchange="conditionChange()" id="select" name="select">
									<option value="1">-請選擇-</option>
									<option value="A">一個月內</option>
									<option value="B">半年內</option>
									<option value="C">一年內</option>
									<option value="D">全部</option>
								</select>
							</div>
							<div class="col-md-4">
								<div class="radio">
									<label><input type="radio" name="optradio"
										id="optradio" value="0" onchange="conditionChange()">開課中</label>
								</div>
								<div class="radio">
									<label><input type="radio" name="optradio"
										id="optradio" value="1" onchange="conditionChange()">全部課程</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-primary" id="ageChartDiv">
						<div class="panel-heading">單一條件</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
								<div class="radio">
									<label><input type="radio" name="optradio"
										id="optradio" value="2" onchange="conditionChange()">即將開課</label>
								</div>
								<div class="radio">
									<label><input type="radio" name="optradio"
										id="optradio" value="3" onchange="conditionChange()">已結束</label>
								</div>
						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
</body>
<script>
	var optradio = '${optradio}'
	document.form_findData.select.value = '${select}';
	document.form_findData.optradio[optradio].checked = true;
</script>
</html>