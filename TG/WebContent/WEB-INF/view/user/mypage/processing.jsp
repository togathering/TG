<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper"><h2>���� ����</h2><br>
		<font color="#add">���� ${gNum } ���� ���ӿ� �������Դϴ�</font><br>
			<div class="board_div" id="tableAndpage">
			<table id="joinGx" class="board_table" style="width: 75%">
				<tr class="boardth" style="padding-top: 8px;">
					<th style="width: 100px;">�����̸�</th>
					<th>������</th>
					<th>���</th>
					<th>�Ͻ�</th>
					<th>�ּ��ο�</th>
					<th>�ִ��ο�</th>
					<th>�����ο�</th>
					<th>��������</th>
					<th><font style="text-align: center;">�������</font></th>
				</tr>
				<c:forEach  items='${list }' var='gx' >
				<tr class="board_contents" >
					<td style="padding-top: 15px;"><a style="color: gray;" href="groupinfo?gno=${gx.gno }">${gx.gtitle }</a></td>
					<td>${gx.ghost }</td>
					<td>${gx.gloc }</td>
					<td>${gx.gday }</td>
					<td>${gx.gmin }</td>
					<td>${gx.gmax }</td>
					<td>${gx.gsum }</td>
					<td>${gx.gstatus }</td>
					<td>
					<input type="button" name="cancel" class="sbutton" value="�������" style="display: " onclick="cancelGx('${gx.gno}')">
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		</form>