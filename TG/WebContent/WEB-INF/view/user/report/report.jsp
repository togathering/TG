<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ű��ϱ�</title>

<script type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="css/list.css">
<% String accused = request.getParameter("accused"); %>
</head>
<body>
	<form action="reportSend" name="frm" style="text-align: ; margin: 30px;">
		<h2 align="center">�Ű��ϱ�</h2>
		�Ű��� ���̵� : <input type="text" name="accused" value="<%=accused%>" readonly="readonly" class="t"><br><br>
		<div class="report" align="left" >
			<input type="radio" name="category" value="������ �ӿ����ϴ�">������ �ӿ����ϴ�.<br>
			<input type="radio" name="category" value="���ӿ� ���ذ� �˴ϴ�">���ӿ� ���ذ� �˴ϴ�.<br>
			<input type="radio" name="category" value="������ ������ ���� �ʾҽ��ϴ�">������ ������ ���� �ʾҽ��ϴ�.<br>
			<input type="radio" name="category" value="��Ÿ">��Ÿ<br><br>
		</div>
		<textarea id="content" name="content" rows="10" cols="50" placeholder="�Ű��� ������ �Է��ϼ���"></textarea><br>
		<div align="center"><br>
			<button type="submit" class="button" onclick="window.close()">�Ű��ϱ�</button>
			<button type="reset" class="button" onclick="window.close()">���</button>
		</div>
	</form>
</body>
</html>