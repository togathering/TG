<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <div class="board_div">
	 <table style="width: 60%; border-collapse: collapse;" id="mtable" class="board_table">
				<tr class="boardth">
					<th style="width: 220px">신고자</th>
					<th>피신고자</th>
					<th>카테고리</th>
					<th>신고날짜</th>
					<th>신고확인</th>
				</tr>
		<c:forEach  items='${list }' var='rList' >
				<tr class="board_contnets">
					<td align="center">${rList.reporter } </td>
					<td align="center">${rList.accused }</td>
					<td align="center">${rList.category }</td>
					<td align="center">${rList.rdate }</td>
					<td align="center"><input type="button" value="확인" class="sbutton" onclick="report('${rList.no }')"></td>
				</tr>
		</c:forEach>		
			</table>
    </div>
    
