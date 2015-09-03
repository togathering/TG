<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>신고내용</title>
<style type="text/css">
td{
font-size: 14px;
color: #585858;
}
h2{
color: #585858;
}
.board_div{
float:left;
width: 100%;
margin: 0 auto;
}
</style>
<script type="text/javascript">
	function reportOk(rno) {
		alert("되라");
		location.href = "adminReportOk?no="+rno;
		self.close();
	}
	function reportHold(rno) {
		location.href = "adminReportHold?no="+rno;
		window.close();
	}
</script>
</head>
<body>
	
<div class="board_div">
	<h2 align="center">신고 내용</h2>
	<form action="adminReportOk" style="padding-left: 30px;" >
		<table>
			<tr>
				<td width="80"><strong>신고자</strong></td><td width="250">${bean.reporter }</td>
			</tr>
			<tr>
				<td><strong>피신고자</strong></td><td>${bean.accused }</td>
			</tr>
			<tr>
				<td><strong>신고날짜</strong></td><td>${bean.rdate }</td>
			</tr>
			<tr>
				<td><strong>카테고리</strong></td><td>${bean.category }</td>
			</tr>
			<tr  height="170" valign="top">
				<td><strong>내용</strong></td><td>${bean.content }</td>
			</tr>
		</table>
		<input hidden="true" type="text" name="upno" value="${rno}" ><br>
		<div align="center">
			<input type="submit" class="sbutton" value="확인" onclick="reportOk('${rno}')" name="status">
			<input type="submit" class="sbutton" value="보류" onclick="reportHold('${rno}')" name="status">
		</div><br>
	</form>
	</div>
</body>
</html>