<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style> 
#cont, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#cont {
    padding: 50px;
    display: none;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.get('qnaRe?answer=y', function(data, status){
			var table = document.getElementById('qList');
			table.innerHTML=data;
	});
	$("#title").click(function(){
        $("#con").slideDown("slow");
    });
	$('button').click(function(){
		alert("버튼되라");
        $("#cont").slideDown("slow");
    });
		
});

</script>
</head>
<body>
<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div><br><br>
	<div>	<tiles:insertAttribute name="myPageHeader"/></div><br><br>
	<div style="position: relative;"><tiles:insertAttribute name="qnaSide"/></div>
		<form action="" style=" ">
			<h3>문의내역</h3>
			<table id="qList"></table>
			<div id="cont">hello</div>
			
		</form>
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>