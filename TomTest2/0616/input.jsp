<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%! String name; %>
<% name.length(); %>

<form action="print.jsp" method="get">
	<center>
	<h3>�Է���</h3>
	<hr>
	<table>
	<tr>
		<td>�̸�: <input type="text" size='5' name="name"></td>
	</tr>
	<tr>
		<td>����: <input type="text" size='5' name="age"><br></td>
	</tr>
	<tr>
		<td>����: <select name="job">
			<option>�л�</option>
			<option>����</option>
			<option>���۸�</option>
		</select></td>
	</tr>
	<tr>
		<td>���: <input type="password" name="pass"> </td>
	</tr>
	<tr>
		<td>����: <input type="radio" name=gender value="����">����<input type="radio" name=gender value="����">����</td>
	</tr>
	<tr>
		<td>����<input type="checkbox" name="subject" value="JAVA">JAVA
			<input type="checkbox" name="subject" value="SQL">SQL
			<input type="checkbox" name="subject" value="JSP">JSP</td>
	</tr>
	<tr>
		<td>�޸�: <textarea rows="5" cols="20" name="memo"></textarea></td>
	</tr>
	</table>
	<input type="submit" value = "�Է�">
	</center>
</form>
</body>
</html>