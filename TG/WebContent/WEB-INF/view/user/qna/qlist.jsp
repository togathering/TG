<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	 <table style="width: 600px;" id="qList">
				<tr class="boardth">
					<th style="width: 400px">문의제목</th>
					<th style="width: 130px">날짜</th>
					<th style="width: 130px">답변상태</th>
				</tr>
		<c:forEach  items='${list }' var='qList' >
				<tr class="board_contents">
					<td align="center"  style="padding-top: 15px;"><a href="qnaReplyConfirm?qno=${qList.qno }" style="color: gray;">${qList.qtitle }</a></td>
					<td align="center">${qList.qdate }</td>
					<td align="center">${qList.qstatus }</td>
				</tr>
		</c:forEach>		
			</table>
