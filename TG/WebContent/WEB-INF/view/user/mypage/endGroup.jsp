<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h2>���� ����</h2><br>
			<table id="joinGx" style="width: 75%;"class="board_table">
				<tr class="boardth">
					<th style="width: 100px; padding-top: 8px;">�����̸�</th>
					<th>������</th>
					<th>���</th>
					<th>�Ͻ�</th>
					<th>��</th>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr  class="board_contents" >
					<td><a href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td><input type="button" class="sbutton" value="��" onclick="review(${gx.gno})"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>