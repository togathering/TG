<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Է���</title>
</head>
<%
	pageContext.setAttribute("k", "����");
	request.setAttribute("k", "�ؿ�");
	session.setAttribute("k", "��ȣ");
	application.setAttribute("k", "�ؼ�");
	ArrayList<String> list = new ArrayList<String>();
	list.add("�浿");
	list.add("����");
	
	session.setAttribute("list", list);
	
	pageContext.forward("inputProcess.jsp");
	
%>


<body>
	<h3>�Է���</h3>
	<hr>
	<form action="inputProcess.jsp" method="post">
	�̸�: <input type="text" name="name"><br>
	����: <input type="text" name="age"><br>
	����: <input type="text" name="job"><br>
	<input type="submit" value="����">
	</form>
</body>
</html>