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

<!-- MetisMenu CSS -->
<link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="./dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="./vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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

</style>
</head>
<body onresize="onresizeSidebar()">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
		style="margin-bottom: 0;min-height:60px">
		<div class="container">
			<div class="navbar-header" style="height:55px">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" onclick="sidebarBlock()" aria-expanded="false"
					aria-controls="navbar" style="float:left;margin-left:15px;">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				
				<a href="index"><img src="img/OpenEdu_Logo_W.png"
					style="max-height: 50px; margin-top: 5px;"></a>
				
			</div>
				
				<ul class="nav navbar-nav navbar-right">

					<li id="special-area"><a  href="https://www.openedu.tw/">回openedu首頁</a></li>
<%-- 					<li id="register-item"><a>${studentName}</a></li> --%>
<!-- 					<li id="my-course-list" class="dropdown" style="display: none"><a -->
<!-- 						class="dropdown-toggle" data-toggle="dropdown" role="button" -->
<!-- 						aria-haspopup="true" aria-expanded="false">我的課程<span -->
<!-- 							class="caret"></span></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a target="_self">課程列表</a></li> -->
<!-- 							<li><a target="_blank">問卷調查</a></li> -->
<!-- 							<li><a target="_blank">課程證書</a></li> -->
<!-- 							<li><a target="_self">登出</a></li> -->
<!-- 						</ul></li> -->
				</ul>
			<!--/.nav-collapse -->
		</div>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation" id="side_menu">
			<div class="sidebar-nav navbar-collapse collapse in" aria-expanded="true">
				<ul class="nav" id="side-menu">
					<li><a href="index"><i class="fa fa-dashboard fa-fw"></i>
							總覽</a></li>
					<li><a href="#"><i class="fa fa-table fa-fw"></i> 課程活動資料<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="BasicCourseDataServlet">課程基本資料</a></li>
							<li><a href="MovieDataServlet">課程影片資料</a></li>
							<li><a href="ForumDataServlet">討論區資料</a></li>
							<li><a href="practiveServlet">練習題資料</a></li>
							<li><a href="BeforeSurveyServlet">課前問卷資料</a></li>
							<li><a href="AfterSurveyServlet">課後問卷資料</a></li>
						</ul> 
					</li>
					<li><a href="certificateServlet"><i class="fa  fa-bar-chart fa-fw"></i> 課程學生分析</a></li>
					<li><a href="analysisServlet?select=2"><i class="fa fa-table fa-fw"></i>整體分析</a></li>
					<li><a href="glossary.jsp"><i class="fa fa-edit fa-fw"></i> 名詞解釋</a></li>

				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
	</nav>
	<script type="text/javascript">
	if(document.body.clientWidth < 768){
		side_menu.style.display = 'none';
	}
	function onresizeSidebar(){
		if(document.body.clientWidth < 768){
			side_menu.style.display = 'none';
		}
		else{
			side_menu.style.display = 'block';
		}
	}
	var i = 0;
	function sidebarBlock(){
		if(side_menu.style.display == 'none')
			side_menu.style.display = 'block';
		else
			side_menu.style.display = 'none';
	}
	</script>
</body>
</html>
		