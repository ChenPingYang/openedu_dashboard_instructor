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
	
<!-- amchart -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />

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
				<div class="col-md-9">
					<h1 class="page-header">${courseName}</h1>
				</div>
				<div class="col-md-3">
					<div style="padding-top: 45px;">
						<div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								資料分析<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1" style="background:#b2d7ff">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="AnalysisCourseServlet?course=${courseCode}">進階分析</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="AnalysisGroupServlet?course=${courseCode}&select=0">群組分析</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="AnalysisStudentServlet?course=${courseCode}&optradio=2">學生資料</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="AnalysisVideoServlet?course=${courseCode }">影片分析</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${mode == 1}">
				<form action="#" method="post" name="form_showChart">
					<select class="selectpicker" style="height: 27px"
						onchange="chgSelect()" id="selectCourse" name="selectCourse">
						<option>-請選擇-</option>
						<c:forEach var="data" items="${allCourse}">
							<option>${data}</option>
						</c:forEach>
					</select>
				</form>
			</c:if>



			<div class="row" style="padding-top: 10px;">
				<div class="col-lg-12">
					<div class="panel panel-primary" id="ageChartDiv">
						<div class="panel-heading">課程基本資料</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-lg-6">
								<table style="width: 100%" class="table table-hover">
									<tr>
										<td width="24%">課程代碼</td>
										<td style="text-align: right;">${courseCode}</td>
									</tr>
									<tr>
										<td width="24%">課程編號</td>
										<td style="text-align: right;">${courseId}</td>
									</tr>
									<tr>
										<td width="24%">開課日期</td>
										<td style="text-align: right;" id="startDate">${startDate}</td>
									</tr>
									<tr>
										<td width="24%">結束日期</td>
										<td style="text-align: right;">${endDate}</td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('week')" onmouseout="control('week')">開課週數 
										</td>
										<td><div style="text-align: right;">${duration_week}</div>
											<div style="display: none;" id="week">
												${definition[5] }<br>計算方式：<br>${calculation[5] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('drop')" onmouseout="control('drop')">退選人數
										</td>
										<td><div style="text-align: right;">${withdrawnPersons}</div>
											<div style="display: none;" id="drop">
												${definition[6] }<br>計算方式：<br>${calculation[6] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('totalRegisteredPersons')" onmouseout="control('totalRegisteredPersons')">註冊人數
										</td>
										<td><div style="text-align: right;">${totalRegisteredPersons}</div>
											<div style="display: none;" id="totalRegisteredPersons">
												${definition[4] }<br>計算方式：<br>${calculation[4] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('Participation')" onmouseout="control('Participation')">課程參與度
										</td>
										<td><div style="text-align: right;">${Participation}</div>
											<div style="display: none;" id="Participation">
												${definition[0] }<br>計算方式：<br>${calculation[0] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('c1')" onmouseout="control('c1')">人數指標 
										</td>
										<td><div style="text-align: right;">${c1}</div>
											<div style="display: none;" id="c1">
												${definition[1] }<br>計算方式：<br>${calculation[1] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('c2')" onmouseout="control('c2')">登入指標
										</td>
										<td><div style="text-align: right;">${c2}</div>
											<div style="display: none;" id="c2">
												${definition[2] }<br>計算方式：<br>${calculation[2] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('c3')" onmouseout="control('c3')">參與指標 
										</td>
										<td><div style="text-align: right;">${c3}</div>
											<div style="display: none;" id="c3">
												${definition[3] }<br>計算方式：<br>${calculation[3] }
											</div></td>
									</tr>
									<tr>
										<td width="24%" onmouseover="control('certificate')" onmouseout="control('certificate')">證書人數
										</td>
										<td><div style="text-align: right;">${certificate}</div>
											<div style="display: none;" id="certificate">
												${definition[7] }<br>計算方式：<br>${calculation[7] }
											</div></td>
									</tr>
								</table>
							</div>
							<div class="col-lg-6">
								<div id="images"></div>
								<table style="width: 100%" class="table table-hover">
									<tr>
										<td>老師</td>
										<td style="text-align: right;" id="teacherlist"></td>
									</tr>
									<tr>
										<td>開課單位</td>
										<td style="text-align: right;" id="institute"></td>
									</tr>
									<tr>
										<td>課程分類</td>
										<td style="text-align: right;" id="category"></td>
									</tr>
									<tr>
										<td>子分類</td>
										<td style="text-align: right;" id="subcategory"></td>
									</tr>
								</table>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="row">
				<div class="col-lg-4">
					<div class="panel panel-primary" id="ageChartDiv">
						<div class="panel-heading">討論區資料</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table style="width: 100%" class="table table-hover">
								<tr>
									<td width="48%" onmouseover="control('numbersOfForum')" onmouseout="control('numbersOfForum')">討論區討論次數 
									</td>
									<td><div style="text-align: right;">${numbersOfForum}</div>
										<div style="display: none;" id="numbersOfForum">
											${definition[11] }<br>計算方式：<br>${calculation[11] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('numbersOfPostInForum')" onmouseout="control('numbersOfPostInForum')">討論區發文數 
									</td>
									<td><div style="text-align: right;">${numbersOfPostInForum}</div>
										<div style="display: none;" id="numbersOfPostInForum">
											${definition[10] }<br>計算方式：<br>${calculation[10] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('forumParticiPationRates')" onmouseout="control('forumParticiPationRates')">討論區參與度 
									</td>
									<td><div style="text-align: right;">${forumParticiPationRates}</div>
										<div style="display: none;" id="forumParticiPationRates">
											${definition[8] }<br>計算方式：<br>${calculation[8] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('numberOfForumAreas')" onmouseout="control('numberOfForumAreas')">討論區回應數 
									</td>
									<td><div style="text-align: right;">${numberOfForumAreas}</div>
										<div style="display: none;" id="numberOfForumAreas">
											${definition[9] }<br>計算方式：<br>${calculation[9] }
										</div></td>
								</tr>
							</table>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<div class="col-lg-4">
					<div class="panel panel-primary">
						<div class="panel-heading">課程影片資料</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table style="width: 100%" class="table table-hover">
								<tr>
									<td width="48%" onmouseover="control('courseNumberOfVideos')" onmouseout="control('courseNumberOfVideos')">課程影片數目
									</td>
									<td><div style="text-align: right;">${courseNumberOfVideos}</div>
										<div style="display: none;" id="courseNumberOfVideos">
											${definition[18] }<br>計算方式：<br>${calculation[18] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('averageLengthOfVideos')" onmouseout="control('averageLengthOfVideos')">影片平均長度 
									</td>
									<td><div style="text-align: right;">${averageLengthOfVideos}</div>
										<div style="display: none;" id="averageLengthOfVideos">
											${definition[19] }<br>計算方式：<br>${calculation[19] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('numberOfVideosViewed')" onmouseout="control('numberOfVideosViewed')">影片觀看人數 
									</td>
									<td><div style="text-align: right;">${numberOfVideosViewed}</div>
										<div style="display: none;" id="numberOfVideosViewed">
											${definition[20] }<br>計算方式：<br>${calculation[20] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('NOVV_moreThanHalf')" onmouseout="control('NOVV_moreThanHalf')">影片觀看過半人數 
									</td>
									<td><div style="text-align: right;">${NOVV_moreThanHalf}</div>
										<div style="display: none;" id="NOVV_moreThanHalf">
											${definition[22] }<br>計算方式：<br>${calculation[22] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('timesOfVideosViewed')" onmouseout="control('timesOfVideosViewed')">影片觀看人次 
									</td>
									<td><div style="text-align: right;">${timesOfVideosViewed}</div>
										<div style="display: none;" id="timesOfVideosViewed">
											${definition[21] }<br>計算方式：<br>${calculation[21] }
										</div></td>
								</tr>
							</table>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<div class="col-lg-4">
					<div class="panel panel-primary">
						<div class="panel-heading">練習題資料</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<td width="48%" onmouseover="control('numberOfTestQuestions')" onmouseout="control('numberOfTestQuestions')">練習題數量 
									</td>
									<td><div style="text-align: right;">${numberOfTestQuestions}</div>
										<div style="display: none;" id="numberOfTestQuestions">
											${definition[12] }<br>計算方式：<br>${calculation[12] }
										</div></td>
								</tr>

								<tr>
									<td width="48%" onmouseover="control('totalTestAnswerNumber')" onmouseout="control('totalTestAnswerNumber')">總作答數 
									</td>
									<td><div style="text-align: right;">${totalTestAnswerNumber}</div>
										<div style="display: none;" id="totalTestAnswerNumber">
											${definition[14] }<br>計算方式：<br>${calculation[14] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('answerRatio')" onmouseout="control('answerRatio')">練習題作答率
									</td>
									<td><div style="text-align: right;">${answerRatio}</div>
										<div style="display: none;" id="answerRatio">
											${definition[16] }<br>計算方式：<br>${calculation[16] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('answerRate')" onmouseout="control('answerRate')">練習題答對率
									</td>
									<td><div style="text-align: right;">${answerRate}</div>
										<div style="display: none;" id="answerRate">
											${definition[17] }<br>計算方式：<br>${calculation[17] }
										</div></td>
								</tr>
								<tr>
									<td width="48%" onmouseover="control('answerHalfAmount')" onmouseout="control('answerHalfAmount')">作答過半人數 
									</td>
									<td><div style="text-align: right;">${answerHalfAmount}</div>
										<div style="display: none;" id="answerHalfAmount">
											${definition[13] }<br>計算方式：<br>${calculation[13] }
										</div></td>
								</tr>
							</table>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary" id="ageChartDiv">
						<div class="panel-heading">年齡分布長條圖</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="ageChart" style="width: 100%; height: 100%;"></div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
				</div>
				<div class="col-lg-6">
					<!-- /.panel -->
					<div class="panel panel-primary" id="educationChartDiv">
						<div class="panel-heading">學歷分布長條圖</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="educationChart" style="width: 100%; height: 100%;"></div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">註冊人數 台灣/非台灣</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="registeredChart" style="width: 100%; height: 100%;"></div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
				<div class="col-lg-6">
					<div class="panel panel-primary">
						<div class="panel-heading">學員性別 男性/女性</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="registeredsexChart" style="width: 100%; height: 100%;"></div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">課前/課後 問卷結果</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#beforeSurvey">課前問卷</a></li>
								<li><a href="#afterSurvey">課後問卷</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane fade in active" id="beforeSurvey">
									<c:choose>
										<c:when test="${checkBefore}">
											<table style="width: 100%" class="table table-hover">
												<tr>
													<td width="36%">修課主要動機</td>
													<td width="10%">個人興趣</td>
													<td width="10%">${beforeSurveyData[0]}</td>
													<td width="10%">專業需求</td>
													<td width="10%">${beforeSurveyData[1]}</td>
													<td width="12%">學分需求</td>
													<td  width="12%">${beforeSurveyData[2]}</td>
												</tr>
												<tr>
													<td width="36%">對於課程內容的滿意度(5分最高，1分最低)</td>
													<td colspan="8">${beforeSurveyData[3]}</td>
												</tr>
												<tr>
													<td width="36%">對於平台功能的滿意度(5分最高，1分最低)</td>
													<td  colspan="8">${beforeSurveyData[4]}</td>
												</tr>
												<c:set value="0" var="sum" />
												<c:forEach var="data" items="${beforeSurveyAdvice}">
													<tr>
														<c:choose>
															<c:when test="${sum == 0}">
																<td width="36%">建議</td>
															</c:when>
															<c:otherwise>
																<td width="36%"></td>
															</c:otherwise>
														</c:choose>
														<td colspan="8">${data}</td>
														<c:set value="${sum + 1}" var="sum" />
													</tr>
												</c:forEach>
											</table>
										</c:when>
										<c:otherwise>
											<font size="3">此課程無課前問卷資料!</font>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="tab-pane fade" id="afterSurvey">
									<c:choose>
										<c:when test="${checkAfter}">
											<table style="width: 100%" class="table table-hover">
												<tr>
													<td width="30%">對於課程內容的滿意度(5分最高，1分最低)</td>
													<td width="70%">${afterSurveyData[0]}</td>
												</tr>
												<tr>
													<td width="30%">對於平台功能的滿意度(5分最高，1分最低)</td>
													<td width="70%">${afterSurveyData[1]}</td>
												</tr>
												<c:set value="0" var="sum" />
												<c:forEach var="data" items="${afterSurveyAdvice}">
													<tr>
														<c:choose>
															<c:when test="${sum == 0}">
																<td width="30%">建議</td>
															</c:when>
															<c:otherwise>
																<td width="30%"></td>
															</c:otherwise>
														</c:choose>
														<td colspan="10">${data}</td>
														<c:set value="${sum + 1}" var="sum" />
													</tr>
												</c:forEach>
											</table>
										</c:when>
										<c:otherwise>
											<font size="3">此課程無課後問卷資料!</font>
										</c:otherwise>
									</c:choose>
								</div>
								<!-- /.table-responsive -->
							</div>
							<c:if test="${checkAfter || checkBefore }">
							<div class="row">
								<div class="col-lg-6">
									<div id="chart_PlatformSatisfaction" style="width: 100%; height: 250px;"></div>
								</div>
								<div class="col-lg-6">
									<div id="chart_CourseSatisfaction" style="width: 100%; height: 250px;"></div>
								</div>
							</div>
							</c:if>
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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- amchart -->
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
		
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.js"></script> -->
	<script type="text/javascript">
        $(document).ready(function() {
        	$.getJSON("data/openeduAPI.js", function(data){
        		$.each(data, function(i,item){
        			if(item.courseName ==  $("h1").text() && item.startDate == $("#startDate").text()){
	       				 $("<img/>").attr("src", item.courseImage).appendTo("#images");
	       				 $("#institute").text(item.institute);
	       				 $("#category").text(item.category);
	       				 $("#subcategory").text(item.subcategory);
	       				 $.each(item.instructors, function(k,teacher){
	       					 $("#teacherlist").text($("#teacherlist").text()+" "+teacher.name);
	       				 });
	       				 return false;
       				}
        			else if(item.courseName ==  $("h1").text()/* && item.startDate == $("#startDate").text()*/){
        				 $("<img/>").attr("src", item.courseImage).appendTo("#images");
        				 $("#institute").text(item.institute);
        				 $("#category").text(item.category);
	       				 $("#subcategory").text(item.subcategory);
        				 $.each(item.instructors, function(k,teacher){
        					 $("#teacherlist").text($("#teacherlist").text()+" "+teacher.name);
        				 });
        				 return false;
        			}
       			});	    
        	});
        });
    </script>

	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

	<!-- googleChart javascript for ageChart -->
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ "Element", "人數", {role : "style"} ], 
					[ "17歲以下", ${age_17}, "#b87333" ],
					[ "18歲到25歲", ${age_18_25}, "silver" ], 
					[ "25歲以上", ${age_26_}, "gold" ]
					]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "", 
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("ageChart"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data, options);
		    });
		}
	</script>

	<!-- googleChart javascript for educationChart -->
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ "Element", "人數", {role : "style"}], 
					[ "小學", ${education_primary}, "#b87333"],
					[ "國中", ${education_junior}, "#b87333"], 
					[ "高中", ${education_senior}, "#b87333"],
					[ "副學士", ${education_Associate}, "#b87333"],
					[ "學士", ${education_Bachelo}, "#b87333"],
					[ "碩士", ${education_master}, "#b87333"],
					[ "博士", ${education_doctor}, "#b87333"]
					]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "", 
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("educationChart"));
			chart.draw(view, options);
			window.addEventListener("resize", function(){
		    	chart.draw(data, options);
		    });
		}
	</script>

	<!--  googleChart javascript for registeredChart  -->
	<script>
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
					[ '註冊', '人數' ], 
					[ '台灣', ${registeredPersons_Taiwan}] ,
					[ '非台灣', ${registeredPersons_Foreign}]
					]);

			var options = {
				title : ''
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('registeredChart'));

			chart.draw(data, options);
		 	window.addEventListener("resize", function(){
	        	chart.draw(data, options);
	        });
		}
	</script>

	<script>
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
					[ '學員', '性別' ], 
					[ '男性', ${male}] ,
					[ '女性', ${female}]
					]);

			var options = {
				title : ''
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('registeredsexChart'));

			chart.draw(data, options);
		 	window.addEventListener("resize", function(){
	        	chart.draw(data, options);
	        });
		}
	</script>
	
	
	
	<!-- chart_CourseSatisfaction 課程滿意度 -->
	<script>
	var chart = AmCharts.makeChart("chart_CourseSatisfaction", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "課程滿意度",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "分數",
		    "maximum": 5,
		    "axisAlpha": 0,
		  }],
		  "dataProvider":[{
			    "exp": "課前-課程滿意度",
			    "high": ${beforeCourseSatisfaction[0]},
			    "open": ${beforeCourseSatisfaction[1]},
			    "mid": ${beforeCourseSatisfaction[2]},
			    "close": ${beforeCourseSatisfaction[3]},
			    "low": ${beforeCourseSatisfaction[4]},
			  }, {
			    "exp": "課後-課程滿意度",
			    "high": ${afterCourseSatisfaction[0]},
			    "open": ${afterCourseSatisfaction[1]},
			    "mid": ${afterCourseSatisfaction[2]},
			    "close": ${afterCourseSatisfaction[3]},
			    "low": ${afterCourseSatisfaction[4]}
			  }],
		  
		  "export": {
		    "enabled": true
		  },
		});
	</script>
	
	<!-- chart_PlatformSatisfaction 平台滿意度 -->
	<script>
	var chart = AmCharts.makeChart("chart_PlatformSatisfaction", {
		  "type": "serial",
		  "theme": "light",
		  "titles": [{
		    "text": "平台滿意度",
		    "size": 15
		  }],
		  "graphs": [{
		    "type": "candlestick",
		    "balloonText": "High: [[high]]\n Open: [[open]]\n Mid: [[mid]]\n Close: [[close]]\nLow: [[low]]",
		    "highField": "high",
		    "openField": "open",
		    "closeField": "close",
		    "valueField": "close",
		    "lowField": "low",
		    "fillColors": "#ffffff",
		    "lineColor": "#e62e00",
		    "lineAlpha": 1,
		    "fillAlphas": 0.9,
		    "columnWidth": 0.4
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "high",
		    "openField": "high",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.2,
		    "valueField": "low",
		    "openField": "low",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }, {
		    "type": "column",
		    "columnWidth": 0.4,
		    "valueField": "mid",
		    "openField": "mid",
		    "lineColor": "#e62e00",
		    "lineThickness": 3,
		    "showBalloon": false,
		    "clustered": false
		  }],
		  "chartCursor": {
		    "valueLineEnabled": true,
		    "valueLineBalloonEnabled": true
		  },
		  "categoryField": "exp",
		  "categoryAxis": {
		    "gridPosition": "start",
		    "tickPosition": "start",
		    "tickLength": 10,
		    "axisAlpha": 0.7,
		    "gridAlpha": 0
		  },
		  "valueAxes": [{
		    "position": "left",
		    "title": "分數",
		    "maximum": 5,
		    "axisAlpha": 0,
		  }],
		  "dataProvider":[{
			    "exp": "課前-平台滿意度",
			    "high": ${beforePlatformSatisfaction[0]},
			    "open": ${beforePlatformSatisfaction[1]},
			    "mid": ${beforePlatformSatisfaction[2]},
			    "close": ${beforePlatformSatisfaction[3]},
			    "low": ${beforePlatformSatisfaction[4]},
			  }, {
			    "exp": "課後-平台滿意度",
			    "high": ${afterPlatformSatisfaction[0]},
			    "open": ${afterPlatformSatisfaction[1]},
			    "mid": ${afterPlatformSatisfaction[2]},
			    "close": ${afterPlatformSatisfaction[3]},
			    "low": ${afterPlatformSatisfaction[4]}
			  }],
		  
		  "export": {
		    "enabled": true
		  },
		});
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
    
    <!-- 驚嘆號 -->
    <script>
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip(); 
		});
	</script>
	
	<script>
		function control(element){
			var ID = document.getElementById(element);
			if(ID.style.display == 'none')
				ID.style.display = 'block';
			else
				ID.style.display = 'none';
		}
	</script>
</body>
</html>