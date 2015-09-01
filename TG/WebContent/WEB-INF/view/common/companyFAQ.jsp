<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="js/jquery.js"></script>

<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>show ToGathering</title>
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<link rel="stylesheet" type="text/css" media="all" href="css/responsiveMy.css">
</head>
<script type="text/javascript">
	$(document).ready(function(){
			$('#introduceCompany').hide();
			$('#introduceToGathering').hide();
			$('#howToUseTG').hide();
		$('#introCompany').click(function(){
			$('#introduceCompany').toggle();
		})

		$('#introTG').click(function(){
			$('#introduceToGathering').toggle();
		})

		$('#howToUse').click(function(){
			$('#howToUseTG').toggle();
		})
	});
</script>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	
	<p id='introCompany' >ȸ�� �Ұ�</p>
	<p id="introduceCompany">
	TG company �� ��� �����ϴ� ���� 5���� �Ǳ� �����Ͽ� ���� Platform Service �Դϴ�.<br>
	������ �����ϴ��� ����� ����� TG�� ����� ������ֽñ� �ٶ��ϴ�.	
	</p>
	<hr>
	<p id='introTG'>ToGathering �Ұ�</p>
	<p id="introduceToGathering">
	 ToGathering �� Social Exercising Platform Service�� ������ �帳�ϴ�. 
	 <br>
	 ToGathering�� together�� gathering�� �ռ���� ���Բ� �ϴ� ������ �ǹ��մϴ�.
	 <br>
	 ����� �ܼ��� O2O service�� �ƴ� Interest & Culture Platform Service �� �����մϴ�.	  
	</p>
	<hr>
	
	<p id='howToUse'>TG�̿���</p>
	<p id= 'howToUseTG'>
		1. ȸ�� ���� : ������ ������ ȸ�������� �����մϴ�. 
		<br>
		��Ȱ�� ���� �̿��� ���ؼ��� ������ ������ �ʿ��մϴ�.	 
		<br>
		2. ���� ���� : ���� ������ Ȯ�� �� ���� ������ �Ͻ� �� �ֽ��ϴ�.
		<br>
		ȸ�������� �ϸ� ���� ������ ������ �忡�� ���޵Ǵ� �����Ͻñ� �ٶ��ϴ�.
		<br>
		���� ���� ��û�� �������� �����ϸ� ���� �̿뿡 ������ �߻��� �� �ֽ��ϴ�. 		
		<br>
		3. ���� ���� : ���, �ð��� ���Ͽ� � ������ ������ �� �ֽ��ϴ�.
		<br>
		������ ������ 2���� �̰�, ������ ���� �������� ������ �ٸ��� �ο��˴ϴ�.
		<br>
		���� ���� ������ �����Ͻø� ���� �̿뿡 ������ �߻��� �� �ֽ��ϴ�.
		<br>
		4. �Խ��� �̿� : �����ϴ� ����, �Ű�, ���ǵ��� ������ �Խ��ǿ� ������ �°� �ۼ� ��Ź�帳�ϴ�.
		<br>
		���� �Ű� �� ������� �ۼ��Ͻ� ��� ���� �̿뿡 ������ �߻��� �� �ֽ��ϴ�.
		<br>
		
	</p>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>