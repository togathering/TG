<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>DataBase Connection Pool테스트</h3>
	<%
		Context ctx = new InitialContext();
		Context tomCtx = (Context)ctx.lookup("java:comp/env");
		
		DataSource ds = (DataSource)tomCtx.lookup("jdbc/oracle");
		
		Connection conn = ds.getConnection();
		out.print("DB연결성공!!");
	%>
</body>
</html>