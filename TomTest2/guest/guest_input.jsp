<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Է�</title>
</head>
<%-- ���� �Է��� --%>
<body>
	<center>
		<h3>�Է���</h3>
		<hr>
		<a href="guest?action=list">[�Խù� �������]</a><br><br>
		<form action="guest?action=addCon" method="post" name="inputfrm">
		<table border="1" cellpadding="5">
			<tr>
				<td bgcolor="skyblue">�ۼ���</td>
				<td><input type="text" name="name"></td>
			</tr>	
			<tr>	
				<td bgcolor="skyblue">��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">��ȭ��ȣ</td>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><textarea rows="5" cols="45" name="contents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="�Է�">
					<input type="button" value="���">
				</td>
			</tr>	
		</table>
		</form>
	</center>
</body>
</html>