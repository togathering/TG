<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<table border="1">
			<tr bgcolor="skyblue">
			<th>��ȣ</th>
			<th>�ۼ���</th>
			<th>��ȭ��ȣ</th>
			<th>�ۼ���</th>
			<th>����</th>				
			</tr>
			<c:forEach var="guest" items="${list }">
				<tr>
					<td>${guest.id }</td>
					<td>${guest.name }</td>
					<td>${guest.tel }</td>
					<td>${guest.gdate }</td>
					<td>${guest.contents }</td>
				</tr>
			</c:forEach>
		</table>
	</center>

</body>
</html>