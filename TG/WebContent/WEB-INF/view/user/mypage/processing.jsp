<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
			<br>
			<div style="float:left; margin-left: 80px;">
				<h4 style="text-align: left;">������ ���� �� ������ ����</h4>
				<br>
		<%-- <font color="#F78181">���� ${gNum }�� ���ӿ� �������Դϴ�</font> --%>
			</div>
			<div class="board_div" id="tableAndpage">
			<table id="joinGx" class="board_table" style="width: 70%">
				<tr class="boardth" style="padding-top: 8px;">
					<th style="width: 170px;">�����̸�</th>
					<th>������</th>
					<th style="width: 270px">���</th>
					<th style="width: 170px">�Ͻ�</th>
			<!-- 		<th>�ּ��ο�</th>
					<th>�ִ��ο�</th> -->
					<th style="width: 70px">�����ο�</th>
					<!-- <th>��������</th> -->
					<th style="width: 90px"><font style="text-align: center;">�������</font></th>
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
					<input type="button" name="cancel" class="sbutton" value="�������" style="display: " onclick="cancelGx('${gx.gno}')">
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		</form>