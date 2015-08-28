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
		var evaluate = document.reviewFrm.evaluate.value;
		
		$.ajax({url:'review', type:'POST', data: 'gno=${param.gno}&id='+id+'&evaluate='+evaluate, dataType: 'text', 
			success: function () {
				alert("����");
			}
		});
	}
	
</script>
<title>�Բ��� ������� � ������̾�����</title>
</head>
<body>
	<select id="sel" onchange="selectId()">
		<option value="�Բ��� ģ����">�Բ��� ģ����</option>
		<c:forEach items="${list }" var="gx">
			<option value="${gx.id }">${gx.id }</option>
		</c:forEach>
	</select>
	<br>
	<br>
	<form name="reviewFrm">
		<span>�̸�</span>
		<br>
		<input type="hidden" name="gno" value="${param.gno }" >
		<input type="text" name="id" id="id" readonly="readonly">
		<br>
		<span>EVALUATE</span>
		<br>
		<input type="text" name="evaluate">
		<br>
		<input type="button" value="�Ϸ�" onclick="insertReview()">
	</form>
</body>
</html>