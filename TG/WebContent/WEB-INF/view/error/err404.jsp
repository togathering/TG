<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TG:404 </title>

</head>
<body><strong>��û�� �������� �������� �ʽ��ϴ�:</strong>
<br><br>
�ּҸ� �ùٸ��� �Է��ߴ� �� Ȯ���غ��ñ� �ٶ��ϴ�.
<br>
<br>

[error ����]
<br>
<br>

�����ڵ� : ${requestScope['javax.servlet.error.status_code']}
<br>
����Ÿ�� : ${requestScope['javax.servlet.error.exception_type']}
<br>
�޼��� :  ${requestScope['javax.servlet.error.message']}
<br>
�������� URI : ${requestScope['javax.servlet.error.request_uri']}
<br>
�������� ���� : ${requestScope['javax.servlet.error.servlet_name']}  
<br>
</body>
</html>