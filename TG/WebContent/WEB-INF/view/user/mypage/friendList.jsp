<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${flist }' var='flist' >
	<tr style="height: 20px; text-align: center; border: 1px; border: 1px solid lightgray;" >
		<td width="220px">${flist.id } </td>
		<td width="150px">${flist.nick }</td>
		<td width="70px"><input type="button" value="쪽지" onclick="msg('${flist.id }', '${flist.nick }')"></td>
		<td width="70px"><input type="button" value="삭제" onclick="delFriend('${flist.id }')"></td>
	</tr>
</c:forEach>