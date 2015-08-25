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
	<h3>입력폼</h3>
	<hr>
	<table>
	<tr>
		<td>이름: <input type="text" size='5' name="name"></td>
	</tr>
	<tr>
		<td>나이: <input type="text" size='5' name="age"><br></td>
	</tr>
	<tr>
		<td>직업: <select name="job">
			<option>학생</option>
			<option>강사</option>
			<option>슈퍼맨</option>
		</select></td>
	</tr>
	<tr>
		<td>비번: <input type="password" name="pass"> </td>
	</tr>
	<tr>
		<td>성별: <input type="radio" name=gender value="남자">남자<input type="radio" name=gender value="여자">여자</td>
	</tr>
	<tr>
		<td>과목<input type="checkbox" name="subject" value="JAVA">JAVA
			<input type="checkbox" name="subject" value="SQL">SQL
			<input type="checkbox" name="subject" value="JSP">JSP</td>
	</tr>
	<tr>
		<td>메모: <textarea rows="5" cols="20" name="memo"></textarea></td>
	</tr>
	</table>
	<input type="submit" value = "입력">
	</center>
</form>
</body>
</html>