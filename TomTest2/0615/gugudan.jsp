<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>구구단</title>
</head>
<body>
	<center>
		<h3>구구단!!</h3>
		<hr>
		<table border="1" cellpadding="5" >
			<%for(int i=1;i<10;i++){%>
			<tr>
				<%for(int dan=2;dan<10;dan++){%>
					<td><%= dan+"*"+i+"="+dan*i %></td>
				<%} %>
			</tr>
			<%} %>
		</table>
	</center>
</body>
</html>