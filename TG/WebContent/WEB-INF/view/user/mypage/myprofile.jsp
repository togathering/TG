<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${my.nick }(${my.id })님의 프로필</title>
<style type="text/css">
	.form{margin-left: 500px}
	.image { width:350px; height:350px;  background:skyblue;}
	.profile {width:550px; height:200px;  background:skyblue;}
	.comment {width:550px; height:200px; background:pink;}
	.evaluate {width:350px; height:50px;  background:orange;}
	.tcomment {margin: 10px;}
	.tprofile {margin: 10px;}
	.tevaluate {margin: 12px;}
	.trcomment {padding: 3px;}
	.tevaluate td{width: 100px;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var gg = document.getElementById("gender");
	var bb = document.getElementById("birth");
		if('${my.gender}'=='F'){
			gg.innerHTML = "여자";
		}else if('${my.gender}'=='M'){
			gg.innerHTML = "남자";
		}else{
			gg.innerHTML = "";
		}
		if('${my.birth }' != ''){
			var birthday = '${my.birth }'.split(" ", 2);
			bb.innerHTML = birthday[0];
		}
		if('${my.pic }' == ''){
			var pic = document.getElementById("pic");
			var img = '<img src="proimg/basicPic.jpg" width="350px" height="350px">';
			pic.innerHTML = img;
		}
});
</script>
</head>
<body>
	<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
	<div><tiles:insertAttribute name="myPageHeader"/></div>
	<form action="" class="form">
	<h3>${my.nick }(${my.id })님의 프로필</h3>
		<div class="image" id ="pic">
			<img src="proimg/${my.pic }" width="350px" height="350px">
		</div>
		
		<div class="profile">
			<table class="tprofile">
				<tr><td>성별</td><td id="gender">${my.gender }</td><td>생년월일</td><td id="birth">${my.birth }</td></tr>
				<tr><td>선호운동</td><td>${my.favo }</td><td>활동지역</td><td>${my.loc }</td></tr>
				<tr><td width="100px">인스타그램</td><td width="160px"><a>${my.insta }</a></td>
				<td width="100px">페이스북</td><td width="160px"><a>${my.fbook }</a></td></tr>
				<tr><td colspan="4">자기소개</td></tr>
				<tr><td colspan="4">${my.intro }</td></tr>
			</table>
		</div>
		<div class="comment">
			<table class="tcomment">
				<tr><td class="trcomment"><strong>한줄평가</strong></td></tr>
				<c:forEach  items='${review }' var='review' >
					<tr><td class="trcomment">${review.evaluate }</td></tr>
				</c:forEach>
			</table>
		</div>
		<div class="evaluate">	
			<table class="tevaluate">
				<tr><td><b>평가점수</b></td><td>${grade }</td><td><b>신고횟수</b></td><td>${count }회</td></tr>
			</table>
		</div>
	</form>
		<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>