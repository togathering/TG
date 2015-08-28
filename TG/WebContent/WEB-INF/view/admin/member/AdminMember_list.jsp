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
<link rel="stylesheet" type="text/css" href="css/search.css">
<title>Administrator Member����</title>
<style type="text/css">
a{
text-decoration:none;
font:bold;
color:rgb(41, 128, 185);
}
th{
font-size: 15px;
color:white;;
}
td{
font-size: 14px;
color: #585858;
}
.board_div{
float:left;
width: 100%;
margin: 0 auto;
}
.board_table{
width: 80%; 
min-width:800px; 
margin:1% auto; 
border-collapse: collapse;"
}
.boardth{
height:45px;
background-color: rgb(245, 88, 88);
}
.board_contnets{
border-bottom: 1px solid #2E2E2E;
height: 47px; 
font: bold;"
}
.search_input{
 height: 30px;
 width:30%;
 min-width:400px; 
 padding: 3px 6px; 
 font-size: 14px;"
}
.search_div{
	float:left;
 	width: 90%; 
 	margin-left:10%;
 	padding: 0 auto;
}
.paging_div{
float:left;
 margin:15px auto;
 width:100%;
}
</style>
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
			document.frm.searchtxt.value = '';
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
			document.frm.searchtxt.value = '';
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
		
				//����	
		function deleteId(eraseId){
			if(eraseId.startsWith('(Ż��ȸ��)')){
				alert("�̹� Ż���� ȸ���Դϴ�.");	
			}else{
			
				//alert(eraseId);
	    		var del =confirm("���� �����Ͻðڽ��ϱ�?");
	    		
	    		if(del){
	    	$.ajax({
	    		url: 'removeId',
	    		type:'POST' ,
	    		data: {delId:eraseId},
	    		dataType:"text",
	    		success:function(){
	    			searchClick('@',1);
	    		}});
	   		 }//if��
			}
		};
	</script>

	<form action="" name="frm">
		<div  class="search_div">	
				<input type="text" name="searchtxt" class="search_input" id="searchtxt"
					placeholder="�˻���ID �Է�">

				<input type="button" class="button" name="search" id="search"
					value="�˻�" style="margin-top: 2px;">
					
				<input type="hidden"  name="pageNum"  id="pageNum" value="">	
			</div>
			
		<div class="board_div" id="tableAndpage">
			<table id="mtable" class="board_table">
				<tr class="boardth">
					<th style="width: 220px">���̵�</th>
					<th>�г���</th>
					<th>����Ƚ��</th>
					<th>����Ƚ��</th>
					<th>���Ƚ��</th>
					<th>�����߼�</th>
					<th>ȸ������</th>
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
							name="msg" id="msg" value="����"
							onclick="msg2('${member.mid }', '${member.mnick }')"></td>
						<td align="center"><input type="button" class="sbutton"
							name="delete" id="delete" value="����"
							onclick="deleteId('${member.mid }')"></td>
					</tr>
				</c:forEach>
			</table>


			<div class="paging_div" align="center">
				<a href="adminMemberList?pageNum=1">����������</a>
				<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
					<a href="adminMemberList?pageNum=${i }">${i }</a>
				</c:forEach>
				<a href="adminMemberList?pageNum=${pageMaxNum }">��������</a>
				
			</div>
		</div>

	</form>

</body>
</html>