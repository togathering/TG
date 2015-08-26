<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

					<tr height="30" style="vertical-align: middle;">
						<td>보낸사람</td>
						<td>제목</td>
						<td>날짜</td>
					</tr>

					<!-- 테이블 바디 (본문) -->
					<c:forEach items="${noteList}" var='noteInfo'>
						<tr>
							<td><a href="" style="text-decoration: none">${noteInfo.senderId}</a></td>
							<td><a href="noteDtail?no=${noteInfo.noteNo}"
								style="text-decoration: none">${noteInfo.noteTitle}</a></td>
							<td>${noteInfo.noteDate}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3">
							<c:if test="${ begin_page != 1 }"><a href="?page=${ begin_page - 1 }"><-이전</a></c:if>
							<c:forEach begin="${ begin_page }" end="${ end_page }" var="page">
								<c:choose>
									<c:when test="${ page == pres_page }">${ page }</c:when>
									<c:otherwise><a href="?page=${ page }">${ page }</a></c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${ end_page != max_page }"><a href="?page=${ end_page + 1 }">다음-></a></c:if>
						</td>
					</tr>
				</table>
			</div>
		</section>
	</div>
</body>
</html>