<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	
		<table  id="mtable" class="board_table">
				<!-- ���̺���� -->
				<tr class="boardth">
					<th>���ӹ�ȣ</th>
					<th style="width: 250px">���Ӹ�</th>
					<th>���糯¥</th>
					<th>���ӳ�¥</th>
					<th>�����ο�</th>
					<th>����</th>
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
							id="delete" value="����"></td>
					</tr>
				</c:forEach>
			</table>
			<!-- ����¡ -->
			<div class="paging_div" align="center">
			<a href="adminGroupList?pageNum=1">����������</a>
			<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
				<a href="adminGroupList?pageNum=${i }">${i }</a>
			</c:forEach>
			<a href="adminGroupList?pageNum=${pageMaxNum }">��������</a>
			</div>