<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<script type="text/javascript" src="js/jquery.js"></script>
<div class="board_div" > 
	 <table style="width: 700px; border-collapse: collapse;" id="mtable" class="board_table">
				<tr class="boardth">
					<th style="width: 150px">���̵�</th>
					<th style="width: 220px">��������</th>
					<th style="width: 150px">��ȭ��ȣ</th>
					<th style="width: 130px">��¥</th>
					<th style="width: 100px">�亯�ϱ�</th>
				</tr>
		<c:forEach  items='${list }' var='qList' >
				<tr class="board_contnets">
					<td align="center">${qList.id } </td>
					<td align="center" >${qList.qtitle }</td>
					<td align="center">${qList.tel }</td>
					<td align="center">${qList.qdate }</td>
					<td align="center"><input type="button" value="�����ϱ�"  class="sbutton"  onclick="qnaRequest('${qList.qno }')" id=""></td>
				</tr>
		</c:forEach>		
	</table>
</div>
