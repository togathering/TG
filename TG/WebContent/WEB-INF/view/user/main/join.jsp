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
				alert('�г����� �Է����ּ���');
				document.frm.nick.focus();
				return;
			}
			if(id.length==0){
				alert('���̵� �Է����ּ���');
				document.frm.id.focus();
				return;
			}else if(!email.test(id)){
				alert("�̸��������� �߸��ƽ��ϴ�");
				return;
			}
			if(pass.length==0){
				alert('��й�ȣ�� �Է����ּ���');
				document.frm.pass.focus();
				return;
			}
			document.frm.submit();
	}
	
	$(document).ready(function() {
		if('${join}'=='fail'){
			alert("�̹� ������� ���̵��Դϴ�");
			location.href = 'join';
		
		} else if('${join}'=='keyFail'){
			alert("�߸��� ����Ű �Դϴ�.");
			location.href = 'join';
		
		} else if('${join}'=='success'){
			alert("������ �����մϴ�");
			location.href = 'login';
		
		} else if ('${result}'=='dontCreateRandom'){
			alert("����Ű ������ �����Ͽ����ϴ�. ��� �� �ٽ� �õ����ּ���.");
			location.href = 'join';
		}
	});
	
</script>
<head>
	<meta charset="UTF-8">
	<title>ToGathering : ȸ������</title>
	<link rel="stylesheet" href="css/join.css">
	<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/join.js"></script>
</head>
<body>
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	<div style="position: relative; top: 120px; margin-top: 90px; z-index: 1;">
		<div class="wrapper">
			<div class="container" style="padding-top: 40px">

			<h1 style="color: white;">�����ϼ��� (1�ܰ�)</h1>
			
			<form class="form" name="frm" method="post" action="emailConfirm">
				<input type="text" placeholder="Nickname" name="nick"> 
				<input type="text" placeholder="E-mail" name="id"> 
				<input type="password" placeholder="Password" name="pass">
				<button type="button" name="join_bt" onclick="checkValue()">E-mail Confirm</button>
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
