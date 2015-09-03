<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지함</title>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<script type="text/javascript">
/* // 쪽지 보는 팝업창 생성 
function msg(no, id) {
	var no = no;
	var id = id;
	window.open('noteDtail?no=' + no + '&id=' + id, '',
					'width=400, height=450, screenX=400, screenY=130, resizable=no');
} */
</script>

</head>

<body>
	<!-- 헤더 -->
	<div><tiles:insertAttribute name="header"/></div>
	
	<div >
	
	<!-- 테이블 시작> -->
	<table class="board_table">
		<caption>쪽지함</caption>
		<!-- 테이블 헤드 -->
		<thead>
			<tr class="boardth">
				<th>보낸사람</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		
		<!-- 테이블 바디 (본문) -->
		<tbody>
			
			<c:forEach items="${noteList}" var='noteInfo'>
				<tr class="board_contents">
					<td><a href="" class="atag">${noteInfo.senderId}</a></td>
					<td><a href="noteDtail?no=${noteInfo.noteNo}&senderId=${noteInfo.senderId}" class="atag" 
						onclick="window.open(this.href,'','popup', 'width=400, height=450'); return false">${noteInfo.noteTitle}</a></td>
					<td>${noteInfo.noteDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
			<!-- 페이징 -->
	<div align="center">
		<c:if test="${ begin_page != 1 }"><a href="?page=${ begin_page - 1 }">◁이전</a></c:if>
		<c:forEach begin="${ begin_page }" end="${ end_page }" var="page">
			<c:choose>
				<c:when test="${ page == pres_page }">${ page }</c:when>
				<c:otherwise><a class="atag" href="?page=${ page }">${ page }</a></c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${ end_page != max_page }"><a href="?page=${ end_page + 1 }">다음▷</a></c:if>
	</div>
	
	</div>
	
	<!-- 푸터 -->
	<div style="position: relative; top: 280px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>
