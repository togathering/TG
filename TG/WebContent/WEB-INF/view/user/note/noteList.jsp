<%@page import="com.tg.common.beans.NoteBean"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>

</head>

<body>	
	<div id="wrap">
	<section class="content_section">
		<div class="content_row_1">
			<table class="board_table">
				<caption>������</caption>

				<!-- ���̺� ��� -->
				<thead>
					<tr height="30" style="vertical-align: middle;">
						<td>�������</td><td>����</td><td>��¥</td>
					</tr>
				</thead>
				
				<!-- ���̺� �ٵ� (����) -->				
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