<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html >
<script type="text/javascript" src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		if('${login}'=='fail'){
			alert('�α��ν���');
			location.href = 'login';
		}
	});
	
	function votmdnjem() {
		window.open('sendPass','',
					'width=400, height=450, screenX=400, screenY=130, resizable=no');
	}
	
</script>


<head>
	<meta charset="UTF-8">
	<title>ToGathering : �α���</title>

    <link rel="stylesheet" href="css/login.css">

	
	
</head>

<body>
	<div style="z-index: 2;">
	<tiles:insertAttribute name="header"/>
	</div>
	<div  style="position: relative; top: 120px; margin-top: 100px; z-index: 1;">
		<div class="wrapper">
			<div class="container">
					
				<h1 style="color: white;">�������</h1>
					
				<form class="form" name="frm" method="post" action="loginpass">
					<input type="text" placeholder="E-mail" name="id">
					<input type="password" placeholder="Password" name="pass">
					<button type="submit" name="login_bt">Login</button>
					<input type="button" name="getPass" onclick="votmdnjem()" value="���ã��">
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
	<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>
