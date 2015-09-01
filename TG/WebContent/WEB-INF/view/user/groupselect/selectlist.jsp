<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
		<div class="wrapper"><h2>다시 개최할 모임</h2><br>
			<table id="historyGx" style="width: 75%;"class="board_table">
				<tr class="boardth">
					<th style="width: 100px; padding-top: 8px;">모임이름</th>
					<th>장소</th>
					<th>날짜</th>
					<th>선택</th>
				</tr>
				<c:forEach  items='${list }' var='history' >
				<tr class="board_contents" >
					<td><a  style="color: gray;" href="groupinfo?gno=${history.gno }">${history.gtitle }</a></td>
					<td>${history.gloc }</td>
					<td>${history.gday }</td>
					<td><input type="button" value="모임선택" onclick="choiceGx('${history.gno }')"> </td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</div>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>