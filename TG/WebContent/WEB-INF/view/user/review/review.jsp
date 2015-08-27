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
	
</script>
<title>함께한 사람들은 어떤 사람들이었나요</title>
</head>
<body>
	<select id="sel" onchange="selectId()">
	<option value="함께한 친구들">함께한 친구들</option>
	<option value="${host }">${host }</option>	
	<c:forEach items="${list }" var="gx">
		<option value="${gx.pid }">${gx.pid }</option>
	</c:forEach>
	</select>
	<br>
	<br>
	<form name="reviewFrm" action="review">
		<span>이름</span>
		<br>
		<input type="hidden" name="gno" value="${param.gno }" >
		<input type="text" name="id" id="id" readonly="readonly">
		<br>
		<span>COMMENT</span>
		<br>
		<input type="text" name="comment">
		<br>
		<input type="submit" value="완료">
	</form>
</body>
</html>