<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	 <table style="width: 600px;" id="qList">
				<tr>
					<th style="width: 400px">��������</th>
					<th style="width: 130px">��¥</th>
					<th style="width: 130px">�亯����</th>
				</tr>
		<c:forEach  items='${list }' var='qList' >
				<tr>
					<td align="center"><a href="qnaReplyConfirm?qno=${qList.qno }" style="color: gray;">${qList.qtitle }</a></td>
					<td align="center">${qList.qdate }</td>
					<td align="center">${qList.qstatus }</td>
				</tr>
		</c:forEach>		
			</table>
