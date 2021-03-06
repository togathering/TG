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
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<link rel="stylesheet" type="text/css" href="font.css">
<title>Administrator Member관리</title>
<style type="text/css">
.board_div{
float:left;
width: 100%;
margin: 0 auto;
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
		//연관검색어 추천
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
			 

		// 검색어 창 
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

		// 쪽지 쓸수 있는 팝업창 생성

		function msg2(friendId, friendNick) {
			var id = friendId;
			var nick = friendNick;

			window
					.open('writeNote?id=' + id + '&nick=' + nick, '',
							'width=400, height=450, screenX=400, screenY=130, resizable=no');
		}
		
		// 검색 버튼 클릭시 
		
				//삭제	
		function deleteId(eraseId){
			if(eraseId.startsWith('(탈퇴회원)')){
				alert("이미 탈퇴한 회원입니다.");	
			}else{
			
				//alert(eraseId);
	    		var del =confirm("정말 삭제하시겠습니까?");
	    		
	    		if(del){
	    			location.href="removeId?delId="+eraseId;
	   		 }//if절
			}
		};
		
				//삭제2
		function deleteId2(eraseId){
			if(eraseId.startsWith('(탈퇴회원)')){
	    		var del =confirm("정말 삭제하시겠습니까?");
	    		
	    		if(del){
	    		location.href="removeId2?delId="+eraseId;
	   		 } 
	    		
			}else{
				alert("삭제1 실행 후 진행 요망")				
	   		 }
		};
	</script>

	<form action="" name="frm">
		<div  class="search_d">	
				<input type="text" name="searchtxt" class="search_input" id="searchtxt"
					placeholder="검색할ID 입력">

				<input type="button" class="button" style="margin-top: 1px" name="search" id="search"
					value="검색" style="margin-top: 2px;">
					
				<input type="hidden"  name="pageNum"  id="pageNum" value="">	
			</div>
			
		<div class="board_d" id="tableAndpage">
			<table id="mtable" class="board_table">
				<tr class="boardth">
					<th style="width: 220px">아이디</th>
					<th>닉네임</th>
					<th>참가횟수</th>
					<th>개최횟수</th>
					<th>경고횟수</th>
					<th>쪽지발송</th>
					<th>회원삭제</th>
				</tr>
				
				<c:forEach items="${list }" var='member'>
					<tr class="board_contents">
						<td align="center"><a class="atag" href="#"
							onClick="window.open('http://localhost/TG/profile?id=${member.mid }','name',
								'width=880,height=600'); return false">
								${member.mid } </a></td>
						<td align="center">${member.mnick }</td>
						<td align="center">${member.pp }</td>
						<td align="center">${member.ccnt }</td>
						<td align="center">${member.rcnt }</td>
						<td align="center"><input type="button" class="sbutton"
							name="msg" id="msg" value="쪽지"
							onclick="msg2('${member.mid }', '${member.mnick }')"></td>
						<td align="center"><input type="button" class="sbutton"
							name="delete" id="delete" value="삭제1"
							onclick="deleteId('${member.mid }')">
							<input type="button" class="sbutton"
							name="delete" id="delete" value="삭제2"
							onclick="deleteId2('${member.mid }')"></td>
					</tr>
				</c:forEach>
			</table>


			<div class="paging_d" align="center">
				<a href="adminMemberList?pageNum=1">시작페이지</a>
				<c:forEach begin="1" end="${pageMaxNum }" step="1" var="i">
					<a href="adminMemberList?pageNum=${i }">${i }</a>
				</c:forEach>
				<a href="adminMemberList?pageNum=${pageMaxNum }">끝페이지</a>
				
			</div>
		</div>

	</form>

</body>
</html>