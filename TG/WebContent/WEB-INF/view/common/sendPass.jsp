<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<script type="text/javascript">

// �� üũ
function emptyCheck(){
	var id = document.frm.id.value;
	
	if(id.length == 0){
		alert("�̸����� �Է����ּ���.");	
		document.frm.noteTitle.focus();
		return;
	}
	document.frm.submit();
	
	alert("�̸��Ϸ� ��й�ȣ�� �����Ͽ����ϴ�.");
}
</script>
</head>
<body>
	<form method="post" action="getPw" name="frm">
		�̸��� �Է��� �Է����ּ���. <br> 
		<input type="text" name="id" placeholder="�̸����� �Է����ּ���."><br>
	</form>
	<input type="submit" value="������" onclick="emptyCheck()">
</body>
</html>