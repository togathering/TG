<%@page import="hangul.Korean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리다이렉트 이동</title>
</head>
<body>
	<h3>redirect를 통한 페이지 이동</h3>
	<% 
		response.sendRedirect("result.jsp");
	%>
</body>
</html>