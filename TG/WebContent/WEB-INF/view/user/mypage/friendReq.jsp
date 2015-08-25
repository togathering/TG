<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach  items='${freq }' var='freq' >
	<tr style="height: 20px; text-align: center; border: 1px; border: 1px solid lightgray;" >
		<td width="220px">${freq.id } </td>
		<td width="150px">${freq.nick }</td>
		<td width="100px"><input type="button" value="수락" onclick="acceptFriend('${freq.id }')">/<input type="button" value="거절" onclick="rejectFriend('${freq.id }')"></td>
	</tr>
</c:forEach>