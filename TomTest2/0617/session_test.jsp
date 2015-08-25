<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>Session테스트</h3>
	<hr>
	<%
		session.setMaxInactiveInterval(3);
		if(session.isNew()){
			out.print("<script>alert('세션이 해제되어 다시 설정합니다!!')</script>");
			session.setAttribute("name", "홍길동");
		}
	%>
	<%=session.getAttribute("name")%>님 환영합니다~!! <br>
	1. 세션ID : <%= session.getId() %><br>
	2. 세션유지시간 : <%= session.getMaxInactiveInterval() %><br>
</body>
</html>