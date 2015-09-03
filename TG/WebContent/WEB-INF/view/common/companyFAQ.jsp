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
<!-- <link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<link rel="stylesheet" type="text/css" media="all" href="css/responsiveMy.css"> -->
<style type="text/css">
.subject{
	background-color: #F78181;
	margin: 10px auto;
	width: 700px;
	vertical-align: middle;
	text-align: center;
	font-size: 15px;
	padding: 10px;
	cursor: pointer;
}
.contents{
	background-color: #F2F2F2;
	margin: 10px auto;
	width:700px;
	font-size: 13px;
	padding: 10px;
	line-height: 30px;
}

</style>
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
	<div>
	<p id='introCompany' class="subject" >ȸ�� �Ұ�</p>
	<p id="introduceCompany" class='contents'>
	TG company �� ��� �����ϴ� ���� 5���� �Ǳ� �����Ͽ� ���� Platform Service �Դϴ�.<br>
	������ �����ϴ��� ����� ����� TG�� ����� ������ֽñ� �ٶ��ϴ�.	
	</p>
	</div>
	<br>
	<div>
	<p id='introTG' class="subject">ToGathering �Ұ�</p>
	<p id="introduceToGathering" class='contents'>
	 ToGathering �� Social Exercising Platform Service�� ������ �帳�ϴ�. 
	 <br>
	 ToGathering�� together�� gathering�� �ռ���� ���Բ� �ϴ� ������ �ǹ��մϴ�.
	 <br>
	 ����� �ܼ��� O2O service�� �ƴ� Interest & Culture Platform Service �� �����մϴ�.	  
	</p>
	</div>
	
	<div style="position: relative; top: 150px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>