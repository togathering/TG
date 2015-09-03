<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
		<br>
		<div style="float:left; margin-left: 80px;">
		<h4 style="text-align: left;">호스트 내역 ▷ 예정된 모임</h4>
			<br>
			<font color="#F78181">현재 ${hNum}개 모임의 호스트를 맡고있습니다.</font>	
			</div>
			<div>
			<br>
			<table id="hostGx" style="width: 70%;" class="board_table">
				<tr class="boardth">
					<th style="width: 250px">모임이름</th>
					<th style="width: 270px">장소</th>
					<th style="width: 170px">시간</th>
					<!-- <th>최소인원</th>
					<th>최대인원</th> -->
					<th style="width: 70px">참여인원</th>
					<th style="width:70px; ">모집상태</th>
					<th style="width:80px;">모임삭제</th>
				</tr>
				<c:forEach  items='${list }' var='host' >
					<tr class="board_contents">
						<td><a style="color: #58ACFA;" href="groupinfo?gno=${host.gno }">${host.gtitle }</a></td>
						<td>${host.gloc }</td>
						<td>${host.gday }</td>
						<%-- <td>${host.gmin }</td>
						<td>${host.gmax }</td> --%>
						<td>${host.gsum }</td>
						<td>${host.gstatus }</td>
						<td style="padding-top: 5px; width: 100px;">
						<input type="button" class="sbutton" value="삭제" onclick="deleteGx('${host.gno}')"></td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
</form>