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
	function loginOk() {// ����κ�, �α���&ȸ������ -> ����� �г������� ����
		var nick = '${nick}';
		var ul = document.getElementById("ul");
		if(nick!=''){
			var msg = '<li><a href="#">'+nick+'��</a>';
				  msg += '<ul><li><a href="#" onclick="logOut()">���� ���</a></li>';
				  msg += '<li><a href="#" onclick="��()">���ؿ� ����Ʈ</a></ul></li>';
				  msg += '<li><a href="#" onclick="��()">ģ�� ����Ʈ</a></ul></li>';
				  msg += '<li><a href="#" onclick="mypage()">������ ����</a></ul></li>';
				  msg += '<li><a href="#" onclick="logOut()">�α׾ƿ�</a></li>';
				  msg += '<li><a href="#">�޼���</a></li>';
				  msg += '<li><a href="userlist">���ã��</a></li>';
			ul.innerHTML = msg;
		}else{
			var msg = '<li><a href="join">ȸ������</a></li>';
			msg +='<li><a href="login">�α���</a></li>';
			msg +='<li><a href="groupsearch">����ã��</a></li>';
		
			ul.innerHTML= msg;
		}
	}
	
	function checkLogin() {
		if('${id}' == ''){
			alert('�α����� ���� ���ּ���');
			location.href = 'login';
		}else{
			location.href = 'selectGx';
		}
	}
	
	function logOut(){
		alert("�α׾ƿ� �մϴ�");
		
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

		<a class="create_btn" onclick="checkLogin()">���Ӹ����</a> </nav>

	</div>
	</header>
</body>
</html>