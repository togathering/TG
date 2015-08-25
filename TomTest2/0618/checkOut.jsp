<%@page import="hangul.Korean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>계산</title>
</head>
<body>
	<center>
		<h3>계산</h3>
		<%=session.getAttribute("username")%>님이 선택한 상품 목록<br>
		<hr>
		<table>
		<%
			ArrayList<String> list = new ArrayList<String>();
			list = (ArrayList<String>)session.getAttribute("list");
			for(int i=0;i<list.size();i++){
				out.print("<tr><td>");
				out.print(list.get(i));
				out.print("</td></tr>");
			}
		%>
		</table>
	</center>
</body>
</html>