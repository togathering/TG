<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${my.nick }(${my.id })���� ������</title>
<style type="text/css">
	body { width:900px; margin:20px auto; background:#F2F2F2;}
	.image { width:350px; height:350px; float:left; background:white}
	.profile {width:548px; height:200px; float:right; background:#FDFDFD;}
	.comment {width:548px; height:200px; float:right; background:#FAFAFA;}
	.evaluate {width:350px; height:50px; float:left; background:#FDFDFD;}
	.tcomment {margin: 10px;}
	.tprofile {margin: 10px;}
	.tevaluate {margin: 12px;}
	.trcomment {padding: 3px; border-top: 1px solid llightgray;}
	.tevaluate td{width: 100px;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var gg = document.getElementById("gender");
	var bb = document.getElementById("birth");
		if('${my.gender}'=='F'){
			gg.innerHTML = "����";
		}else if('${my.gender}'=='M'){
			gg.innerHTML = "����";
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
		<div style="background-color: #D8D8D8; border: 1px solid lightgray; padding: 10px 5px; margin-top: 20px;">
			<h3>${my.nick }(${my.id })���� ������</h3>
		</div>
		<div style=" border: 1px solid lightgray; border-top: 0px; background-color: gray; font-size: 14px; height: 400px;">
		<div class="image" id ="pic">
			<img src="proimg/${my.pic }" width="350px" height="350px">
		</div>
		
		<div class="profile">
			<table class="tprofile">
				<tr><td>����</td><td id="gender">${my.gender }</td><td>�������</td><td id="birth">${my.birth }</td></tr>
				<tr><td>��ȣ�</td><td>${my.favo }</td><td>Ȱ������</td><td>${my.loc }</td></tr>
				<tr><td width="100px">�ν�Ÿ�׷�</td><td width="160px"><a onclick="window.open('${my.insta}', '', 'width=950, height=540, screenX=200, screenY=60');"  style="color: gray" >${my.insta }</a></td>
				<td width="100px">���̽���</td><td width="160px"><a onclick="window.open('${my.fbook }', '', 'width=950, height=540, screenX=200, screenY=60');"  style="color: gray" >${my.fbook }</a></td></tr>
				<tr><td colspan="4">�ڱ�Ұ�</td></tr>
				<tr><td colspan="4">${my.intro }</td></tr>
			</table>
		</div>
		<div class="comment">
			<table class="tcomment">
				<tr><td class="trcomment"><strong>������</strong></td></tr>
				<c:forEach  items='${review }' var='review' >
					<tr><td class="trcomment">${review.evaluate }</td></tr>
				</c:forEach>
			</table>
		</div>
		<div class="evaluate">	
			<table class="tevaluate">
				<tr><td><b>������</b></td><td>${grade }</td><td><b>�Ű�Ƚ��</b></td><td>${count }ȸ</td></tr>
			</table>
		</div>
		</div>
</body>
</html>