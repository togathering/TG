<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
			<br>
			<div style="float:left; margin-left: 80px;">
				<h4 style="text-align: left;">참가자 내역 ▷ 예정된 모임</h4>
				<br>
		<%-- <font color="#F78181">현재 ${gNum }개 모임에 참여중입니다</font> --%>
			</div>
			<div class="board_div" id="tableAndpage">
			<table id="joinGx" class="board_table" style="width: 70%">
				<tr class="boardth" style="padding-top: 8px;">
					<th style="width: 170px;">모임이름</th>
					<th>개최자</th>
					<th style="width: 270px">장소</th>
					<th style="width: 170px">일시</th>
			<!-- 		<th>최소인원</th>
					<th>최대인원</th> -->
					<th style="width: 70px">참가인원</th>
					<!-- <th>모집상태</th> -->
					<th style="width: 90px"><font style="text-align: center;">참가취소</font></th>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr class="board_contents" >
					<td style="padding-top: 15px;"><a style="color: #58ACFA;" href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<%-- <td>${gx.gmin }</td>
					<td>${gx.gmax }</td> --%>
					<td>${gx.gsum }</td>
					<%-- <td>${gx.gstatus }</td> --%>
					<td>
					<input type="button" name="cancel" class="sbutton" value="참가취소" style="display: " onclick="cancelGx('${gx.gno}')">
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		</form>