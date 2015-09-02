<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function mygxgroup() {
		$.ajax({url: 'mygxgroup', type: 'POST', dataType: 'text', 
			success: function (data) {
				var section = document.getElementById('section');
				section.innerHTML = data;
			}
		});
	}
	
	function mygxgroupend() {
		$.ajax({url: 'mygxgroupEnd', type: 'POST', dataType: 'text', 
			success: function (data) {
				var section = document.getElementById('section');
				section.innerHTML = data;
			}
		});
	}
</script>


<title>Insert title here</title>
</head>
<body>
	<div style="float: left; width: 80px;  background-color: #FAFAFA; height:200px; display: inline; margin: 0 2%; padding-left: 120px; padding-top: 30px;" >

		<ul style="color: black;   list-style:none;  ">
			<li><a style="color: black; outline-color: pink;" onclick="mygxgroup()">예정된 모임</a></li>
			<li><a style="color: black" onclick="mygxgroupend()">지나간 모임</a></li>
		</ul>
	</div>
</body>
</html>