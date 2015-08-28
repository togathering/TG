<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>

<style type="text/css">
a{
text-decoration:none;
font:bold;
color:rgb(41, 128, 185);
}
th{
font-size: 15px;
color:white;;
}
td{
font-size: 14px;
color: #585858;
}
.board_div{
float:left;
width: 100%;
margin: 0 auto;
}
.board_table{
width: 80%; 
min-width:800px; 
margin:1% auto; 
border-collapse: collapse;"
}
.boardth{
height:45px;
background-color: rgb(245, 88, 88);
}
.board_contnets{
border-bottom: 1px solid #2E2E2E;
height: 47px; 
font: bold;"
}
.search_input{
 height: 30px;
 width:30%;
 min-width:400px; 
 padding: 3px 6px; 
 font-size: 14px;"
}
.search_div{
	float:left;
 	width: 90%; 
 	margin-left:10%;
 	padding: 0 auto;
}
.paging_div{
float:left;
 margin:15px auto;
 width:100%;
 text-align: center;
}
</style>
</head>

<body>
	<!-- ��� -->
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	
	<div class="board_div">
	
	<!-- ���̺� ����> -->
	<table class="board_table">
		<caption>������</caption>

		<!-- ���̺� ��� -->
		<thead>
			<tr class="boardth">
				<th>�������</th>
				<th>����</th>
				<th>��¥</th>
			</tr>
		</thead>
		
		<!-- ���̺� �ٵ� (����) -->
		<tbody>
			
			<c:forEach items="${noteList}" var='noteInfo'>
				<tr class="board_contnets">
					<td><a href="" style="text-decoration: none">${noteInfo.senderId}</a></td>
					<td><a href="noteDtail?no=${noteInfo.noteNo}&senderId=${noteInfo.senderId}"
						style="text-decoration: none">${noteInfo.noteTitle}</a></td>
					<td>${noteInfo.noteDate}</td>
				</tr>
			</c:forEach>
		</tbody>
		

		
		<!-- ����¡ -->
		<%-- <tfoot>
			<tr class="paging_div" style="text-align: center;">
				<td colspan="3" >
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
		</tfoot> --%>
	</table>
	
			<!-- ����¡ -->
		<div class="paging_div" align="center">
			<c:if test="${ begin_page != 1 }"><a href="?page=${ begin_page - 1 }"><-����</a></c:if>
			<c:forEach begin="${ begin_page }" end="${ end_page }" var="page">
				<c:choose>
					<c:when test="${ page == pres_page }">${ page }</c:when>
					<c:otherwise><a href="?page=${ page }">${ page }</a></c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${ end_page != max_page }"><a href="?page=${ end_page + 1 }">����-></a></c:if>
		</div>
	
	</div>
	
	<!-- Ǫ�� -->
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>