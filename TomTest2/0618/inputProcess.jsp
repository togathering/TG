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
<title>전달</title>
</head>
<body>
	이름2: ${p.name}<br>
	나이2: ${p.age}<br>
	직업2: ${p.job}<br>
	<hr>
	가장 가까운 이름: ${k}<br>
	<hr>
	리스트 출력: ${list[0] }<br>
	리스트 출력: ${list[1] }
	<hr>
	
</body>
</html>