<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	function loadInvite() {
		$.ajax({url:"invitePage", type:"POST", dataType:"text",
			success:function(data){
				var table = document.getElementById('inviteTable');
				table.innerHTML = data;
			}
		});
	}
	
	function delInvite(sendId, gno, reId) {
		$.ajax({url:"delInvite", type:"POST", data: "sendId="+sendId+"&gno="+gno+"&reId="+reId, dataType:"text",
			success:function(data){
				var table = document.getElementById('inviteTable');
				table.innerHTML = data;
			}
		});
	}
	
	$(document).ready(function() {
		loadInvite();
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="myPageHeader"/>
	</div>
	<div  class="board_div">
		<h2>그룹에 초대되었어요~</h2>
		
		<table  class="board_table">
			<tr class="boardth">
				<th width="220px">나를 초대한 사람</th>
				<th width="150px">그룹 제목</th>
				<th width="150px">살펴보기/거절</th>
			</tr>
		</table>
		<table style="width: 70%; margin: 20px auto;" id="inviteTable">
			
		</table>
	</div>	
	<div style="position: relative; top: 230px; ">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>