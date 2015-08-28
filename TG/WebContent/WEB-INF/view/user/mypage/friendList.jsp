<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${flist }' var='flist' >
	<tr class="board_contents" >
		<td width="220px">${flist.id } </td>
		<td width="150px">${flist.nick }</td>
		<td width="70px"><input type="button" class="sbutton" value="쪽지" onclick="msg('${flist.id }', '${flist.nick }')"></td>
		<td width="70px"><input type="button" class="sbutton" value="삭제" onclick="delFriend('${flist.id }')"></td>
	</tr>
</c:forEach>