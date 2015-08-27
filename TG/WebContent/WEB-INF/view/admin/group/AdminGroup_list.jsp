<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<script type="text/javascript">

	$('#search').click(function (){
		$.ajax({
			
			url:'specificTitle',
			type:"POST",
			data :{
				keyword: $('#searchtxt').val()
			},
			dataType : "html",
			success: function(data){
				var table = document.getElementById("mtable");
				table = data;
			alert(data);
			}
		})
		
	})
	

	function deleteG() {
		alert("���� �����Ͻðڽ��ϱ�?")
		

	}

	function modifyG() {
		alert("�����Ͻðڽ��ϱ�?")
	}

</script>
<script type="text/javascript" src="js/ajax.js"></script>
<title>Insert title here</title>
</head>
<body>
 <div><tiles:insertAttribute name="adminHeader"/></div> 
		<form action="" name="frm" onsubmit="return false;">
	
		<div>
			<input type="text" name="searchtxt" id="searchtxt" placeholder="�˻��� ���Ӹ� �Է�" 
			style="height: 34px; margin-bottom: 6px; padding: 3px 6px; font-size: 16px;"
			onkeydown="javascript:if(event.keyCode==13){load();}">
			<input type="button" class="button" name="search" id="search" value="�˻�" style="margin-top: 2px;" onclick="load()">
		</div>
		<hr>
		<div style="float: left; width: 98%; margin: 0 1%;">
			<table style="width: 98%; border-collapse: collapse;" id="mtable">
				<tr height="30px" style="border-bottom: 1px solid #167266;">
					<th>���ӹ�ȣ</th>
					<th style="width: 250px">���Ӹ�</th>
					<th>���糯¥</th>
					<th>���ӳ�¥</th>
					<th>�����ο�</th>
					<th>����</th>
				</tr>
				<c:forEach items="${list }" var="grpbean">
					<tr style="border-bottom: 1px solid #167266;">
						<td align="center">${grpbean.gno }</td>
						<td align="center"><a href="#"
							onClick="window.open('http://localhost/TG/groupinfo?gno=${grpbean.gno }','name',
							'width=1300,height=630');return false">${grpbean.gtitle }</a></td>
						<td align="center">${grpbean.gday }</td>
						<td align="center">${grpbean.gdate }</td>
						<td align="center">${grpbean.gsum }</td>
						<td align="center">
							<!-- <input type="button" onclick="modifyG()" class="button" name="update" id="update" value="����">  -->
							<input type="button" onclick="deleteG()" class="sbutton" name="delete" id="delete" value="����"></td>
					</tr>
				</c:forEach>
			</table>
			<a href="adminGroupList?pageNum=1">����������</a>
				<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
					<a href="adminGroupList?pageNum=${i }">${i }</a>
				</c:forEach>
				<a href="adminGroupList?pageNum=${pageMaxNum }">��������</a>
		</div>
	</form>
</body>
</html>