<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function myhost() {
		$.ajax({
			url : 'myhost',
			type : 'POST',
			dataType : 'text',
			success : function(data) {
				alert(data);
				var listings = document.getElementById('listings');
				listings.innerHTML = data;
			}
		});
	}
	/*
	function myhostEnd() {
		$.ajax({url: 'myhostEnd', type: 'POST', dataType: 'text', 
			success: function (data) {
				alert(data);
				var listings = document.getElementById('listings');
				listings.innerHTML = data;
			}
		});
	} */
</script>
<style type="text/css">
.ulFaq {
	color: black;
	background-color: lightgray;
	list-style: none;
	width: 200px
}

.ulFaq li {
	margin: 10px 0;
	padding: 5px 10px;
}
.ulFaq li a{
	color: black
}
</style>
</head>
<body>
	<div style="float:left; width: 200px; height: 200px; display: inline; margin: 0 2%; padding-left: 50px; ">
		<ul class="ulFaq">
			<li><a href="faqStart">시작하기</a></li>
			<li><a href="faqJoin">참여하기</a></li>
			<li><a>모임생성</a></li>
			<li><a>모임개설자</a></li>
			<li><a>계정설정</a></li>
			<li><a>기타</a></li>
		</ul>
	</div>
</body>
</html>