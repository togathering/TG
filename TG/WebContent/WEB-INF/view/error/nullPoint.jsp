<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TG:Null </title>
</head>
<body>
<strong>서비스 처리 과정에서 널(NULL) 예외가 발생하였습니다.</strong>

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