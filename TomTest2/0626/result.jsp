<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	<h3>���!!</h3>
	�̸�:${param.name }<br>
	����:${param.age }<br>
	�̸�:${param.name1 }<br>
	����:${param.age1 }<br>
	
	<c:catch var="e">
	<%
		String name = request.getParameter("gildong");
		out.print(name.equals("�浿"));
	%>
	</c:catch>
	<c:if test="${e != null }">
		���ܹ߻�!! <br> ${e }
	</c:if>
</body>
</html>