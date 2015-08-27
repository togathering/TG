<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="func"%>
	<table id="mtable"  class="board_table">
		
				<tr  class="boardth">
					<th style="width: 220px">아이디</th>
					<th>닉네임</th>
					<th>참가횟수</th>
					<th>개최횟수</th>
					<th>경고횟수</th>
					<th>쪽지발송</th>
					<th>회원삭제</th>
				</tr>
				<c:forEach items="${list }" var='member'>

					<tr class="board_contnets">
						<td align="center"><a href="#"
							onclick="window.open('http://localhost/ToGathering/my.do?id=${member.mid }','name','width=1300,height=630') return false">
								${member.mid } </a></td>
						<td align="center">${member.mnick }</td>
						<td align="center">${member.pp }</td>
						<td align="center">${member.ccnt }</td>
						<td align="center">${member.rcnt }</td>
						<td align="center"><input type="button" class="sbutton"
							name="msg" id="msg" value="쪽지"
							onclick="msg2('${member.mid }', '${member.mnick }')"></td>
						<td align="center"><input type="button" class="sbutton"
							name="delete" id="delete" value="삭제"
							onclick="deleteId('${member.mid }')"></td>
					</tr>
				</c:forEach>
			</table>
				<br />
			<br />
			<hr />
			<div class="paging_div" align="center">
				<a href="#"  onclick="goPage(1);">시작페이지</a>
				<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
					<a href="#" onclick="goPage(${i })">${i }</a>
				</c:forEach>
				<a href="#" onclick="goPage(${pageMaxNum })">끝페이지</a>
				</div>