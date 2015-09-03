<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" type="text/css" href="css/headfoot.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/*  Hamburger Menu & Icon  */
	$('.hamburger').click(function(){
		/* $("nav").fadeToggle(); */
		$(this).toggleClass('opened');
		$('header nav').toggleClass('active');
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<header>
	<div class="wrapper4">
		<a href="main"><img src="img/logo2.png" class="logo" alt="home" title="backToHome" /></a>
		<a href="#" class="hamburger"></a>
		<nav>
		<ul id="ul">
			<li><a href="adminMemberList">회원관리</a></li>
			<li><a href="adminGroupList">모임관리</a></li>
<%-- 			<li><a href="adminReportList">신고관리</a></li> --%>
			<li><a href="adminQna">게시판관리</a></li>
		</ul>
		</nav>
	</div>
	</header>

</body>
</html>