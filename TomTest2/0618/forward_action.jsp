<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>forward_action.jsp에서 footer.jsp호출</h3>
	<hr>
	<jsp:forward page="footer.jsp">
		<jsp:param value="sungho@daum.net" name="email"/>	
	</jsp:forward>
	<%
		RequestDispatcher dispatcher = request.getRequestDispatcher("footer.jsp");
		dispatcher.forward(request, response);
		
	%>
	<%--
		<페이지 포워드>
		1. pageContext.forward("footer.jsp"); ---> jsp
		2.<jsp:forward page="footer.jsp"/>    ---> jsp
		3. RequestDispatcher dispatcher = request.getRequestDispatcher("footer.jsp");
		   dispatcher.forward(request, response); --->jsp/Servlet
	 --%>
</body>
</html>