<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function myhost() {
		$.ajax({url: 'myhosting', type: 'POST', dataType: 'text', 
			success: function (data) {
				var section = document.getElementById('section');
				section.innerHTML = data;
			}
		});
	}
	
	function myhostend() {
		$.ajax({url: 'myhostend', type: 'POST', dataType: 'text', 
			success: function (data) {
				var section = document.getElementById('section');
				section.innerHTML = data;
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
	<div style="float: left; width: 80px;  background-color: #FAFAFA;  height: 300px; display: inline; margin: 0 2%; padding-left: 120px; padding-top: 30px;" >

		<ul class="ulHostside">
			<li><a href="#" style="color: black" onclick="myhost()">예정된 모임</a></li>
			<li><a href="#" style="color: black" onclick="myhostend()">지나간 모임</a></li>
		</ul>
	</div>
</body>
</html>