<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="p" class="t0618.Person" />
<%--
<jsp:setProperty property="name" name="p"/>
<jsp:setProperty property="age" name="p"/>
<jsp:setProperty property="job" name="p"/>
--%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:setProperty property="*" name="p"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
</head>
<body>
	�̸�2: ${p.name}<br>
	����2: ${p.age}<br>
	����2: ${p.job}<br>
	<hr>
	���� ����� �̸�: ${k}<br>
	<hr>
	����Ʈ ���: ${list[0] }<br>
	����Ʈ ���: ${list[1] }
	<hr>
	
</body>
</html>