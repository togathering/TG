<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="css/login.css">

	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script src="js/login.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ToGathering Administrator</title>
</head>
<body>
<div><tiles:insertAttribute name="header"/></div>
<div  style="position: relative; top: 220px; margin-top: 110px; z-index: 1;">
	<div class="wrapper">
		<div class="container">		
			<h2 style="color: white;">어서오세요</h2>
			<h3>Admin 계정 로그인</h3>
		<form class="form" method="post"  name="frm" action="adminLoginSuccess">			
			<input  type="text" width="15"  placeholder="ID 입력"  name = "id" style="font-size: medium;">
			<input  type="password" width="15" placeholder="비밀번호 입력" name="pass">
			<button type="submit" name="adminLogin_bt">Log-In</button>
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
<div><tiles:insertAttribute name="footer"/></div>
</body>	
</html>