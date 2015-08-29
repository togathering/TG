<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${invite }' var='invite'>
	<tr class="board_contnets" >
		<td width="220px">${invite.id } </td>
		<td width="150px">${invite.gtitle }</td>
		<td width="100px"><input type="button" value="살펴보기" onclick="javascript:location.href='groupinfo?gno=${invite.gno }'"> / <input type="button" value="거절" onclick="delInvite('${invite.id}','${invite.gno }','${invite.fid }')"></td>
	</tr>
</c:forEach>