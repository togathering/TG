<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.js"></script>	

<script type="text/javascript">
	
	function showBt() {
		if('${check}' == 'admin'){
			document.getElementById('reply').style.display = 'none';
		}
	}
	
	$(document).ready(function () {
		showBt();
	});
	
	// 쪽지 쓸수 있는 팝업창 생성 
	function msg(friendId, friendNick) {
		var id = friendId;
		var nick = friendNick; 
		
		window.open('writeNote?id='+id+'&nick='+nick,'',
					'width=400, height=450, screenX=400, screenY=130, resizable=no');
	}
	
	function deleteMsg(){
		alert("쪽지가 삭제되었습니다.");
	}
	
</script>
</head>
<body>
	<div>
		보낸사람 : ${noteBean.senderId}<br>
		받은시간 : ${noteBean.noteDate}<br><br>
		${noteBean.noteTitle}<hr style="width: 365px;" align="left">
		<pre>${noteBean.noteContent}</pre>
	</div>
	
	<form action="deleteNote" method="post">
		<input type="hidden" id="noteNo" name="noteNo" value="${noteBean.noteNo}">
		<input type="submit" id="delete" class="sm_button" value="삭제하기" onclick="deleteMsg()">
	</form>	
	<input type="button" id="reply" class="sm_button" style="display: " value="답장하기" 	
			onclick="msg('${noteBean.senderId }', '${noteBean.nick }')">
	
</body>
</html>