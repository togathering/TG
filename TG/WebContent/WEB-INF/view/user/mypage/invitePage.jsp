<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<div>
		<h2>�׷쿡 �ʴ�Ǿ����~</h2>
		<hr>
		
		<table style="width: 70%; margin: 20px auto;">
			<tr style="height: 30px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
				<th width="220px">���� �ʴ��� ���</th>
				<th width="150px">�׷� ����</th>
				<th width="100px">���캸��/����</th>
			</tr>
		</table>
		<table style="width: 70%; margin: 20px auto;" id="inviteTable">
			
		</table>
	</div>	
	<div style="position: relative; top: 30px">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>