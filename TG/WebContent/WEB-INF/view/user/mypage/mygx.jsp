<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- <link rel="stylesheet" type="text/css" href="css/list.css">
<link rel="stylesheet" type="text/css" media="all" href="css/styleMy.css"> -->
<title>Today, ToGathering, Together</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function cancelGx(gno) {
		location.href = 'gxcancel?gno='+gno;
	}
	
	function review(gno) {
		window.open('openReview?gno='+gno, '', 'width=450, height=600, screenX=450, screenY=50');
	}
	
	
	$(document).ready(function(){		
		mygxgroup();		
	 });
</script>

</head>
<body>
		<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div><tiles:insertAttribute name="myPageHeader"/></div>
	<div><tiles:insertAttribute name="gxSide"/></div>
	<section class="listings" id="section">
		
	</section> <!--  end listing section  -->
	<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>