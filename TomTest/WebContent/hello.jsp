<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Test</title>
</head>
<body>
	�ȳ�, Dynamic Web Project(��Ŭ�������� �⺻�����ϴ� ���߸���� ������Ʈ)~!!<br>
	<% 
	String str="JavaServerPage";
	String subStr = str.substring(4);
	out.print("subStr="+subStr);
	%>
</body>
</html>