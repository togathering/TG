<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h2>����� ����(ȣ��Ʈ)</h2><br>
			<%-- <font color="#add">���� ${hNum}���� ������ ȣ��Ʈ�� �ð��ֽ��ϴ�.</font><br><br> --%>
			<table id="hostGx" style="width: 75%;" class="board_table">
				<tr class="boardth">
					<th>�����̸�</th>
					<th>���</th>
					<th>�ð�</th>
					<th>�����ο�</th>
					<th style="padding-top: 8px;">��</td>
				</tr>
				<c:forEach  items='${list }' var='host' >
				<tr class="board_contents">
					<td><a style="color: gray;" href="groupinfo?gno=${host.gno }">${host.gtitle }</a></td>
					<td>${host.gloc }</td>
					<td>${host.gday }</td>
					<td>${host.gsum }</td>
					<td style="padding-top: 15px; width: 100px;">
					<input type="button" class="sbutton" value="��" onclick="review('${host.gno}')"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
</form>