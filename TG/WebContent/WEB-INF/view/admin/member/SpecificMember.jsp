<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="func"%>
	<table style="width: 95%;" id="mtable">
		
				<tr>
					<th style="width: 220px">���̵�</th>
					<th>�г���</th>
					<th>����Ƚ��</th>
					<th>����Ƚ��</th>
					<th>���Ƚ��</th>
					<th>�����߼�</th>
					<th>ȸ������</th>
				</tr>
				<c:forEach items="${list }" var='member'>

					<tr>
						<td align="center"><a href="#"
							onclick="window.open('http://localhost/ToGathering/my.do?id=${member.mid }','name','width=1300,height=630') return false">
								${member.mid } </a></td>
						<td align="center">${member.mnick }</td>
						<td align="center">${member.pp }</td>
						<td align="center">${member.ccnt }</td>
						<td align="center">${member.rcnt }</td>
						<td align="center"><input type="button" class="button"
							name="msg" id="msg" value="����"
							onclick="msg2('${member.mid }', '${member.mnick }')"></td>
						<td align="center"><input type="button" class="button"
							name="delete" id="delete" value="����"
							onclick="deleteId('${member.mid }')"></td>
					</tr>
				</c:forEach>
			</table>