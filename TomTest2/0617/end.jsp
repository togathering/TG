<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean class="t0618.A"  id="a" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>end페이지(영역데이터출력)</h3>
	<hr>
	<%
		request.removeAttribute("k2");
		session.removeAttribute("k3");
		application.removeAttribute("k4");
	%>
	s1: <%=pageContext.getAttribute("k1")%><br>
	s2: <%=request.getAttribute("k2")%><br>
	s3: <%=session.getAttribute("k3")%><br>
	s4: <%=application.getAttribute("k4")%><br>
</body>
</html>