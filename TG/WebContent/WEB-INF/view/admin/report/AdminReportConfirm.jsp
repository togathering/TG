<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>�Ű���</title>
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
		alert("�Ƕ�");
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
	<h2 align="center">�Ű� ����</h2>
	<form action="adminReportOk" style="padding-left: 30px;" >
		<table>
			<tr>
				<td width="80"><strong>�Ű���</strong></td><td width="250">${bean.reporter }</td>
			</tr>
			<tr>
				<td><strong>�ǽŰ���</strong></td><td>${bean.accused }</td>
			</tr>
			<tr>
				<td><strong>�Ű�¥</strong></td><td>${bean.rdate }</td>
			</tr>
			<tr>
				<td><strong>ī�װ�</strong></td><td>${bean.category }</td>
			</tr>
			<tr  height="170" valign="top">
				<td><strong>����</strong></td><td>${bean.content }</td>
			</tr>
		</table>
		<input hidden="true" type="text" name="upno" value="${rno}" ><br>
		<div align="center">
			<input type="submit" class="sbutton" value="Ȯ��" onclick="reportOk('${rno}')" name="status">
			<input type="submit" class="sbutton" value="����" onclick="reportHold('${rno}')" name="status">
		</div><br>
	</form>
	</div>
</body>
</html>