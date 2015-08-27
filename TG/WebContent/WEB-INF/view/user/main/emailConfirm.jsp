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
			alert("�̸����� �Է����ּ���.");		
			return;
		} else {
			alert("������ �̸��� ����.." +email);
		}
		
		location.replace('confirmEmail?email='+email);
	}
	
	$(document).ready(function(){
		if('${result}' == 'confirmSuccess'){
			alert("�̸��Ϸ� ȸ�������� ���� ��Ű�� �����Ͽ����ϴ�.")
		}
	})
	
</script>

</head>


<body>

	<!-- ��� -->	
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div style="position: relative; top: 120px; margin-top: 100px; z-index: 1;">
		<div class="wrapper">
			<div class="container" style="padding-top: 40px">
	
				<h1 style="color: white;">�̸��� ����</h1>
	
				<form class="form" name="frm" method="post" action="'confirmEmail">
					<input type="text" placeholder="email" name="email">  
					<input type="button" name="emailConfirm" value="�̸��� ����" 
							id="emailConfirm" onclick="confirm2()"> 
					<input type="text" placeholder="key�� �Է����ּ���." name="joinKey">  
					<button type="button" name="confirm_bt" onclick="confirmEmail()">ȸ�� �����Ϸ�����</button>
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
	
	<!-- Ǫ�� ���� -->
	<div style="position: relative; top: 300px">
			<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>
