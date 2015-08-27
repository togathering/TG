<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	 $(function() {
		$('#search').click(function() {
			var search = $("#searchtxt").val();
			searchClick(search, 1);
		});

	});
	function searchClick(search, page){
		$.ajax({
			url:'specificTitle',
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
	function deleteG() {
		alert("정말 삭제하시겠습니까?")

	}

	function modifyG() {
		alert("수정하시겠습니까?")
	}
</script>
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
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 타일즈 -->
	<div>
		<tiles:insertAttribute name="adminHeader" />
	</div>
 <!-- 페이지 내용 form -->
	<form action="" name="frm" onsubmit="return false;">
	<!-- 검색부분 -->
		<div class="search_div">
			<input type="text" name="searchtxt" id="searchtxt" placeholder="검색할 모임명 입력"
				class="search_input"
				onkeydown="javascript:if(event.keyCode==13){searchClick(search, page);}"> 
			<input type="button" class="button" name="search" id="search" value="검색">
		</div>
		<br>
		<!-- 게시판내용 -->
		<div class="board_div">
			<table  id="mtable" class="board_table">
				<!-- 테이블헤더 -->
				<tr class="boardth">
					<th>모임번호</th>
					<th style="width: 250px">모임명</th>
					<th>만든날짜</th>
					<th>모임날짜</th>
					<th>참가인원</th>
					<th>삭제</th>
				</tr>
				<!-- 테이블내용 -->
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
							name="delete" id="delete" value="삭제">
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 -->
			<div class="paging_div" align="center">
			<a href="adminGroupList?pageNum=1">시작페이지</a>
			<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
				<a href="adminGroupList?pageNum=${i }">${i }</a>
			</c:forEach>
			<a href="adminGroupList?pageNum=${pageMaxNum }">끝페이지</a>
			</div>
		</div>
	</form>
	<br>
	<br>
</body>
</html>