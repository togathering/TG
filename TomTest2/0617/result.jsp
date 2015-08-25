<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과</title>
</head>
<body>
	<center>
		<h3>결과화면</h3>
		<hr>
		<% request.setCharacterEncoding("EUC-KR"); %>
		폼에 입력된 이름 : <%= request.getParameter("name")%>
		
		<h3>영역데이터 출력</h3>
		<hr>
		s1: <%=pageContext.getAttribute("k1")%><br>
		s2: <%=request.getAttribute("k2")%><br>
		s3: <%=session.getAttribute("k3")%><br>
		s4: <%=application.getAttribute("k4")%><br>
	</center>
</body>
</html>