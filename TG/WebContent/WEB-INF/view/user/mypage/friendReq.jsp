<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function acceptFriend(acceptId) {
	$.ajax({url:"acceptFriend", type:"POST", data: "fid="+acceptId, dataType:"text",
		success:function(data){
			reqLoad();
			friendLoad();
		}
	});
}

function rejectFriend(rejectId) {		
	$.ajax({url:"rejectFriend", type:"POST", data: "rejectId="+rejectId, dataType:"text",
		success:function(data){
			reqLoad();
			friendLoad();
		}
	});
}
<script type="text/javascript">

$(document).ready(function(){
	reqLoad();
});

</script>
			<form id="form" style="padding-top: 20px; text-align: center;">
			<div class="wrapper">
				<br>
			<div style="float:left; margin-left: 80px;">
				<h4 style="text-align: left;">친구수락하기</h4>
			</div>

			<table class="board_table" style="width: 70%"  id="reqTable">
				<tr class="boardth">
					<th width="200px">I D</th>
					<th width="140px">닉네임</th>
					<th width="100px">수락/거절</th>
				</tr>
			<c:forEach  items='${freq }' var='freq' >
				<tr class="board_contents" >
					<td width="220px">${freq.id } </td>
					<td width="150px">${freq.nick }</td>
					<td width="100px" ><input type="button" value="수락" onclick="acceptFriend('${freq.id }')" class="sbutton" style="margin-top:5px;">&nbsp<input type="button" value="거절" class="sbutton"  style="margin-top:5px;"onclick="rejectFriend('${freq.id }')"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</form>
