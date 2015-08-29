<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Administrator 문의관리</title>
<link rel="stylesheet" type="text/css" href="css/search.css">
<style type="text/css">
a{
text-decoration:none;
font:bold;
color:rgb(41, 128, 185);
}
th{
font-size: 15px;
color:white;;
}
td{
font-size: 14px;
color: #585858;
}
.board_div{
float:left;
width: 100%;
margin: 0 auto;
}
.board_table{
width: 80%; 
min-width:800px; 
margin:1% auto; 
border-collapse: collapse;"
}
.boardth{
height:45px;
background-color: rgb(245, 88, 88);
}
.board_contnets{
border-bottom: 1px solid #2E2E2E;
height: 47px; 
font: bold;"
}
</style>
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
		<table id="qList">
		</table>
	</div>
</body>
</html>