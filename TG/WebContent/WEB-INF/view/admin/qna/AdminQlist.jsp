<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="js/jquery.js"></script>
	 <table style="width: 95%;" id="mtable">
				<tr>
					<th style="width: 15%">아이디</th>
					<th style="width: 220px">문의제목</th>
					<th style="width: 150px">전화번호</th>
					<th style="width: 130px">날짜</th>
					<th style="width: 100px">답변하기</th>
				</tr>
		<c:forEach  items='${list }' var='qList' >
				<tr>
					<td align="center">${qList.id } </td>
					<td align="center" >${qList.qtitle }</td>
					<td align="center">${qList.tel }</td>
					<td align="center">${qList.qdate }</td>
					<td align="center"><input type="button" value="답장하기" onclick="qnaRequest('${qList.qno }')" id=""></td>
				</tr>
		</c:forEach>		
			</table>
