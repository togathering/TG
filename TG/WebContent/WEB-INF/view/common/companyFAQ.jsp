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
	
	<p id='introCompany' >회사 소개</p>
	<p id="introduceCompany">
	TG company 는 운동을 좋아하는 젊은 5인이 의기 투합하여 만든 Platform Service 입니다.<br>
	아직은 부족하더라도 세계로 뻗어가는 TG의 모습을 기대해주시기 바랍니다.	
	</p>
	<hr>
	<p id='introTG'>ToGathering 소개</p>
	<p id="introduceToGathering">
	 ToGathering 은 Social Exercising Platform Service를 제공해 드립니다. 
	 <br>
	 ToGathering은 together와 gathering의 합성어로 다함께 하는 모임을 의미합니다.
	 <br>
	 저희는 단순한 O2O service가 아닌 Interest & Culture Platform Service 를 지향합니다.	  
	</p>
	<hr>
	
	<p id='howToUse'>TG이용방법</p>
	<p id= 'howToUseTG'>
		1. 회원 가입 : 간단한 절차로 회원가입이 가능합니다. 
		<br>
		원활한 서비스 이용을 위해서는 상세정보 기입이 필요합니다.	 
		<br>
		2. 모임 참여 : 모임 정보를 확인 후 모임 참여를 하실 수 있습니다.
		<br>
		회원참여를 하면 개인 정보가 모임의 장에게 전달되니 유의하시기 바랍니다.
		<br>
		모임 참가 신청후 무단으로 불참하면 서비스 이용에 제한이 발생할 수 있습니다. 		
		<br>
		3. 모임 생성 : 장소, 시간을 정하여 운동 모임을 생성할 수 있습니다.
		<br>
		모임의 종류는 2가지 이고, 종류에 따라 모임장의 권한이 다르게 부여됩니다.
		<br>
		모임 당일 모임을 삭제하시면 서비스 이용에 제한이 발생할 수 있습니다.
		<br>
		4. 게시판 이용 : 자주하는 질문, 신고, 문의등은 각각의 게시판에 목적에 맞게 작성 부탁드립니다.
		<br>
		허위 신고 및 도배글을 작성하실 경우 서비스 이용에 제한이 발생할 수 있습니다.
		<br>
		
	</p>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>