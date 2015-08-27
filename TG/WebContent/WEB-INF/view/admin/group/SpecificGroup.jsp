<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	
		<table  id="mtable" class="board_table">
				<!-- 테이블헤더 -->
				<tr class="boardth">
					<th>모임번호</th>
					<th style="width: 250px">모임명</th>
					<th>만든날짜</th>
					<th>모임날짜</th>
					<th>참가인원</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="gsearchTitle">
					<tr class="board_contnets">
						<td align="center">${gsearchTitle.gno }</td>
						<td align="center"><a href="#"
							onClick="window.open('http://localhost/ToGathering/groupinfo.do?gno=${gsearchTitle.gno }','name','width=1300,height=630');return false">${gsearchTitle.gtitle }</a></td>
						<td align="center">${gsearchTitle.gday }</td>
						<td align="center">${gsearchTitle.gdate }</td>
						<td align="center">${gsearchTitle.gsum }</td>
						<td align="center">
						 <input	type="button" onclick="deleteG()" class="button" name="delete"
							id="delete" value="삭제"></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 -->
			<div class="paging_div" align="center">
			<a href="adminGroupList?pageNum=1">시작페이지</a>
			<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
				<a href="adminGroupList?pageNum=${i }">${i }</a>
			</c:forEach>
			<a href="adminGroupList?pageNum=${pageMaxNum }">끝페이지</a>
			</div>