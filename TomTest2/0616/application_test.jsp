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
	1. ��������: <%= application.getServerInfo()%><br>
	2. ����API����: <%= application.getMajorVersion() +","+application.getMinorVersion()%><br>
	3. �������ؽ�Ʈ�� ��ġ����: <%= application.getRealPath("/") %>
	
	<% 
		String pro = request.getProtocol();//HTTP��û ����
		String method = request.getMethod();
		String addr = request.getRemoteAddr();
		Date date = new Date();
		application.log("[Ŭ���̾�Ʈ ��������]��������: "+pro+"��û���: "+method+",�ּ�: "+addr+"���ӽð�: "+date); 
	%>
</body>
</html>