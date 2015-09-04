<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function selectId() {
		var id = document.getElementById('sel').value;
		document.reviewFrm.id.value = id;
	}
	
	function insertReview() {
		var id = document.reviewFrm.id.value;
		var eval = document.reviewFrm.evaluate.value;
		var grade = document.getElementById('sel2').value;
		
		$.ajax({url:'review', type:'POST', data: 'gno=${param.gno}&id='+id+'&evaluate='+eval+'&grade='+grade, dataType: 'text', 
			success: function () {
				alert('�������ּż� �����մϴ�');
				window.close();
			}
		});
	}
	
	$(document).ready(function () {
		if('${size}' == '0'){
			alert('�̹� ��� �򰡸� �Ϸ��ϼ˽��ϴ�');
			window.close();
		}
	});
	
</script>
<title>�Բ��� ������� � ������̾�����</title>
</head>
<body style="background-color: #FAFAFA;">
	<div style="background-color:#E6E6E6; width:400px; border: 1px solid lightgray; padding: 10px 5px 10px 27px;">
	 ��
	</div>
	<div style=" border: 1px solid lightgray; border-top: 0px; background-color: white; font-size: 14px;">
		
		<form name="reviewFrm">
		<div style="padding:20px 0px 5px 20px;">
			<select id="sel" onchange="selectId()">
				<option>�Բ��� ģ����</option>
				<c:forEach items="${list }" var="gx">
				<option value="${gx.id }">${gx.id }</option>
				</c:forEach>
			</select>
			<br>
			<input type="hidden" name="gno" value="${param.gno }" >	
			<h4 style="margin:5px 0;">ID</h4>
			<input type="text" name="id"readonly="readonly"><br>
			<h4 style="margin:5px 0;">���� ��</h4>
			<input type="text" name="evaluate">
			</div>
		<div style="padding:5px 0px 15px 20px;">
			<select id="sel2">
				<option value="����">����</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</div>
	</form>
	</div>
		<div style="padding:5px 0px 5px 180px;">	
		<input type="button" class="sbutton" value="�Ϸ�" onclick="insertReview()">
		</div>
</body>
</html>