<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>nickname님의 프로필</title>
<style type="text/css">
	body { width:800px; margin:20px auto; background:#ddd;}
	.image { width:250px; height:250px; float:left; background:skyblue;}
	.profile {width:550px; height:200px; float:left; background:white;}
	.evaluate {width:550px; height:50px; float:left; background:white;}
	.tprofile {margin: 10px;}
	.tevaluate {margin: 10px;}
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
});
</script>
</head>
<body>
	<h3>${my.nick }(${my.id })님의 프로필</h3>
		<div class="image">
			<img src="upimg/kk.jpg" width="250px" height="250px">
		</div>
		
		<div class="profile">
			<table class="tprofile">
				<tr><td>성별</td><td id="gender">${my.gender }</td><td>생년월일</td><td id="birth">${my.birth }</td></tr>
				<tr><td>선호운동</td><td>${my.favo }</td><td>활동지역</td><td>${my.loc }</td></tr>
				<tr><td width="100px">인스타그램</td><td width="160px"><a href="https://${my.insta }">${my.insta }</a></td>
				<td width="100px">페이스북</td><td width="160px"><a>${my.fbook }</a></td></tr>
				<tr><td colspan="4">자기소개</td></tr>
				<tr><td colspan="4">${my.intro }</td></tr>
			</table>
		</div>
		<div class="evaluate">	
			<table class="tevaluate">
				<tr><td>신고당한 횟수</td><td>${count }회</td></tr>
			</table>
		</div>
</body>
</html>