<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<title>���� �ٽ� �����</title>
<script type="text/javascript">
	function choiceGx(gno) {
		location.href = "createGx?gno="+gno;
	}
</script>
</head>
<body>
<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
<div class="board_div">
	<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
			<h4>�ٽ� ������ ����</h4><br>
			<table id="historyGx" style="width: 730px;"class="board_table">
				<tr class="boardth">
					<th style="width: 220px;">�����̸�</th>
					<th  style="width: 260px;">���</th>
					<th>��¥</th>
					<th>����</th>
				</tr>
				<c:forEach  items='${list }' var='history' >
				<tr class="board_contents" >
					<td style="padding-top: 15px;"><a  style="color: gray;" href="groupinfo?gno=${history.gno }">${history.gtitle }</a></td>
					<td>${history.gloc }</td>
					<td>${history.gday }</td>
					<td><input type="button" class="sbutton" value="���Ӽ���" onclick="choiceGx('${history.gno }')"> </td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</div>
	<div style="position: relative; top: 50px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>