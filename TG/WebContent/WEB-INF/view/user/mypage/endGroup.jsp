<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h1>���� ����</h1><br><br>
			<table id="joinGx" style="width: 70%; margin-left: 5px;">
				<tr style="height: 40px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
					<td style="width: 100px; padding-top: 8px;">�����̸�</td>
					<td>������</td>
					<td>���</td>
					<td>�Ͻ�</td>
					<td>��</td>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr style="height: 80px; text-align: center; border: 1px; border: 1px solid lightgray;" >
					<td style="padding-top: 15px;"><a style="color: gray;" href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td><input type="button" value="��" onclick="review(${gx.gno})"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>