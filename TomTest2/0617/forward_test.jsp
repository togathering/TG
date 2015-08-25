<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>포워드 이동</title>
</head>
<body>
	<h3>forward를 통한 페이지 이동</h3>
	<%
		String s1="조명준";
		String s2="오준원";
		String s3="김형호";
		String s4="김준섭";
		
		pageContext.setAttribute("k1", s1);
		request.setAttribute("k2", s2);
		session.setAttribute("k3", s3);
		application.setAttribute("k4", s4);
		
		
		pageContext.forward("result.jsp");
	%>
</body>
</html>