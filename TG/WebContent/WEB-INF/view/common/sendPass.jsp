<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">

// 빈값 체크
function emptyCheck(){
	var id = document.frm.id.value;
	
	if(id.length == 0){
		alert("이메일을 입력해주세요.");	
		document.frm.noteTitle.focus();
		return;
	}
	document.frm.submit();
}

// 이메일 전송 성공 여부를 알려주는 알림창 생성
$(document).ready(function(){
	if('${result}' =='fail'){
		alert("없는 이메일입니다.");
	} else('${result}' =='success'){
		alert("비밀번호를 이메일로 전송하였습니다.");
	}
})

</script>
</head>
<body>
	<form method="post" action="getPw" name="frm">
		이메일 입력을 입력해주세요. <br> 
		<input type="text" name="id" placeholder="이메일을 입력해주세요."><br>
	</form>
	<input type="submit" value="보내기" onclick="emptyCheck()">
</body>
</html>