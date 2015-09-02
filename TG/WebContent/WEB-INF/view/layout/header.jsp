<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/headfoot.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<title>Insert title here</title>

<script type="text/javascript">
	var nick;
	function loginOk() {// 헤더부분, 로그인&회원가입 -> 사용자 닉네임으로 변경
		var nick = '${nick}';
		var ul = document.getElementById("ul");
		if(nick!=''){
			var msg = '<li><a href="#">'+nick+'▽</a>';
				  msg += '<ul><li><a href="#" onclick="logOut()">모임 목록</a></li>';
				  msg += '<li><a href="#" onclick="빈값()">원해요 리스트</a></ul></li>';
				  msg += '<li><a href="#" onclick="빈값()">친구 리스트</a></ul></li>';
				  msg += '<li><a href="#" onclick="mypage()">프로필 수정</a></ul></li>';
				  msg += '<li><a href="#" onclick="logOut()">로그아웃</a></li>';
				  msg += '<li><a href="#">메세지</a></li>';
				  msg += '<li><a href="userlist">사람찾기</a></li>';
			ul.innerHTML = msg;
		}else{
			var msg = '<li><a href="join">회원가입</a></li>';
			msg +='<li><a href="login">로그인</a></li>';
			msg +='<li><a href="groupsearch">모임찾기</a></li>';
		
			ul.innerHTML= msg;
		}
	}
	
	function checkLogin() {
		if('${id}' == ''){
			alert('로그인을 먼저 해주세요');
			location.href = 'login';
		}else{
			location.href = 'selectGx';
		}
	}
	
	function logOut(){
		alert("로그아웃 합니다");
		
		location.href = "logoutpass"
	}
	
	function mypage(){
		
			location.href = 'mypage'
		
	}
	function profile() {
		location.href = 'pro'
	}
	
	$(document).ready(function(){
		loginOk();
		
		$('.hamburger').click(function(){ //Hamburger Menu & Icon
			/* $("nav").fadeToggle(); */
			$(this).toggleClass('opned');
			$('header nav').toggleClass('active');
		});
	});
</script>

</head>
<body>
	<header>
	<div class="wrapper4">
		<a href="main"><img src="img/logo2.png" class="logo" alt="" title="" /></a>
		<a href="#" class="hamburger"></a>
		<nav>
		<ul id="ul">
		</ul>

		<a class="create_btn" onclick="checkLogin()">모임만들기</a> </nav>

	</div>
	</header>
</body>
</html>