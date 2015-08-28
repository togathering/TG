<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의하기</title>
<style type="text/css">
.Input{
	width: 500px;
	padding: 10px;
	margin: 5px;
}
.form { width:500px; margin-left: 500px;}
</style>
<link rel="stylesheet" href="css/qna.css">
</head>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div><br><br>
	<div>	<tiles:insertAttribute name="myPageHeader"/></div><br><br>
	<div style="position: relative;"><tiles:insertAttribute name="qnaSide"/></div>
		<form action="qnaSend" class="form">
		<h3 align="center">문의하기</h3>
			<input name="title" type="text" id="subject" placeholder="제목" class="Input"><br>
			<textarea name="content" rows="15" placeholder="내용을 입력해주세요" class="Input"></textarea><br>
			<input name="email" type="text" placeholder="이메일" value="<%= session.getAttribute("id") %>" readonly="readonly" class="Input"><br>
			<input name="tel" type="text" placeholder="연락처" class="Input"><br>
			<center><input type="submit" value="문의하기"></center>
		</form>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>