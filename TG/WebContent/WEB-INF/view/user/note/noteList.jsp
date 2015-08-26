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
	<div id="wrap">
	<section class="content_section">
		<div class="content_row_1">
			<table class="board_table">
				<caption>쪽지함</caption>

				<!-- 테이블 헤드 -->
				<thead>
					<tr height="30" style="vertical-align: middle;">
						<td>보낸사람</td><td>제목</td><td>날짜</td>
					</tr>
				</thead>
				
				<!-- 테이블 바디 (본문) -->				
				<tbody>
					<c:forEach  items="${noteList}" var='noteInfo' >
					<tr>
						<td><a href="" style="text-decoration: none">${noteInfo.senderId}</a></td>
						<td><a href="noteDtail?no=${noteInfo.noteNo}" style="text-decoration: none">${noteInfo.noteTitle}</a></td>
						<td>${noteInfo.noteDate}</td>
					</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</section>
	</div>
</body>
</html>