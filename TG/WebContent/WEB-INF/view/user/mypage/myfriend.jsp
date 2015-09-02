<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<link rel="stylesheet" type="text/css" href="css/tgBoard.css">
<link rel="stylesheet" type="text/css" href=css/search.css>

<title>친구목록</title>
</head>
<body style="background-color: #FAFAFA">
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="myPageHeader"/>
	</div>
	<div><tiles:insertAttribute name="friendSide"/></div>
	<!-- <div align="center">
		<h2>마이 프렌드</h2>
		<hr>
	
		<h3>친구수락하기</h3>
		<br>
		<table class="board_table">
			<tr class="boardth">
				<th width="50%">I D</th>
				<th width="25%">닉네임</th>
				<th width="25%">수락/거절</th>
			</tr>
		</table>
		<table  class="board_table" id="reqTable">
			
		</table>
		<hr>
		<h3 align="center">내친구들</h3>
		<br>
		<table class="board_table">
			<tr class="boardth">
				<th width="220px">I D</th>
				<th width="150px">닉네임</th>
				<th width="80px">쪽지</th>
				<th width="80px">친구삭제</th>
			</tr>
		</table>
		<table class="board_table" id="friendTable">
		
		</table>
	
	</div> -->
	<section class="listings" id="section">
	</section> <!--  end listing section  -->
	<div style="position: relative; top: 230px">
		<tiles:insertAttribute name="footer" />
	</div>	
</body>
</html>