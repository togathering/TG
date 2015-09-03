<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
	<div class="wrapper">
	<br>
		<div style="float:left; margin-left: 50px;">
			<h4 style="text-align: left;">친구요청 리스트</h4>
			<br>
		</div>

		<table class="board_table" style="width: 70%"  id="reqTable">
			<tr class="boardth">
				<th width="200px">I D</th>
				<th width="140px">닉네임</th>
				<th width="100px">수락/거절</th>
			</tr>
		<c:forEach  items='${freq }' var='freq' >
			<tr class="board_contents" >
				<td width="220px" style="padding-top: 15px;">${freq.id } </td>
				<td width="150px">${freq.nick }</td>
				<td width="100px"><input type="button" class="sbutton"  value="수락" onclick="acceptFriend('${freq.id }')">&nbsp<input type="button" class="sbutton" value="거절" onclick="rejectFriend('${freq.id }')"></td>
			</tr>
		</c:forEach>
		</table>
	</div>
</form>
