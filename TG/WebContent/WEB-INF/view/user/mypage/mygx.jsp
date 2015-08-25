<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/list.css">
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css">
<title>Today, ToGathering, Together</title>
<script type="text/javascript">
	function cancelGx(gno) {
		location.href = 'gxcancel?gno='+gno;
	}
</script>

</head>
<body>
		<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<br><br>
	<div><tiles:insertAttribute name="myPageHeader"/></div>
	<section class="listings">
		<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h1>참가 내역</h1><br><br>
		<font color="#add">현재 ${gNum } 개의 모임에 참여중입니다</font><br><br>
			<table id="joinGx" style="width: 80%; margin: 20px auto;">
				<tr style="height: 40px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
					<td>모임이름</td>
					<td>개최자</td>
					<td>장소</td>
					<td>시간</td>
					<td>최소인원</td>
					<td>최대인원</td>
					<td>참여인원</td>
					<td>모집상태</td>
					<td style="width: 100px; padding-top: 8px;"><font style="text-align: center;">참여취소</font></td>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr style="height: 80px; text-align: center; border: 1px; border: 1px solid lightgray;" >
					<td><a style="color: gray;" href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td>${gx.gmin }</td>
					<td>${gx.gmax }</td>
					<td>${gx.gsum }</td>
					<td>${gx.gstatus }</td>
					<td style="padding-top: 15px;">
					<input type="button" id="cancel" class="button" value="모임취소" onclick="cancelGx('${gx.gno}')">
							</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>
		</section> <!--  end listing section  -->
		<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>