<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	 <table style="width: 95%;" id="mtable">
				<tr>
					<th style="width: 220px">�Ű���</th>
					<th>�ǽŰ���</th>
					<th>ī�װ�</th>
					<th>�Ű�¥</th>
					<th>�Ű�Ȯ��</th>
				</tr>
		<c:forEach  items='${list }' var='rList' >
				<tr>
					<td align="center">${rList.reporter } </td>
					<td align="center">${rList.accused }</td>
					<td align="center">${rList.category }</td>
					<td align="center">${rList.rdate }</td>
					<td align="center"><input type="button" value="Ȯ��" onclick="report('${rList.no }')"></td>
				</tr>
		</c:forEach>		
			</table>
