<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h2>호스트 내역</h2><br>
			<%-- <font color="#add">현재 ${hNum}개의 모임의 호스트를 맡고있습니다.</font><br><br> --%>
			<table id="hostGx" style="width: 75%;" class="board_table">
				<tr class="boardth">
					<th>모임이름</th>
					<th>장소</th>
					<th>시간</th>
					<th>최소인원</th>
					<th>최대인원</th>
					<th>참여인원</th>
					<th>모집상태</th>
					<th style="padding-top: 8px;">모임삭제</td>
				</tr>
				<c:forEach  items='${list }' var='host' >
					<tr class="board_contents">
						<td><a style="color: gray;" href="groupinfo?gno=${host.gno }">${host.gtitle }</a></td>
						<td>${host.gloc }</td>
						<td>${host.gday }</td>
						<td>${host.gmin }</td>
						<td>${host.gmax }</td>
						<td>${host.gsum }</td>
						<td>${host.gstatus }</td>
						<td style="padding-top: 15px; width: 100px;">
						<input type="button" class="sbutton" value="삭제" onclick="deleteGx('${host.gno}')"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
</form>