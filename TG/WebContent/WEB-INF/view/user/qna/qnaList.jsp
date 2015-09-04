<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<style> 
.form { height:400px; margin:20px auto; width:600px; }
.qList { width:700px;  }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.get('qnaRe?', function(data, status){
			var table = document.getElementById('qList');
			table.innerHTML=data;
    });
});

</script>
</head>
<body style="background-color: #FAFAFA">
<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div><br><br>
<%-- 	<div>	<tiles:insertAttribute name="myPageHeader"/></div><br><br> --%>
	<div style="position: relative;"><tiles:insertAttribute name="qnaSide"/></div>
		<form action="" class="form">
			<h3>나의 문의내역</h3>
			<table id="qList" class="qList"></table>
		</form>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>