<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="form" style="padding-top: 20px; text-align: center;">
		<div class="wrapper">
		<br>
		<div style="float:left; margin-left: 80px;">
		<h4 style="text-align: left;">ȣ��Ʈ ���� �� ������ ����</h4>
			<br>
			<font color="#F78181">���� ${hNum}�� ������ ȣ��Ʈ�� �ð��ֽ��ϴ�.</font>	
			</div>
			<div>
			<br>
			<table id="hostGx" style="width: 70%;" class="board_table">
				<tr class="boardth">
					<th style="width: 250px">�����̸�</th>
					<th style="width: 270px">���</th>
					<th style="width: 170px">�ð�</th>
					<!-- <th>�ּ��ο�</th>
					<th>�ִ��ο�</th> -->
					<th style="width: 70px">�����ο�</th>
					<th style="width:70px; ">��������</th>
					<th style="width:80px;">���ӻ���</th>
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
						<input type="button" class="sbutton" value="����" onclick="deleteGx('${host.gno}')"></td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
</form>