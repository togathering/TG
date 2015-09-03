<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/search.css">
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
<body style="background-color: #FAFAFA;">
	<div align="center">
	<form action="deleteNote" method="post">
	<div style="background-color: #E6E6E6; border: 1px solid lightgray; padding: 10px 5px;">
		<label>
			������� : ${noteBean.senderId}<br>
			�����ð� : ${noteBean.noteDate}
		</label>
	</div>
		<div style=" border: 1px solid lightgray; border-top: 0px; background-color: white; font-size: 14px;">
			<br>
			${noteBean.noteTitle}
			<textarea rows="15"  name="noteContent" maxlength="199"
						class="noteInput"  onkeydown="limitContentLength()" 
						style="padding:5px 5px; margin: 10px 0 20px 0; width:350px;">
							${noteBean.noteContent}
			</textarea>
			
		</div>
		<input type="hidden" id="noteNo" name="noteNo" value="${noteBean.noteNo}">
	</form>	
		<div style="padding-top: 10px;">
			<input type="submit" id="delete" class="sbutton" value="�����ϱ�" onclick="deleteMsg()">
			<input type="button" id="reply" class="sbutton" style="display: " value="�����ϱ�" 	
				onclick="msg('${noteBean.senderId }', '${noteBean.nick }')">
		</div>
	</div>
</body>
</html>