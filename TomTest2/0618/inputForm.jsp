<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>입력폼</title>
</head>
<%
	pageContext.setAttribute("k", "명준");
	request.setAttribute("k", "준원");
	session.setAttribute("k", "형호");
	application.setAttribute("k", "준섭");
	ArrayList<String> list = new ArrayList<String>();
	list.add("길동");
	list.add("명준");
	
	session.setAttribute("list", list);
	
	pageContext.forward("inputProcess.jsp");
	
%>


<body>
	<h3>입력폼</h3>
	<hr>
	<form action="inputProcess.jsp" method="post">
	이름: <input type="text" name="name"><br>
	나이: <input type="text" name="age"><br>
	직업: <input type="text" name="job"><br>
	<input type="submit" value="저장">
	</form>
</body>
</html>