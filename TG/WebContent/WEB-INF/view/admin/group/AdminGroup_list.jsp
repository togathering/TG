<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">


<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	
	function searchGroup(){
		var search = $("#searchtxt").val();
		//alert(search); 
		searchClick(search, 1);
	};
	
</script>
<script type="text/javascript">


	
	function searchClick(search, page){
		$.ajax({
			url:'specificGroup',
			type:'POST',
			data : {
				keyword:search,
				pageNum:page
			},
			dataType : 'html',
			success:function(data){
				alert(data);	
				$("#tableAndpage").html(data);
			}
			
		})
	} 
	function deleteG() {
		alert("���� �����Ͻðڽ��ϱ�?")

	}

	function modifyG() {
		alert("�����Ͻðڽ��ϱ�?")
	}
</script>
<title>Administrator Group����</title>
</head>
<body>
<!-- ��� Ÿ���� -->
	<div>
		<tiles:insertAttribute name="adminHeader" />
	</div>
 <!-- ������ ���� form -->
	<form action="" name="frm" onsubmit="return false;">
	<!-- �˻��κ� -->
		<div class="search_div">
			<input type="text" name="searchtxt" id="searchtxt" placeholder="�˻��� ���Ӹ� �Է�"
				class="search_input"
				onkeydown="javascript:if(event.keyCode==13){searchClick(search, page);}"> 
			<input type="button" class="button" name="search" id="search" value="�˻�" onclick="searchGroup()">
		</div>
		<br>
		<!-- �Խ��ǳ��� -->
		<div class="board_div" id="tableAndpage">
			<table  id="mtable" class="board_table">
				<!-- ���̺���� -->
				<tr class="boardth">
					<th>���ӹ�ȣ</th>
					<th style="width: 250px">���Ӹ�</th>
					<th>���糯¥</th>
					<th>���ӳ�¥</th>
					<th>�����ο�</th>
					<th>����</th>
				</tr>
				<!-- ���̺��� -->
				<c:forEach items="${list }" var="grpbean">
					<tr class="board_contnets">
						<td align="center">${grpbean.gno }</td>
						<td align="center"><a href="#"
							onClick="window.open('http://localhost/TG/groupinfo?gno=${grpbean.gno }','name',
							'width=1300,height=630');return false">${grpbean.gtitle }</a></td>
						<td align="center">${grpbean.gday }</td>
						<td align="center">${grpbean.gdate }</td>
						<td align="center">${grpbean.gsum }</td>
						<td align="center">
							<input type="button" onclick="deleteG()" class="sbutton"
							name="delete" id="delete" value="����">
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- ����¡ -->
			<div class="paging_div" align="center">
			<a href="adminGroupList?pageNum=1">����������</a>
			<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
				<a href="adminGroupList?pageNum=${i }">${i }</a>
			</c:forEach>
			<a href="adminGroupList?pageNum=${pageMaxNum }">��������</a>
			</div>
		</div>
	</form>
	<br>
	<br>
</body>
</html>