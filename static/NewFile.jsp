<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/lib/w3.js"></script>


</head>
<body>
	<a data-toggle="modal" data-target="#myModalgrade"
		style="cursor: pointer">測試</a>
	<a data-toggle="modal" data-target="#myModalgrade2"
		style="cursor: pointer">測試</a>

	<div class="modal fade" id="myModalgrade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">我的成績 :
						${RadarColumn[4]}% &nbsp;&nbsp;&nbsp;&nbsp;平均 :
						${originalavgc_complete}% &nbsp;&nbsp;&nbsp;&nbsp;最高 :
						${originalMax[4]}%</h4>
				</div>
				<jsp:include page = "VideoTimeAnalysis.jsp" >   
					<jsp:param name = "video" value = "835b8d09238844a9a476bb174cf12074" />     
				</jsp:include > 
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<div class="modal fade" id="myModalgrade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">我的成績 :
						${RadarColumn[4]}% &nbsp;&nbsp;&nbsp;&nbsp;平均 :
						${originalavgc_complete}% &nbsp;&nbsp;&nbsp;&nbsp;最高 :
						${originalMax[4]}%</h4>
				</div>
				<jsp:include page = "VideoTimeAnalysis.jsp" >   
					<jsp:param name = "video" value = "c739d364b26b48228b730fd01152d22a" />     
				</jsp:include > 
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>

</html>