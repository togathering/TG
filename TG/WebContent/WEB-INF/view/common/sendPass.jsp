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
	var nick = document.frm.nick.value;
	
	var email = new RegExp('^[a-zA-Z0-9]{4,15}@[a-zA-Z]+[.][a-zA-Z]', 'g');
	if(id.length == 0){
		alert("이메일을 입력해주세요.");	
		document.frm.id.focus();
		return;
	
	} else if(!email.test(id)){
		alert("이메일형식이 잘못됐습니다");
		return;
	
	} else if(nick.length == 0){
		alert("닉네임을 입력해주세요.");	
		document.frm.nick.focus();
		return;
	}
	
	document.frm.submit();
}

// 이메일 전송 성공 여부를 알려주는 알림창 생성
$(document).ready(function(){
	if('${result}' =='failGetPw'){
		alert("이메일과 닉네임을 다시 확인해주세요.");
	} 
})

</script>
</head>
<body>
	<form method="post" action="getPw" name="frm">
		이메일과 닉네임을  입력해주세요. <hr> 
		이메일 <input type="text" name="id" placeholder="이메일을 입력해주세요."><br>
		닉네임 <input type="text" name="nick" placeholder="닉네임을 입력해주세요."><br>
	</form>
	<input type="submit" value="보내기" onclick="emptyCheck()">
</body>
</html>