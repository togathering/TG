<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title><script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function myhost() {
		$.ajax({url: 'myhost', type: 'POST', dataType: 'text', 
			success: function (data) {
				/* alert(data); */
				var listings = document.getElementById('listings');
				listings.innerHTML = data;
			}
		});
	}
	
	function myhostEnd() {
		$.ajax({url: 'myhostEnd', type: 'POST', dataType: 'text', 
			success: function (data) {
				alert(data);
				var listings = document.getElementById('listings');
				listings.innerHTML = data;
			}
		});
	}
</script>
</head>
<body>
	<div style="float: left; width: 15%;  background-color: #F2F2F2; display: inline; margin: 0 2%; padding-left: 170px; padding-top: 20px;" >

		<ul style="color: black; background-color: pink;  list-style:none; background-color: #F2F2F2;">
			<li><a href="qna" style="color: black;" onclick="myhost()">문의하기</a></li>
			<li><a href="qnaList?" style="color: black" onclick="myhostEnd()">나의 문의내역</a></li>
		</ul>
	</div>
</body>
</html>