<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="p" class="t0618.Person" scope="request"/>
<%--
	p.setName("ȫ�浿");
	p.setAge(13);
	p.setJob("�л�");
	
--%>
<jsp:setProperty property="name" name="p" value="�����"/>
<jsp:setProperty property="age" name="p" value="13"/>
<jsp:setProperty property="job" name="p" value="�л�"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>start ������</h3>
	<hr>
	<%
		RequestDispatcher dispatcher =  request.getRequestDispatcher("end.jsp");
		dispatcher.forward(request, response);
	%>
</body>
</html>