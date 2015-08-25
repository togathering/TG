<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" autoFlush="false" buffer="1kb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i=1;i<100;i++){
			out.print(1);
		}
	
	%>


	1. 설정된 버퍼크기: <%= out.getBufferSize() %><br>
	2. 남아있는 버퍼크기: <%= out.getRemaining() %>
</body>
</html>