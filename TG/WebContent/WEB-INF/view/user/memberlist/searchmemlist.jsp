<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${list }' var='memSearch' >
	<tr style="height: 30px; text-align: center;" >
		<td width="150px">프로필</td>
		<td width="220px">${memSearch.id } </td>
		<td width="150px">${memSearch.nick }</td>
		<td width="70px"><input type="button" value="친구신청" onclick="friend('${memSearch.id }')"></td>
		<td width="50px"><input type="button" value="신고" onclick="report('${memSearch.id }')"></td>
	</tr>
</c:forEach>		