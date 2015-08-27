<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h1>참가 내역</h1><br><br>
		<font color="#add">현재 ${gNum } 개의 모임에 참여중입니다</font><br><br>
			<table id="joinGx" style="width: 70%; margin-left: 5px;">
				<tr style="height: 40px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
					<td style="width: 100px; padding-top: 8px;">모임이름</td>
					<td>개최자</td>
					<td>장소</td>
					<td>일시</td>
					<td>최소인원</td>
					<td>최대인원</td>
					<td>참여인원</td>
					<td>모집상태</td>
					<td><font style="text-align: center;">참여취소</font></td>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr style="height: 80px; text-align: center; border: 1px; border: 1px solid lightgray;" >
					<td style="padding-top: 15px;"><a style="color: gray;" href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td>${gx.gmin }</td>
					<td>${gx.gmax }</td>
					<td>${gx.gsum }</td>
					<td>${gx.gstatus }</td>
					<td>
					<input type="button" name="cancel" class="button" value="모임취소" style="display: " onclick="cancelGx('${gx.gno}')">
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</form>