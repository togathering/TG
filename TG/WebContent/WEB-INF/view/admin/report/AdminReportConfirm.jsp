<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/list.css">
<title>�Ű�����</title>
<script type="text/javascript">
	function reportOk(rno) {
		location.href = "adminReportOk?no="+rno;
		window.close();
	}
</script>
</head>
<body>
	<h2 align="center">�Ű� ����</h2>
	<form action="adminReportOk?" style="padding-left: 30px;" >
		�Ű��� : <input type="text" class="t" readonly="readonly" value="${bean.reporter }"><br>
		�ǽŰ��� : <input type="text" class="t" readonly="readonly" value="${bean.accused }"><br>
		�Ű���¥ : ${bean.rdate }<br>
		ī�װ��� : ${bean.category }<br>
		���� <br><textarea rows="10" cols="50" class="t" readonly="readonly" >${bean.content}</textarea><br>
		<input hidden="true" type="text" name="upno" value="${rno}" ><br>
		<div align="center">
			<input type="submit" class="button" value="Ȯ��" onclick="reportOk('${rno}')">
			<input type="button" class="button" value="����" onclick="window.close()">
		</div>
	</form>
</body>
</html>