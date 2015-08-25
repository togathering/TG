<%@page import="java.util.ArrayList"%>
<%@page import="hangul.Korean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품선택</title>
</head>
<body>
	<center>
		<h3>상품선택</h3>
		<hr>
		<% 
			request.setCharacterEncoding("euc-kr");
			String name = request.getParameter("username");
			if(name != null)
	        	 session.setAttribute("username", name);
		%>
		<%=session.getAttribute("username")%>님이 로그인한 상태입니다
		<form action="add.jsp">
			<select name="product">
				<option>오렌지</option>
				<option>귤</option>
				<option>수박</option>
				<option>사과</option>
				<option>파인애플</option>
			</select>
			<input type="submit" value="추가">
		</form>
			<a href="checkOut.jsp">계산</a>
	</center>
</body>
</html>