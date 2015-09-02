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
<title>TG FAQ</title>
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<link rel="stylesheet" type="text/css" media="all" href="css/responsiveMy.css">
</head>
<script type="text/javascript">
$(document).ready(function(){
    $("#flip1").click(function(){
        $("#panel1").toggle();
    });
    $("#flip2").click(function(){
        $("#panel2").toggle();
    });
    $("#flip3").click(function(){
        $("#panel3").toggle();
    });
    $("#flip4").click(function(){
        $("#panel4").toggle();
    });
});
</script>
<style> 
.panel, .flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
    width: 70%;
    margin-left: 30%;
}

.panel {
    padding: 50px;
    display: none;
    text-align: left;
}
</style>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div style="position: relative;"><tiles:insertAttribute name="faqside"/></div> 

<form id="faqSheet"> 

	<div id="flip1" class="flip">ToGathering은 무엇을 하는 사이트인가요?</div>
	<div id="panel1" class="panel">
	 저희 ToGathering 은 Social Exercising O2O(Online to Offline) Service를 제공합니다.<br>
	 따라서 공통의 관심사를 가진 사람들과 자유롭게 모임을 생성, 참가 할 수 있습니다. <br>
	 대표적으로 모임 참여와 모임 생성 및 모임 관련 편의를 위한 다양한 기능을 제공하고 있습니다. <br>
	</div>

	<br>
	<div id="flip2" class="flip">모임은 어떻게 참가하는 건가요?</div>
	<div id="panel2" class="panel">
	<b>※모임에 참가하시기 위해서는 일정 개인정보를 입력하셔야합니다!</b><br>
	모임의 신뢰성 강화 및 모임에서 발생할 수 있는 문제를 미연에 방지하기 위함이니 양해 부탁드립니다.<br><br>
	 1. 마음에 드시는 모임을 검색합니다. <br>
	 2. 모임의 상세 내용을 꼼꼼히 확인합니다.(위치, 시간) <br>
	 3. 모임 참가를 누릅니다. <br>
	 4. 모임을 즐기시면 됩니다 :-) ! <br>
	 </div>
	<br>
	
	<div id="flip3" class="flip">모임은 어떻게 만드는 건가요?</div>
	<div id="panel3" class="panel">
	<b>※모임을 생성하시기 위해서는 일정 개인정보를 입력하셔야합니다!</b><br>
	모임의 신뢰성 강화 및 모임에서 발생할 수 있는 문제를 미연에 방지하기 위함이니 양해 부탁드립니다.<br><br>
	 1. 모임 만드는 방식을 선택합니다.. <br>
	 2. 모임의 상세 내용을 입력합니다.(자세히 입력하실 수록 원활한 모임진행에 도움이 됩니다.) <br>
	 3. 모임 생성 버튼을 누릅니다. <br>
	 4. 모임 생성이 완료되었으니 모임인원이 충족되길 기다립니다.<br>
	 5. 만약 최소인원이 기간 내에 모이면 모임이 진행되고, <br>
	  &nbsp 기간 내에 최소인원이 모이지 않으면 모임은 자동으로 '종료'되고 해당 내용에 대한 쪽지가 발송됩니다.<br>
	</div>
	<br>
	
	<div id="flip4" class="flip">모임은 안전한가요?</div>
	<div id="panel4" class="panel">
	<b>ToGathering의 모임은 신뢰를 바탕으로 합니다.</b> <br><br>
	 좀 더 안전성 및 신뢰성 보장을 위해 불가피 하게 일부 개인정보를 수집 및 제공하고 있습니다.<br><br>
	 
	 1. 모임 참여, 생성을 위해서는 최소의 연락처 공개<br>
	 2. SNS를 통해 개인의 정보 확인 <br>
	 3. 모임 후 상호 평가 및 평점 부여 및 공개<br>
	 <br>
	 기타 홈페이지의 모임을 보시는 중, 혹은 모임참여 후  문제가 발생하셨다면,<br>
	  하단의 신고하기 버튼을 통해 즉각 신고 부탁드립니다.
	</div>
</form>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>