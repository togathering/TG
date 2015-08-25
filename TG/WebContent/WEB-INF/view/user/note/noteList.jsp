<%@page import="com.tg.common.beans.NoteBean"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지함</title>
</head>

<body>	
	<table border="1px solid">
		<tr>
			<td>보낸사람</td><td>제목</td><td>날짜</td>
		</tr>
		
		<c:forEach  items="${noteList}" var='noteInfo' >
		<tr>
			<td><a href="">${noteInfo.senderId}</a></td>
			<td><a href="noteDtail?no=${noteInfo.noteNo}">${noteInfo.noteTitle}</a></td>
			<td>${noteInfo.noteDate}</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>