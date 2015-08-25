<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 입력</title>
</head>
<%-- 방명록 입력폼 --%>
<body>
	<center>
		<h3>입력폼</h3>
		<hr>
		<a href="guest?action=list">[게시물 목록으로]</a><br><br>
		<form action="guest?action=addCon" method="post" name="inputfrm">
		<table border="1" cellpadding="5">
			<tr>
				<td bgcolor="skyblue">작성자</td>
				<td><input type="text" name="name"></td>
			</tr>	
			<tr>	
				<td bgcolor="skyblue">비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td bgcolor="skyblue">전화번호</td>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><textarea rows="5" cols="45" name="contents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력">
					<input type="button" value="취소">
				</td>
			</tr>	
		</table>
		</form>
	</center>
</body>
</html>