<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="css/search.css">
<c:forEach  items='${invite }' var='invite'>
	<tr class="board_contents" >
		<td width="220px" style="padding-top: 15px;">${invite.id } </td>
		<td width="150px">${invite.gtitle }</td>
		<td width="150px"><input type="button" class="sbutton" value="살펴보기" onclick="javascript:location.href='groupinfo?gno=${invite.gno }'">&nbsp; <input type="button" class="sbutton"  value="거절" onclick="delInvite('${invite.id}','${invite.gno }','${invite.fid }')"></td>
	</tr>
</c:forEach>