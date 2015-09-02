<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
		<br>
		<div style="float:left; margin-left: 80px;">
		<h4 style="text-align: left;">종료된 모임(호스트)</h4>
		<br>
			<%-- <font color="#add">현재 ${hNum}개의 모임의 호스트를 맡고있습니다.</font><br><br> --%>
			</div>
			<table id="hostGx" style="width: 70%;" class="board_table">
				<tr class="boardth">
					<th style="width: 250px">모임이름</th>
					<th style="width: 270px">장소</th>
					<th style="width: 170px">시간</th>
					<th style="width: 70px">참여인원</th>
					<th style="padding-top: 8px;">평가</td>
				</tr>
				<c:forEach  items='${list }' var='host' >
				<tr class="board_contents">
					<td><a style="color: #58ACFA;" href="groupinfo?gno=${host.gno }">${host.gtitle }</a></td>
					<td>${host.gloc }</td>
					<td>${host.gday }</td>
					<td>${host.gsum }</td>
					<td style="padding-top: 5px; width: 100px;">
					<input type="button" class="sbutton" value="평가" onclick="review('${host.gno}')"></td>
				</tr>
				</c:forEach>
			</table>
		</div>
</form>