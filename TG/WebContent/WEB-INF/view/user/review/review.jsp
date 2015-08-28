<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	
</script>
<title>�Բ��� ������� � ������̾�����</title>
</head>
<body>
	<form name="reviewFrm">
		<select id="sel" onchange="selectId()">
		<option>�Բ��� ģ����</option>
		<c:forEach items="${list }" var="gx">
			<option value="${gx.id }">${gx.id }</option>
		</c:forEach>
		</select>
		<br>
		<input type="hidden" name="gno" value="${param.gno }" >	
			<span>I D</span>
			<br>
			<input type="text" name="id"readonly="readonly">
			<br>
			<span>EVALUATE</span>
			<br>
			<input type="text" name="evaluate">
			<br>
			<select id="sel2">
				<option value="����">����</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			
		<input type="button" value="�Ϸ�" onclick="insertReview()">
	</form>
</body>
</html>