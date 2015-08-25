<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function checkValue() {
		var nick = document.frm.nick.value;
		var id = document.frm.id.value;
		var pass = document.frm.pass.value;
		var email = new RegExp('^[a-zA-Z0-9]{4,15}@[a-zA-Z]+[.][a-zA-Z]', 'g');	
		if(nick.length==0){
				alert('닉네임을 입력해주세요');
				document.frm.nick.focus();
				return;
			}
			if(id.length==0){
				alert('아이디를 입력해주세요');
				document.frm.id.focus();
				return;
			}else if(!email.test(id)){
				alert("이메일형식이 잘못됐습니다");
				return;
			}
			if(pass.length==0){
				alert('비밀번호를 입력해주세요');
				document.frm.pass.focus();
				return;
			}
			document.frm.submit();
	}
	
	$(document).ready(function() {
		if('${join}'=='fail'){
			alert("이미 사용중인 아이디입니다");
			location.href = 'join';
		}else if('${join}'=='success'){
			alert("가입을 축하합니다");
			location.href = 'login';
		}
	});
</script>
<head>
	<meta charset="UTF-8">
	<title>ToGathering : 회원가입</title>
	<link rel="stylesheet" href="css/join.css">
	<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/join.js"></script>
</head>
<body>
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
<div style="position: relative; top: 120px; margin-top: 100px; z-index: 1;">
	<div class="wrapper">
		<div class="container" style="padding-top: 40px">

			<h1 style="color: white;">시작하세요</h1>

			<form class="form" name="frm" method="post" action="joinpass">
				<input type="text" placeholder="Nickname" name="nick"> 
				<input type="text" placeholder="E-mail" name="id"> 
				<input
					type="password" placeholder="Password" name="pass">
				<button type="button" name="join_bt" onclick="checkValue()">Join</button>
			</form>
		</div>

		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>
	<div style="position: relative; top: 300px">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>
