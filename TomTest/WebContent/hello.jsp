<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Test</title>
</head>
<body>
	안녕, Dynamic Web Project(이클립스에서 기본제공하는 개발모드의 프로젝트)~!!<br>
	<% 
	String str="JavaServerPage";
	String subStr = str.substring(4);
	out.print("subStr="+subStr);
	%>
</body>
</html>