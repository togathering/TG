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
	<h3>end������(�������������)</h3>
	<hr>
	�̸�:<jsp:getProperty property="name" name="p"/><br>
	����:<jsp:getProperty property="age" name="p"/><br>
	����:<jsp:getProperty property="job" name="p"/><br>
</body>
</html>