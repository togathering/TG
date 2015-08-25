<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="tg/js/jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#qna').click(function(){
				$('#div1').fadeToggle();
				$.get('MboardQna.do', function(data, status){
					var table = document.getElementById('qList');
					table.innerHTML=data;
				});
			});
		});
		function qnaRequest(qnaNO) {
			location.href = 'MboardQna.do?qno='+qnaNO;
		}
	</script>
<body>
<div style="z-index: 2;"><tiles:insertAttribute name="adminHeader"/></div>
<div style="z-index: 2;"><tiles:insertAttribute name="adminBoard"/></div>
<table id="qList"></table>
</body>
</html>