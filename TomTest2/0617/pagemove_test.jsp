<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="forward_test.jsp" method="post">
	<h3>�������̵�1</h3>
		�̸�:<input type="text" name="name">
			 <input type="submit" value="�������̵�(forward)">
	</form>
	<hr color="blue">
	<form action="redirect_test.jsp" method="post">
	<h3>�������̵�2</h3>
		�̸�:<input type="text" name="name">
			 <input type="submit" value="�������̵�(redirect)">
	</form>
</body>
</html>