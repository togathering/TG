<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">

// �� üũ
function emptyCheck(){
	var id = document.frm.id.value;
	var nick = document.frm.nick.value;
	
	var email = new RegExp('^[a-zA-Z0-9]{4,15}@[a-zA-Z]+[.][a-zA-Z]', 'g');
	if(id.length == 0){
		alert("�̸����� �Է����ּ���.");	
		document.frm.id.focus();
		return;
	
	} else if(!email.test(id)){
		alert("�̸��������� �߸��ƽ��ϴ�");
		return;
	
	} else if(nick.length == 0){
		alert("�г����� �Է����ּ���.");	
		document.frm.nick.focus();
		return;
	}
	
	document.frm.submit();
}

// �̸��� ���� ���� ���θ� �˷��ִ� �˸�â ����
$(document).ready(function(){
	if('${result}' =='failGetPw'){
		alert("�̸��ϰ� �г����� �ٽ� Ȯ�����ּ���.");
	} 
})

</script>
</head>
<body>
	<form method="post" action="getPw" name="frm">
		�̸��ϰ� �г�����  �Է����ּ���. <hr> 
		�̸��� <input type="text" name="id" placeholder="�̸����� �Է����ּ���."><br>
		�г��� <input type="text" name="nick" placeholder="�г����� �Է����ּ���."><br>
	</form>
	<input type="submit" value="������" onclick="emptyCheck()">
</body>
</html>