<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/trim.js"></script>
<script type="text/javascript">
	function searchMember() {//멤버검색 실행
		var msearch = trim(document.memFrm.msearch.value);
	
		if(!msearch){
			alert('검색어를 입력해주세요');
			return;
		}
		$.ajax({url:'searchuser', type:'POST', data: 'search='+msearch, dataType:'text', 
			success:function(data){
				var table = document.getElementById('listTable');
				if(data.length!=6){
					document.getElementById('listhead').style.display = '';
					table.innerHTML = data;					
				}else{
					alert('결과값이 없습니다');
				}
			}
		});
	}
	
	function friend(fid) {//친구신청
		
		var con = confirm(fid+'님을 친구추가하겠습니까??');
			
		if(con){	
			var msearch = trim(document.memFrm.msearch.value);
			
			$.ajax({url:'addFriend', type:'POST', data: 'search='+msearch+'&fid='+fid, dataType:'text', 
				success:function(data){
					alert('친구신청을 완료 하였습니다');
					
					var table = document.getElementById('listTable');
					
					document.getElementById('listhead').style.display = '';
					table.innerHTML = data;					
				}
			});
		}else{
			alert('취소하였습니다');
		}
	}
	
	function report(reportId) {
		if(confirm("정말 신고하시겠습니까?\n허위로 신고한 경우 처벌을 받을 수 있습니다.")){
			window.open('report?accused='+reportId,'','width=450, height=480, screenX=400, screenY=120  scrollbars= no'); 
		}
	}

</script>

<title>사람 찾아요~</title>
</head>
<body>
	<div><tiles:insertAttribute name="header"/></div>
	<form name="memFrm">
		<div align="center">
			<h3>사람들을 검색할수있어요~</h3>
			<br>
			<input type="text" class="search_input" style="margin-bottom: 1px;" name="msearch"  placeholder="ID를 입력해주세요~">
			<input type="button" class="button"  style="margin-top: 1px" name="msearch_bt" value="검색" onclick="searchMember()">
		</div>
	
		<hr>
		<div align="center" id="mlist">
			<table  class="board_table" style="width: 70%; min-width:700px; display: none" id="listhead">
				<tr  class="boardth">
					<th width="120px">프로필보기</th>
					<th width="210px">I D</th>
					<th width="150px">닉네임</th>
					<th width="70px">친구신청</th>
					<th width="70px">신고하기</th>
				</tr>
			</table>
			<table  class="board_table" style="width: 70%; min-width:700px;" id="listTable">
				
			</table>
		</div>
	</form>
	<div style="position: relative; top: 150px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>