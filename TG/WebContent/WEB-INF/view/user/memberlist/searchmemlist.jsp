<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${list }' var='memSearch' >
	<tr style="height: 30px; text-align: center;" >
		<td width="150px">������</td>
		<td width="220px">${memSearch.id } </td>
		<td width="150px">${memSearch.nick }</td>
		<td width="70px"><input type="button" value="ģ����û" onclick="friend('${memSearch.id }')"></td>
		<td width="50px"><input type="button" value="�Ű�" onclick="report('${memSearch.id }')"></td>
	</tr>
</c:forEach>		