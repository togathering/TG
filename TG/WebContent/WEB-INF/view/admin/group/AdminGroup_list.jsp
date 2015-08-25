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
	function load() {
		var gtitle = document.frm.searchtxt.value;
		sendRequest('/AdminSearchGroup.jsp', 'gtitle=' + gtitle, loaded, 'POST');
		/* alert(document.frm.searchtxt.value); */
	}

	function loaded() {//요청에 대한 응답데이터 처리
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var table = document.getElementById('mtable');
				/* alert(xhr.responseText); */
				var htmlMsg = xhr.responseText;
				document.getElementById("mtable").innerHTML = htmlMsg;
			}
		}
	}//loaded
	function setPage(i) {
		alert(i);
		//request.setAttribute("nowpage", i);
	}
	window.onload = function() {

	}
	function deleteG() {
		alert("정말 삭제하시겠습니까?")
		

	}

	function modifyG() {
		alert("수정하시겠습니까?")
	}

</script>
<script type="text/javascript" src="js/ajax.js"></script>
<title>Insert title here</title>
</head>
<body>
 <div><tiles:insertAttribute name="adminHeader"/></div> 
	나는그룹리스트 !
		<form action="" name="frm" onsubmit="return false;">
	
		<div>
			<input type="text" name="searchtxt" id="searchtxt" placeholder="검색할 모임명 입력" 
			style="height: 34px; margin-bottom: 6px; padding: 3px 6px; font-size: 16px;"
			onkeydown="javascript:if(event.keyCode==13){load();}">
			<input type="button" class="button" name="search" id="search" value="검색" style="margin-top: 2px;" onclick="load()">
		</div>
		<hr>
		<div style="float: left; width: 98%; margin: 0 1%;">
			<table style="width: 98%; border-collapse: collapse;" id="mtable">
				<tr height="30px" style="border-bottom: 1px solid #167266;">
					<th>모임번호</th>
					<th style="width: 250px">모임명</th>
					<th>만든날짜</th>
					<th>모임날짜</th>
					<th>참가인원</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="grpbean">
					<tr style="border-bottom: 1px solid #167266;">
						<td align="center">${grpbean.gno }</td>
						<td align="center"><a href="#"
							onClick="window.open('http://localhost/ToGathering/groupinfo.do?gno=${grpbean.gno }','name',
							'width=1300,height=630');return false">${grpbean.gtitle }</a></td>
						<td align="center">${grpbean.gday }</td>
						<td align="center">${grpbean.gdate }</td>
						<td align="center">${grpbean.gsum }</td>
						<td align="center">
							<!-- <input type="button" onclick="modifyG()" class="button" name="update" id="update" value="수정">  -->
							<input type="button" onclick="deleteG()" class="sbutton" name="delete" id="delete" value="삭제"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>