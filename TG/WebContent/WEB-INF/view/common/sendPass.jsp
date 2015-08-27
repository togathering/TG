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
	
	var email = new RegExp('^[a-zA-Z0-9]{4,15}@[a-zA-Z]+[.][a-zA-Z]', 'g');
	if(id.length == 0){
		alert("이메일을 입력해주세요.");	
		document.frm.id.focus();
		return;
	} else if(!email.test(id)){
		alert("이메일형식이 잘못됐습니다");
		return;
	}
	document.frm.submit();
}

// 이메일 전송 성공 여부를 알려주는 알림창 생성
$(document).ready(function(){
	if('${result}' =='fail'){
		alert("없는 이메일입니다.");
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