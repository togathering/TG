<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모임만들기</title>
<script type="text/javascript">
	function newGx() {
		location.href = "create";
	}
	
	function historyGx() {
		location.href = "selectGxList";
	}
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