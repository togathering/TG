<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form id="form" style="padding-top: 20px; text-align: center;">
	<div class="wrapper">
		<br>
		<div style="float: left; margin-left: 80px;">
			<h4 style="text-align: left;">내친구들</h4>
		</div>
		<table class="board_table" style="width: 70%" id="friendTable">
			<tr class="boardth">
				<th width="200px">I D</th>
				<th width="140px">닉네임</th>
				<th width="80px">쪽지</th>
				<th width="80px">친구삭제</th>
			</tr>

			<c:forEach items='${flist }' var='flist'>
				<tr class="board_contents" style="margin-top: 5px;">
					<td width="220px" style="padding-top: 15px">${flist.id }</td>
					<td width="150px">${flist.nick }</td>
					<td width="70px"><input type="button" class="sbutton"
						value="쪽지" onclick="msg('${flist.id }', '${flist.nick }')"></td>
					<td width="70px"><input type="button" class="sbutton"
						value="삭제" onclick="delFriend('${flist.id }')"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
