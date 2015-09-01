<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TG:500</title>
</head>
<body>
<strong>에러가 발생했습니다.:</strong>

<br><br>
페이지에 에러가 있습니다.

<br>
<br>

[error 내용]
<br>
<br>

에러코드 : ${requestScope['javax.servlet.error.status_code']}
<br>
에러타입 : ${requestScope['javax.servlet.error.exception_type']}
<br>
메세지 :  ${requestScope['javax.servlet.error.message']}
<br>
에러유발 URI : ${requestScope['javax.servlet.error.request_uri']}
<br>
에러유발 서블릿 : ${requestScope['javax.servlet.error.servlet_name']}  
<br>
</body>
</html>