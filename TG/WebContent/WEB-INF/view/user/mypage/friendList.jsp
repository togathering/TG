<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form id="form" style="padding-top: 20px; text-align: center;">
	<div class="wrapper">
		<br>
		<div style="float: left; margin-left: 50px;">
			<h4 style="text-align: left;">模备 府胶飘</h4>
			<br>
		</div>
		<table class="board_table" style="width: 70%" id="friendTable">
			<tr class="boardth">
				<th width="200px">I D</th>
				<th width="140px">葱匙烙</th>
				<th width="80px">率瘤</th>
				<th width="80px">模备昏力</th>
			</tr>

			<c:forEach items='${flist }' var='flist'>
				<tr class="board_contents" style="margin-top: 5px;">
					<td width="220px" style="padding-top: 15px">${flist.id }</td>
					<td width="150px">${flist.nick }</td>
					<td width="70px"><input type="button" class="sbutton"
						value="率瘤" onclick="msg('${flist.id }', '${flist.nick }')"></td>
					<td width="70px"><input type="button" class="sbutton"
						value="昏力" onclick="delFriend('${flist.id }')"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>
