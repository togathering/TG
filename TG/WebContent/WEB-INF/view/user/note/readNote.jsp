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
	
	// ���� ���� �ִ� �˾�â ���� 
	function msg(friendId, friendNick) {
		var id = friendId;
		var nick = friendNick; 
		
		window.open('writeNote?id='+id+'&nick='+nick,'',
					'width=400, height=450, screenX=400, screenY=130, resizable=no');
	}
	
	function deleteMsg(){
		alert("������ �����Ǿ����ϴ�.");
	}
	
</script>
</head>
<body>
	<div>
		������� : ${noteBean.senderId}<br>
		�����ð� : ${noteBean.noteDate}<br><br>
		${noteBean.noteTitle}<hr style="width: 365px;" align="left">
		<pre>${noteBean.noteContent}</pre>
	</div>
	
	<form action="deleteNote" method="post">
		<input type="hidden" id="noteNo" name="noteNo" value="${noteBean.noteNo}">
		<input type="submit" id="delete" class="sm_button" value="�����ϱ�" onclick="deleteMsg()">
	</form>	
	<input type="button" id="reply" class="sm_button" style="display: " value="�����ϱ�" 	
			onclick="msg('${noteBean.senderId }', '${noteBean.nick }')">
	
</body>
</html>