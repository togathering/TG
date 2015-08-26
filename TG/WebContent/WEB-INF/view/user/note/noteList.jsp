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
<style type="text/css">
div#itsthetable{
	font-family:		Helvetica, Arial, "Franklin Gothic Medium", sans-serif;
}

table{
	border-collapse: collapse;
	text-align:left;
}
caption{
	text-transform:		uppercase;
	font-size: 			2em;
	color:				#000000;
	text-align:			left;
	font-weight:		bolder;
	border-bottom:		6px solid #000;
}

thead tr th{
	color:				#0099ff;
	text-transform:		uppercase;
	text-align:			center;	
	padding:			0.4em 0;
	border-bottom:		3px solid #000;
}

tfoot th, tfoot td{
	border-top:			3px solid #000;
}
tr td, tr th{
	border-bottom:		1px solid #000;
	padding:			0.6em 0.4em;
	line-height:		1.5em;
}
tr.odd td, tr.odd th{
	background:url(tablebkg.jpg) top left repeat-x;
}

tbody th a{
	text-transform:uppercase;
}

tbody a, tbody a:link{
	color:			#0099ff;
	font-weight:	bold;	
	text-decoration:none;
}

tbody a:visited{
	color:			#000;
}
</style>

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