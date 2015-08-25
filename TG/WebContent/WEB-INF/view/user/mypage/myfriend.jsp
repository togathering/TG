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
	function reqLoad() {
		$.ajax({url:"myFriendReq", type:"POST", dataType:"text",
			success:function(data1){
				var table1 = document.getElementById('reqTable');
				table1.innerHTML = data1;
			}
		});
	}
	function friendLoad() {
		$.ajax({url:"myFriendList", type:"POST",data:"page=myPage", dataType:"text",
			success:function(data2){
				var table2 = document.getElementById('friendTable');
				table2.innerHTML = data2;
			}
		});
	}
	
	function acceptFriend(acceptId) {
		$.ajax({url:"acceptFriend", type:"POST", data: "fid="+acceptId, dataType:"text",
			success:function(data){
				reqLoad();
				friendLoad();
			}
		});
	}
	
	function rejectFriend(rejectId) {		
		$.ajax({url:"rejectFriend", type:"POST", data: "rejectId="+rejectId, dataType:"text",
			success:function(data){
				reqLoad();
				friendLoad();
			}
		});
	}
	
	 // ���� ���� �ִ� �˾�â ���� 
	function msg(friendId, friendNick) {
		var id = friendId;
		var nick = friendNick; 
		
		window.open('writeNote?id='+id+'&nick='+nick,'',
					'width=400, height=450, screenX=400, screenY=130, resizable=no');
	}
	
	
	
	function delFriend(delFriendId) {
		var del = confirm("�����Ұſ���?");
		
		if(del){
			$.ajax({url:"delFriend.do", type:"POST", data: "delId="+delFriendId, dataType:"text",
				success:friendLoad()
			});
		}
	}
	
	$(document).ready(function(){
		reqLoad();
		friendLoad();
	});
</script>


<title>Insert title here</title>
</head>
<body>
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	<br><br>
	<div>
		<tiles:insertAttribute name="myPageHeader"/>
	</div>
	<div align="center">
		<h2>���� ������</h2>
		<hr>
		
		<h3>ģ�������ϱ�</h3>
		<br>
		<table style="width: 70%; margin: 20px auto;">
			<tr style="height: 30px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
				<th width="220px">I D</th>
				<th width="150px">�г���</th>
				<th width="100px">����/����</th>
			</tr>
		</table>
		<table style="width: 70%; margin: 20px auto;" id="reqTable">
			
		</table>
		<hr>
		<h3 align="center">��ģ����</h3>
		<br>
		<table style="width: 70%; margin: 20px auto;">
			<tr style="height: 30px; background-color: #40C4AD; border: 1px solid lightgray; font-weight: bold;">
				<th width="220px">I D</th>
				<th width="150px">�г���</th>
				<th width="70px">����</th>
				<th width="70px">ģ������</th>
			</tr>
		</table>
		<table style="width: 70%; margin: 20px auto;" id="friendTable">
		
		</table>
	
	</div>
	
	<div style="position: relative; top: 30px">
		<tiles:insertAttribute name="footer" />
	</div>	
</body>
</html>