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
		if('${historyGx}'==0){
			alert("������ ���������� �����ϴ�\n���ο� ������ ��������");	
		}else{
			location.href = "selectGxList";
		}
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
<style type="text/css">
.imgbutton hover{
	background-color: rgba(222,222,222,0.5);
}

</style>
</head>
<body style="background-color: #F2F2F2;">
	<div style="z-index: 2; background-color: white;"><tiles:insertAttribute name="header"/></div>
	<div>
		<form style="text-align: center;">
		<div style="float: left; width:300px; height:300px; margin-left: 23%; margin-top: 50px; background-color: rgba(222,222,222,0.6);z-index: 0;">
		<div style="border: 1px solid lightgray; background-color: #D8D8D8">
			<br><br>
			 ���ο� ������ ��������~!!<br><br> <br>
			 </div>
			<button style="border:solid 0px #FAFAFA; background-color:#F2F2F2; padding: 0px; cursor: pointer;" type="button" onclick="newGx()"><img src='img/slow.jpg' style="width: 100%; height: 100%; "></button>
		</div>
		<div style="float:right;  width:300px; height:300px; margin-right: 23%; margin-top: 50px;">	
			 <div style="border: 1px solid lightgray; background-color: #D8D8D8; padding: 15px 10px; ">
			 ������ ������� ���Ӱ� ����� �������� <br><br>
			�����ϰ� ��������~!!<br>
			</div>
			<div>
			<button style=" cursor: pointer; border:solid 0px #FAFAFA; background-color:#F2F2F2; padding: 0px;" type="button" onclick="historyGx()"><img src='img/fast.jpg' style="width: 100%; height: 100%; "></button>
			</div>
		</div>
		</form>
	</div>
	<div style="position:relative; top: 110px;float:left; width:100%;"><tiles:insertAttribute name="footer"/></div>
</body>
</html>