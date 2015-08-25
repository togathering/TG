<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="p" class="t0618.Person" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>end페이지(영역데이터출력)</h3>
	<hr>
	이름:<jsp:getProperty property="name" name="p"/><br>
	나이:<jsp:getProperty property="age" name="p"/><br>
	직업:<jsp:getProperty property="job" name="p"/><br>
</body>
</html>