<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>



<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="css/join.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/join.js"></script>
	
	<script type="text/javascript">
	
	
	function confirm2(){
		
		var email = document.frm.email.value;
		
		if (email == null || email == ""){
			alert("이메일을 입력해주세요.");		
			return;
		} else {
			alert("가져온 이메일 값은.." +email);
		}
		
		location.replace('confirmEmail?email='+email);
	}
	
	$(document).ready(function(){
		if('${result}' == 'confirmSuccess'){
			alert("이메일로 회원가입을 위한 핫키를 전송하였습니다.")
		}
	})
	
</script>

</head>


<body>

	<!-- 헤더 -->	
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div style="position: relative; top: 120px; margin-top: 100px; z-index: 1;">
		<div class="wrapper">
			<div class="container" style="padding-top: 40px">
	
				<h1 style="color: white;">이메일 인증</h1>
	
				<form class="form" name="frm" method="post" action="'confirmEmail">
					<input type="text" placeholder="email" name="email">  
					<input type="button" name="emailConfirm" value="이메일 인증" 
							id="emailConfirm" onclick="confirm2()"> 
					<input type="text" placeholder="key를 입력해주세요." name="joinKey">  
					<button type="button" name="confirm_bt" onclick="confirmEmail()">회원 가입하러가기</button>
				</form>
			</div>
	
			<ul class="bg-bubbles">
				<li/>
				<li/>
				<li/>
				<li/>
				<li/>
				<li/>
				<li/>
				<li/>
				<li/>
				<li/>
			</ul>
		</div>
	</div>
	
	<!-- 푸터 삽입 -->
	<div style="position: relative; top: 300px">
			<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>
