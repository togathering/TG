<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function friendReq() {
	$.ajax({url:"myFriendReq", type:"POST", dataType:"text",
		success:function(data1){
			var table1 = document.getElementById('reqTable');
			table1.innerHTML = data1;
		}
	});
}
function friendList() {
	$.ajax({url:"myFriendList", type:"POST",data:"page=myPage", dataType:"text",
		success:function(data2){
			var table2 = document.getElementById('friendTable');
			table2.innerHTML = data2;
		}
	});
}
</script>
<style>
.ulHostside{
color: #424242; 
 list-style:none;
}
.ulHostside li{
	margin: 15px 0px; 
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div style="float: left; width: 100px;  background-color: #FAFAFA;  height: 300px; display: inline; margin: 0 2%; padding-left: 120px; padding-top: 30px;" >

		<ul class="ulHostside">
			<li><a href="#" style="color: black" onclick="friendReq()">ģ�����</a></li>
			<li><a href="#" style="color: black" onclick="friendList()">ģ����û���</a></li>
		</ul>
	</div>
</body>
</html>