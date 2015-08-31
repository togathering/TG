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
<style type="text/css">
.board_div{
float:left;
width: 100%;
margin: 0 auto;
}
</style>

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
			//	alert(data);	
				$("#tableAndpage").html(data);
			}
			
		})
	} 
	function deleteG( day,group) {
		var today = new Date();
		var holdday= new Date(day.substr(0,4),parseInt(day.substr(5,2))-1, day.substr(8,2),
											day.substr(11,2),day.substr(14,2),day.substr(17,2));
		
		if(holdday<today){
			alert("이미 진행완료된 모임은 삭제할 수 없습니다.");
		}else{
			var check = confirm("정말 삭제하시겠습니까?");
			if(check){
				alert("check"+check);
				
			$.ajax({
				url : 'deleteG',
				type:'POST',
				data:{
					delGno : group	  
				},
				dataType:'plain',
				success: function(data){
					alert(data);
					location.href='adminGroupList';
				}
			})
			}
		}//else
	}
</script>
<title>Administrator Group관리</title>
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
			<input type="text" name="searchtxt" id="searchtxt" placeholder="검색할 모임명 입력" class="search_input"
				onkeydown="javascript:if(event.keyCode==13){searchClick(search, page);}"> 
			<input type="button" style="margin-top: 1px" class="button" name="search" id="search" value="검색" onclick="searchGroup()">
		</div>
		<!-- 게시판내용 -->
		<div id="tableAndpage" class="board_div" >
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
					<tr class="board_contents">
						<td align="center">${grpbean.gno }</td>
						<td align="center"><a class="atag" href="#"
							onClick="window.open('http://localhost/TG/groupinfo?gno=${grpbean.gno }','name',
							'width=1300,height=630');return false">${grpbean.gtitle }</a></td>
						<td align="center">${grpbean.gdate }</td>
						<td align="center">${grpbean.gday }</td>
						<td align="center">${grpbean.gsum }</td>
						<td align="center">
							<input type="button" onclick="deleteG('${grpbean.gday }','${grpbean.gno }')" class="sbutton"
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