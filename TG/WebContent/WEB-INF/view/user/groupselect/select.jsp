<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���Ӹ����</title>
<script type="text/javascript">
	function newGx() {
		location.href = "create";
	}
	
	function historyGx() {
		location.href = "selectGxList";
	}
</script>
</head>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div>
		<form style="text-align: center;">
			<button type="button" onclick="newGx()">���θ����</button>
			<button type="button" onclick="historyGx()">���� ������� ����</button>
		</form>
	</div>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>