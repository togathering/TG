<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의내역</title>
<style type="text/css">
	.form { width:600px; height:450px; margin-left:500px; margin-top: 30px; }
	.title{ width:500px; height:30px;} 
	.content{ width:500px; height:100px;}
	.recontent{ width:500px; height:300px;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		if('${bean.rcont }'==''){
			var re = document.getElementById("recontent");
			re.style.display = 'none';
		}
});
</script>
</head>
<body style="background-color: #FAFAFA">
<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
<%-- 	<div>	<tiles:insertAttribute name="myPageHeader"/></div><br><br> --%>
	<div style="position: relative;"><tiles:insertAttribute name="qnaSide"/></div>
	<form class="form">
		<table class="title" style="border: 1px solid gray;">
			<tr>
				<td width="50" style="border: 1px solid gray;"><b>제목</b></td><td width="280" style="background-color: white">${bean.qtitle }</td><td width="50" style="border: 1px solid gray;"><b>날짜</b></td><td style="background-color: white">${bean.qdate }</td>
			</tr>
		</table>
		<table class="content" style="border: 1px solid gray;">
			<tr>
				<td width="50" style="border: 1px solid gray;"><b>내용</b></td><td style="background-color: white">${bean.qcont } </td>
			</tr>
		</table>
		<table class="recontent" id="recontent" style="border: 1px solid gray;"">
			<tr>
				<td width="50" style="border: 1px solid gray;"><b>답변</b></td><td style="background-color: white">${bean.rcont } </td>
			</tr>
		</table>
	</form>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>