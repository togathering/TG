<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>include지시자 테스트</title>
</head>
<%-- 현재문서에 다른 문서를 포함시켜 컴파일하고 결과를 화면에 출력 --%>
<body>
	<center>
		<h3>INCLUDE directive Test</h3>
		<hr>
		<%@include file="menu.jsp"%>
		<table border="0" cellpadding="5">
			<tr>
				<td align="left"><font size="-1"><%@include file="shopping.jsp" %></font></td>
				<td width="30">&nbsp;</td>
				<td align="left"><font size="-1"><%@include file="news.jsp" %></font></td>			
			</tr>
		</table>
	</center>
</body>
</html>