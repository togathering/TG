<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>

<style type="text/css">

table.type07 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #ccc;
    margin: 20px 10px;
}

table.type07 thead {
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    background: #e7708d;
    text-align: center;
}

table.type07 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
}

table.type07 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    text-align: center;
}
</style>
</head>

<body>
	<table class="type07">
		<caption>������</caption>

		<!-- ���̺� ��� -->
		<thead>
			<tr>
				<th>�������</th>
				<th>����</th>
				<th>��¥</th>
			</tr>
		</thead>
		
		<!-- ���̺� �ٵ� (����) -->
		<tbody>
			
			<c:forEach items="${noteList}" var='noteInfo'>
				<tr>
					<td><a href="" style="text-decoration: none">${noteInfo.senderId}</a></td>
					<td><a href="noteDtail?no=${noteInfo.noteNo}"
						style="text-decoration: none">${noteInfo.noteTitle}</a></td>
					<td>${noteInfo.noteDate}</td>
				</tr>
			</c:forEach>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="3">
					<c:if test="${ begin_page != 1 }"><a href="?page=${ begin_page - 1 }"><-����</a></c:if>
					<c:forEach begin="${ begin_page }" end="${ end_page }" var="page">
						<c:choose>
							<c:when test="${ page == pres_page }">${ page }</c:when>
							<c:otherwise><a href="?page=${ page }">${ page }</a></c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${ end_page != max_page }"><a href="?page=${ end_page + 1 }">����-></a></c:if>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>