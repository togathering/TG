<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Administrator 문의관리</title>
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			$.get('adminQnaList', function(data, status){
				var table = document.getElementById('qList');
				table.innerHTML=data;
		});
			$("#title").click(function(){
				alert("눌려라");
		        $("#content").slideToggle("slow");
		    });
			
	});
	function qnaRequest(qnaNo) {
		location.href = 'adminQnaReply?qno='+qnaNo;
	}
</script>
</head>
<body>
	<div><tiles:insertAttribute name="adminHeader"/></div>
	<div><tiles:insertAttribute name="adminBoard"/></div>
	<div>
	<h3>문의관리</h3>
	<br>
		<table id="qList">
		</table>
	</div>
</body>
</html>