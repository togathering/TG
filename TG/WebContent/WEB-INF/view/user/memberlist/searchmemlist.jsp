<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${list }' var='memSearch' >
	<tr  class="board_contents">
		<td width="150px"><a onclick="window.open('profile?id=${memSearch.id } ', '', 'width=950, height=540, screenX=200, screenY=60');"  style="color: gray" >프로필</a></td>
		<td width="220px">${memSearch.id } </td>
		<td width="150px">${memSearch.nick }</td>
		<td width="70px"><input type="button" class="sbutton" value="친구신청" onclick="friend('${memSearch.id }')"></td>
		<td width="50px"><input type="button" class="sbutton" value="신고" onclick="report('${memSearch.id }')"></td>
	</tr>
</c:forEach>		