<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
		<br>
		<div style="float:left; margin-left: 80px;">
		<h4 style="text-align: left;">������ ���� �� ������ ����</h4>
		</div>
			<br>
			<table id="joinGx" style="width: 70%;"class="board_table">
				<tr class="boardth">
					<th style="width: 100px; padding-top: 8px;">�����̸�</th>
					<th>������</th>
					<th style="width: 270px">���</th>
					<th style="width: 170px">�Ͻ�</th>
					<th>��</th>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr  class="board_contents" >
					<td style="padding-top: 15px;"><a style="color: #58ACFA; href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td><input type="button" class="sbutton" value="��" onclick="review(${gx.gno})"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>