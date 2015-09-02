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
<style type="text/css">
.subject{
	background-color: lightblue;
	margin-left: 20px;
	width: 100%;
	vertical-align: middle;
	text-align: center;
	font-size: 16px;
	padding: 10px;

}
.contents{
	margin-left: 30px;
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
	
	<p id='introCompany' class="subject" >회사 소개</p>
	<p id="introduceCompany" class='contents'>
	TG company 는 운동을 좋아하는 젊은 5인이 의기 투합하여 만든 Platform Service 입니다.<br>
	아직은 부족하더라도 세계로 뻗어가는 TG의 모습을 기대해주시기 바랍니다.	
	</p>
	<hr>
	<p id='introTG' class="subject">ToGathering 소개</p>
	<p id="introduceToGathering" class='contents'>
	 ToGathering 은 Social Exercising Platform Service를 제공해 드립니다. 
	 <br>
	 ToGathering은 together와 gathering의 합성어로 다함께 하는 모임을 의미합니다.
	 <br>
	 저희는 단순한 O2O service가 아닌 Interest & Culture Platform Service 를 지향합니다.	  
	</p>
	
	
	
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>