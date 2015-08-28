<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<link rel="stylesheet" type="text/css" href=css/search.css>
<script type="text/javascript">
	function reqLoad() {
		$.ajax({url:"myFriendReq", type:"POST", dataType:"text",
			success:function(data1){
				var table1 = document.getElementById('reqTable');
				table1.innerHTML = data1;
			}
		});
	}
	function friendLoad() {
		$.ajax({url:"myFriendList", type:"POST",data:"page=myPage", dataType:"text",
			success:function(data2){
				var table2 = document.getElementById('friendTable');
				table2.innerHTML = data2;
			}
		});
	}
	
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
	
	 // 쪽지 쓸수 있는 팝업창 생성 
	function msg(friendId, friendNick) {
		var id = friendId;
		var nick = friendNick; 
		
		window.open('writeNote?id='+id+'&nick='+nick,'',
					'width=400, height=450, screenX=400, screenY=130, resizable=no');
	}
	
	
	
	function delFriend(delFriendId) {
		var del = confirm("삭제할거에요?");
		
		if(del){
			$.ajax({url:"delFriend.do", type:"POST", data: "delId="+delFriendId, dataType:"text",
				success:friendLoad()
			});
		}
	}
	
	$(document).ready(function(){
		reqLoad();
		friendLoad();
	});
</script>


<title>Insert title here</title>
</head>
<body>
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="myPageHeader"/>
	</div>
	<div align="center">
		<h2>마이 프렌드</h2>
		<hr>
	
		<h3>친구수락하기</h3>
		<br>
		<table class="board_table">
			<tr class="boardth">
				<th width="50%">I D</th>
				<th width="25%">닉네임</th>
				<th width="25%">수락/거절</th>
			</tr>
		</table>
		<table  class="board_table" id="reqTable">
			
		</table>
		<hr>
		<h3 align="center">내친구들</h3>
		<br>
		<table class="board_table">
			<tr class="boardth">
				<th width="220px">I D</th>
				<th width="150px">닉네임</th>
				<th width="80px">쪽지</th>
				<th width="80px">친구삭제</th>
			</tr>
		</table>
		<table class="board_table" id="friendTable">
		
		</table>
	
	</div>
	
	<div style="position: relative; top: 30px">
		<tiles:insertAttribute name="footer" />
	</div>	
</body>
</html>