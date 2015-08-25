<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>Administrator 신고관리</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			$.get('adminReportList', function(data, status){
				var table = document.getElementById('rList');
				table.innerHTML=data;
		});
	});
	
	function report(reportNo) {
		window.open('adminReportConfirm?rno='+reportNo,'','width=400, height=390, screenX=400, screenY=130, resizable=no'); 
	}
	$(document).ready(function(){
		load();
	});
</script>
</head>
<body>
	<div><tiles:insertAttribute name="adminHeader"/></div>
	<div><tiles:insertAttribute name="adminBoard"/></div>
		<h3>신고관리</h3>
			<table style="width: 70%;" id="rList"></table>
</body>
</html>