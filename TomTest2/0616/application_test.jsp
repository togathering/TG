<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	1. 서버정보: <%= application.getServerInfo()%><br>
	2. 서블릿API버전: <%= application.getMajorVersion() +","+application.getMinorVersion()%><br>
	3. 서블릿컨텍스트의 위치정보: <%= application.getRealPath("/") %>
	
	<% 
		String pro = request.getProtocol();//HTTP요청 버전
		String method = request.getMethod();
		String addr = request.getRemoteAddr();
		Date date = new Date();
		application.log("[클라이언트 접속정보]프로토콜: "+pro+"요청방식: "+method+",주소: "+addr+"접속시간: "+date); 
	%>
</body>
</html>