<%@page import="java.util.ArrayList"%>
<%@page import="hangul.Korean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ����</title>
</head>
<body>
	<center>
		<h3>��ǰ����</h3>
		<hr>
		<% 
			request.setCharacterEncoding("euc-kr");
			String name = request.getParameter("username");
			if(name != null)
	        	 session.setAttribute("username", name);
		%>
		<%=session.getAttribute("username")%>���� �α����� �����Դϴ�
		<form action="add.jsp">
			<select name="product">
				<option>������</option>
				<option>��</option>
				<option>����</option>
				<option>���</option>
				<option>���ξ���</option>
			</select>
			<input type="submit" value="�߰�">
		</form>
			<a href="checkOut.jsp">���</a>
	</center>
</body>
</html>