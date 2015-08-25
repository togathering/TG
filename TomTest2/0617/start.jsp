<%@page import="t0618.A"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="t0618.A"  id="a" scope="session"></jsp:useBean>
<%
	//t0618.A a2 = new t0618.A();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>start 페이지</h3>
	<%
		String s1="조명준";
		String s2="오준원";
		String s3="김형호";
		String s4="김준섭";
		
		pageContext.setAttribute("k1", s1);
		request.setAttribute("k2", s2);
		session.setAttribute("k3", s3);
		application.setAttribute("k4", s4);
		
		
		pageContext.forward("end.jsp");
		//response.sendRedirect("end.jsp");
		
	%>
</body>
</html>