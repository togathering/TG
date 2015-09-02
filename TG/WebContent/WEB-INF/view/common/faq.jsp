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

	<div id="flip1" class="flip">ToGathering�� ������ �ϴ� ����Ʈ�ΰ���?</div>
	<div id="panel1" class="panel">
	 ���� ToGathering �� Social Exercising O2O(Online to Offline) Service�� �����մϴ�.<br>
	 ���� ������ ���ɻ縦 ���� ������ �����Ӱ� ������ ����, ���� �� �� �ֽ��ϴ�. <br>
	 ��ǥ������ ���� ������ ���� ���� �� ���� ���� ���Ǹ� ���� �پ��� ����� �����ϰ� �ֽ��ϴ�. <br>
	</div>

	<br>
	<div id="flip2" class="flip">������ ��� �����ϴ� �ǰ���?</div>
	<div id="panel2" class="panel">
	<b>�ظ��ӿ� �����Ͻñ� ���ؼ��� ���� ���������� �Է��ϼž��մϴ�!</b><br>
	������ �ŷڼ� ��ȭ �� ���ӿ��� �߻��� �� �ִ� ������ �̿��� �����ϱ� �����̴� ���� ��Ź�帳�ϴ�.<br><br>
	 1. ������ ��ô� ������ �˻��մϴ�. <br>
	 2. ������ �� ������ �Ĳ��� Ȯ���մϴ�.(��ġ, �ð�) <br>
	 3. ���� ������ �����ϴ�. <br>
	 4. ������ ���ø� �˴ϴ� :-) ! <br>
	 </div>
	<br>
	
	<div id="flip3" class="flip">������ ��� ����� �ǰ���?</div>
	<div id="panel3" class="panel">
	<b>�ظ����� �����Ͻñ� ���ؼ��� ���� ���������� �Է��ϼž��մϴ�!</b><br>
	������ �ŷڼ� ��ȭ �� ���ӿ��� �߻��� �� �ִ� ������ �̿��� �����ϱ� �����̴� ���� ��Ź�帳�ϴ�.<br><br>
	 1. ���� ����� ����� �����մϴ�.. <br>
	 2. ������ �� ������ �Է��մϴ�.(�ڼ��� �Է��Ͻ� ���� ��Ȱ�� �������࿡ ������ �˴ϴ�.) <br>
	 3. ���� ���� ��ư�� �����ϴ�. <br>
	 4. ���� ������ �Ϸ�Ǿ����� �����ο��� �����Ǳ� ��ٸ��ϴ�.<br>
	 5. ���� �ּ��ο��� �Ⱓ ���� ���̸� ������ ����ǰ�, <br>
	  &nbsp �Ⱓ ���� �ּ��ο��� ������ ������ ������ �ڵ����� '����'�ǰ� �ش� ���뿡 ���� ������ �߼۵˴ϴ�.<br>
	</div>
	<br>
	
	<div id="flip4" class="flip">������ �����Ѱ���?</div>
	<div id="panel4" class="panel">
	<b>ToGathering�� ������ �ŷڸ� �������� �մϴ�.</b> <br><br>
	 �� �� ������ �� �ŷڼ� ������ ���� �Ұ��� �ϰ� �Ϻ� ���������� ���� �� �����ϰ� �ֽ��ϴ�.<br><br>
	 
	 1. ���� ����, ������ ���ؼ��� �ּ��� ����ó ����<br>
	 2. SNS�� ���� ������ ���� Ȯ�� <br>
	 3. ���� �� ��ȣ �� �� ���� �ο� �� ����<br>
	 <br>
	 ��Ÿ Ȩ�������� ������ ���ô� ��, Ȥ�� �������� ��  ������ �߻��ϼ̴ٸ�,<br>
	  �ϴ��� �Ű��ϱ� ��ư�� ���� �ﰢ �Ű� ��Ź�帳�ϴ�.
	</div>
</form>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>