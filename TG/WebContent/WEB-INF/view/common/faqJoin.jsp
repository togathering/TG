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
.panel {
    padding: 5px;
    text-align: left;
    background-color: #F2F2F2;
    /* border: solid 1px #c3c3c3; */
    width: 700px;
    margin: 0px 0px 0px 400px;
}
 .flip{
	padding: 5px;
    text-align: center;
    background-color: #F78181;
    /* border: solid 1px #c3c3c3; */
    width: 700px;
    margin: 0px 0px 0px 400px;
 	cursor: pointer;
 }

.panel {
    display: none;
    text-align: left;
}
</style>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div style="position: relative;"><tiles:insertAttribute name="faqside"/></div> 

<form id="faqSheet"> 
	<div style="">
	<div id="flip1" class="flip">어떤 모임에 참여하는 게 좋을까요?</div>
	<div id="panel1" class="panel">
	모임이 너무 많은데 어떤 모임에 참석해야 할지 모르시겠다구요?
	ToGathering 메인페이지에 올라온 모임으로 시작해보는건 어떠세요? <br>
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
	
	<div id="flip3" class="flip">참가자가 지켜야 할 기본적인 매너는 무엇인가요?</div>
	<div id="panel3" class="panel">
	<b>지각은 안 돼요.</b><br>
	시간은 누구에게나 소중합니다. 어쩔 수 없이 모임에 늦을 경우, 사전에 호스트에게 예상 도착시각을 꼭 알려주세요.<br>
	부득이하게 참석하지 못할 경우, 기다리고 있을 호스트와 다른 참가자들을 위해 미리 알려주세요.<br><br>

함께 얘기해요.

서로 하루의 소중한 시간을 내어 모임에 참석합니다. 함께 식사하며 소통을 하기 위해 만남만큼, 다양한 대화가 오갈 수 있게 귀를 열어주세요.

	<b>불순한 목적은 안 돼요.</b>
	진정성있는 만남과 교류가 아닌, 오히려 이를 빙자하여 참가자들의 동의 없이 일방적인 상업적 목적의 홍보 및 판매하는 활동을 금지합니다.<br>
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
	</div>
</form>
	<div style="position: relative; top: 250px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>