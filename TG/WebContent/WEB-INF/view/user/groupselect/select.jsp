<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모임만들기</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function newGx() {
		location.href = "create";
	}
	
	function historyGx() {
		location.href = "selectGxList";
	}
	
	$(document).ready(function () {
		if(!'${gender}'){
			alert('마이페이지에서 성별을 입력해주세요');
			location.href="mypage";
		}
		if(!'${tel}'){
			alert('마이페이지에서 전화번호를 입력해주세요');
			location.href="mypage";
		}
	});
</script>
</head>
<body style="background-color: #F2F2F2;">
	<div style="z-index: 2; background-color: white;"><tiles:insertAttribute name="header"/></div>
	<div>
		<form style="text-align: center;">
		<div style="float: left; width:300px; height:300px; margin-left: 20%; margin-top: 50px;">
			 새로운 모임을 만들어보세요~!!<br><br> 
			<button type="button" onclick="newGx()">새로만들기</button>
		</div>
		<div style="float:right;  width:300px; height:300px; margin-right: 20%; margin-top: 50px;">	
			 이전에 만들었던 모임과 비슷한 내용으로 <br><br>
			간편하게 만들어보세요~!!<br><br> 
			<button type="button" onclick="historyGx()">내가 만들었던 모임</button>
		</div>
		</form>
	</div>
	<div style="position:relative; top: 50px;float:left; width:100%;"><tiles:insertAttribute name="footer"/></div>
</body>
</html>