<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="func"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<title>Administrator Member����</title>
</head>
<body>
	<tiles:insertAttribute name="adminHeader" />
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<div>
	</div>

	<script type="text/javascript">
		$(function() {
		//�����˻��� ��õ
			$('#searchtxt').keyup(function() {
				$.ajax({
					url : 'suggestId',
					type : "POST",
					data : {
						keyword : $('#searchtxt').val()
					},
					dataType : "text",
					success : function(data) {
						var availableTags = eval(data);
						$("#searchtxt").autocomplete({
							minLength : 1,
							source : availableTags
						});
					}
				});
			});// 

		// �˻��� â 
		$('#search').click(function (){
			var search = $("#searchtxt").val();
			searchClick(search, 1);
		});
			
		});
		function searchClick(search, page){
			$.ajax({
				url:'specificId',
				type:'POST',
				data : {
					keyword:search,
					pageNum:page
				},
				dataType : 'html',
				success:function(data){
					$("#tableAndpage").html(data);
				}
				
			})
		}
		
		function goPage(page){
			var search = $("#searchtxt").val();
			searchClick(search, page);
		}

		// ���� ���� �ִ� �˾�â ����

		function msg2(friendId, friendNick) {
			var id = friendId;
			var nick = friendNick;

			window
					.open('writeNote?id=' + id + '&nick=' + nick, '',
							'width=400, height=450, screenX=400, screenY=130, resizable=no');
		}
		
		// �˻� ��ư Ŭ���� 
	</script>

	<form action="" name="frm">
		<div style="float: left; width: 95%; margin: 0 1%;">
			<div >
			
				<input type="text" name="searchtxt" class="searchtxt" id="searchtxt"
					placeholder="�˻���ID �Է�"
					style="height: 34px; margin-bottom: 6px; padding: 3px 6px; font-size: 16px;">

				<input type="button" class="button" name="search" id="search"
					value="�˻�" style="margin-top: 2px;">
					
				<input type="hidden"  name="pageNum"  id="pageNum" value="">	
			</div>
			<hr>
		<div id="tableAndpage">
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
			<br />
			<br />
			<hr />
			<center>
				<a href="adminMemberList?pageNum=1">����������</a>
				<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
					<a href="adminMemberList?pageNum=${i }">${i }</a>
				</c:forEach>
				<a href="adminMemberList?pageNum=${pageMaxNum }">��������</a>
			</center>
			</div>
		</div>

	</form>

</body>
</html>