<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���Ӹ����</title>
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
			alert('�������������� ������ �Է����ּ���');
			location.href="mypage";
		}
		if(!'${tel}'){
			alert('�������������� ��ȭ��ȣ�� �Է����ּ���');
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
			 ���ο� ������ ��������~!!<br><br> 
			<button type="button" onclick="newGx()">���θ����</button>
		</div>
		<div style="float:right;  width:300px; height:300px; margin-right: 20%; margin-top: 50px;">	
			 ������ ������� ���Ӱ� ����� �������� <br><br>
			�����ϰ� ��������~!!<br><br> 
			<button type="button" onclick="historyGx()">���� ������� ����</button>
		</div>
		</form>
	</div>
	<div style="position:relative; top: 50px;float:left; width:100%;"><tiles:insertAttribute name="footer"/></div>
</body>
</html>