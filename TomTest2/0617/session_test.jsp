<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>Session�׽�Ʈ</h3>
	<hr>
	<%
		session.setMaxInactiveInterval(3);
		if(session.isNew()){
			out.print("<script>alert('������ �����Ǿ� �ٽ� �����մϴ�!!')</script>");
			session.setAttribute("name", "ȫ�浿");
		}
	%>
	<%=session.getAttribute("name")%>�� ȯ���մϴ�~!! <br>
	1. ����ID : <%= session.getId() %><br>
	2. ���������ð� : <%= session.getMaxInactiveInterval() %><br>
</body>
</html>