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
					<h1 class="page-header">名詞解釋</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-12">名詞解釋</div>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th width="30%">名詞</th>
										<th width="40%">意義</th>
										<th width="40%">計算方式</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>開課日期</td>
										<td>課程開放註冊的日期</td>
										<td></td>
									</tr>
									<tr>
										<td>結束日期</td>
										<td>課程結束的日期</td>
										<td></td>
									</tr>
									<tr>
										<td>註冊人數</td>
										<td>選修課程總人數，需扣除曾選修但取消註冊之人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>授課週數</td>
										<td>課程開課期間經過了幾週</td>
										<td></td>
									</tr>
									<tr>
										<td>註冊人數_臺灣</td>
										<td>依臺灣選修課程人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>註冊人數_非臺灣</td>
										<td>依非臺灣選修課程人數。</td>
										<td></td>
									</tr>

									<tr>
										<td>退選人數</td>
										<td>選修課程但取消註冊之總人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>活躍度</td>
										<td>學習者活躍的比率</td>
										<td>活躍/註冊人數</td>
									</tr>
									<tr>
										<td>活躍</td>
										<td>學習者最後登入的時間在課程期間的一半之後</td>
										<td></td>
									</tr>
									<tr>
										<td>不活躍</td>
										<td>學習者最後登入的時間在課程期間的一半之前</td>
										<td></td>
									</tr>
									<tr>
										<td>通過-臺灣</td>
										<td>依臺灣取得課程認證人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>通過-非臺灣</td>
										<td>依非臺灣取得課程認證人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>通過總人數</td>
										<td>通過課程或取得認證總人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>通過率</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>課程影片數目</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>影片平均長度</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>影片觀看人數.臺灣</td>
										<td>依臺灣學習者觀看課程影片人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>影片觀看人數.非臺灣</td>
										<td>依非臺灣學習者觀看課程影片人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>觀看過半影片人數.臺灣</td>
										<td>"依臺灣學習者觀看超過（含）一半課程影片數量的人數。 "</td>
										<td></td>
									</tr>
									<tr>
										<td>觀看過半影片人數.非臺灣</td>
										<td>"依非臺灣學習者觀看超過（含）一半課程影片數量的人數。 "</td>
										<td></td>
									</tr>
									<tr>
										<td>影片觀看人次.台灣</td>
										<td>依臺灣學習者觀看課程影片累積人次。</td>
										<td></td>
									</tr>
									<tr>
										<td>影片觀看人次.非台灣</td>
										<td>依非臺灣學習者觀看課程影片累積人次。</td>
										<td></td>
									</tr>
									<!-- 									<tr> -->
									<!-- 										<td>行動載具觀看總人次</td> -->
									<!-- 										<td>使用行動載具觀看任何影片的總人次。</td> -->
									<!-- 										<td></td> -->
									<!-- 									</tr> -->
									<!-- 									<tr> -->
									<!-- 										<td>學生影片觀看平均數</td> -->
									<!-- 										<td></td> -->
									<!-- 										<td></td> -->
									<!-- 									</tr> -->
									<!-- 									<tr> -->
									<!-- 										<td>影片完看程度</td> -->
									<!-- 										<td>有看到影片95%部分的人數比例</td> -->
									<!-- 										<td></td> -->
									<!-- 									</tr> -->
									<tr>
										<td>練習題數量</td>
										<td>課程測驗題數量。</td>
										<td></td>
									</tr>
									<tr>
										<td>作答過半練習題人數</td>
										<td>學習者作答超過一半測驗題的人數。</td>
										<td></td>
									</tr>
									<tr>
										<td>練習題作答率</td>
										<td></td>
										<td>學習者作答題數/總題數</td>
									</tr>
									<tr>
										<td>練習題答對率</td>
										<td></td>
										<td>學習者答對題數/總題數</td>
									</tr>
									<tr>
										<td>討論區討論總次數</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>討論區參與度</td>
										<td></td>
										<td>回應數/(發文數*學生數)*100 (單位是%)</td>
									</tr>
									<tr>
										<td>課程參與度</td>
										<td>課程的參與度</td>
										<td>人數指標(c)*0.2 + 登入指標*0.2 + 參與指標*0.6</td>
									</tr>
									<tr>
										<td>人數指標</td>
										<td>對於註冊人數計算出一個分數</td>
										<td>
											<div>
											c >= 2000<br>
											if c >= 2000<br>
       								        &nbsp;&nbsp;&nbsp;&nbsp;return 100;      //2000 以上 100 分<br>
       								        else if c &lt;= 100<br>
       								        &nbsp;&nbsp;&nbsp;&nbsp;return c*60/100; //100 人才有 60 分<br>
       								        else<br>
       								        &nbsp;&nbsp;&nbsp;&nbsp;return 60 + (c-60)/(2000-100) <br>
       								        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//100 以上等比例加指數<br>
											</div>
										</td>
									</tr>
									<tr>
										<td>登入指標</td>
										<td>對於登入人數計算出一個分數</td>
										<td>
											<div>
											x = 影片個數<br>
										    y = 問題個數<br>
										    z = 討論個數<br>
										   	 期望登入數 = max(x,y,z)*總註冊人數<br>
										    r = 總登入次數 / 期望登入數<br>
										    return r > = 100 ? 100 : r<br>
											</div>
										</td>
									</tr>
									<tr>
										<td>參與指標</td>
										<td>對於影片觀看、練習題作答、討論區情況計算出一個分數</td>
										<td>
											<div>
											計算原則：實際數量/期望參與數量 * 100<br>
											影片觀看度 a<br>
											if 影片個數 = 0<br>
											&nbsp;&nbsp;&nbsp;&nbsp;a = 0<br>
											else<br>
											&nbsp;&nbsp;&nbsp;&nbsp;a = 每人影片觀看數總和 / 註冊人數*影片個數 * 100  if 影片個數 != 0<br>
											<br>
											作答度 b<br>
											if 題目數 = 0<br>
											&nbsp;&nbsp;&nbsp;&nbsp;b = 0<br>
											else<br>
											&nbsp;&nbsp;&nbsp;&nbsp;b = 作答數 / 題目數*學生人數 * 100<br>
											<br>
											討論度 c<br>
											if po 文數 = 0<br>
											&nbsp;&nbsp;&nbsp;&nbsp;c = 0<br>
											else<br>
											&nbsp;&nbsp;&nbsp;&nbsp;c = 回應數 / (po文數*學生人數/4) * 100<br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// 期待四個 po 文回應一次<br>
											<br>
											//以上 a,b,c 若超過 100 都算是 100<br>
											return a*0.34 + b*0.33 + c*0.33<br>
											</div>
										</td>
									</tr>
									
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
	<script src="./vendor/datatables/js/jquery.dataTables2.js"></script>
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