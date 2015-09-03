<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	// 쪽지 쓸수 있는 팝업창 생성 
	function msg(friendId, friendNick) {
		var id = friendId;
		var nick = friendNick;

		window
				.open('writeNote?id=' + id + '&nick=' + nick, '',
						'width=400, height=450, screenX=400, screenY=130, resizable=no');
	}

	function delFriend(delFriendId) {
		var del = confirm("삭제할거에요?");

		if (del) {
			$.ajax({
				url : "delFriend.do",
				type : "POST",
				data : "delId=" + delFriendId,
				dataType : "text",
				success : friendLoad()
			});
		}
	}
	<script type="text/javascript">

	$(document).ready(function(){
		friendLoad();
	});

</script>
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
