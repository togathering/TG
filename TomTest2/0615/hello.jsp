<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSP기본태그테스트</title>
</head>
<!-- hello.jsp(HTML주석) -->
<%-- hello.jsp(JSP주석) --%>
<%!
	//서블릿 변환시 멤버요소(멤버변수선언[과 초기화], 메소드정의(비권장))
	int su1=13;
	//su1=23;//초기화X
%>
<body>
	<table border='1'>
	<%
		//Scriptlet 서블릿 변환시 service()메소드내에 들어갈 내용
		//지역변수선언, 변수초기화, 메소드 호출, if, for
		for(int i=0;i<5;i++){		
	%>
			<tr><td>JSP안녕~!!</td></tr>
	<% 	} %>
<%-- 	
	<%
		for(int i=0;i<5;i++){
			out.print("<tr><td>길동안녕~!!</td></tr>");
		}
	%>
 --%>	
	</table>
	<hr>
<!-- <%
		out.write(97);
		out.print(97);	
	%>
	<%= "Hello~!!" %>
 -->	
</body>
</html>