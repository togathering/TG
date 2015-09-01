<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${my.nick }���� ������</title>
<style type="text/css">
	body { width:900px; margin:20px auto; background:#ddd;}
	.image { width:350px; height:350px; float:left; background:skyblue;}
	.profile {width:550px; height:200px; float:right; background:skyblue;}
	.comment {width:550px; height:250px; float:right; background:pink;}
	.evaluate {width:350px; height:100px; float:left; background:orange;}
	.tcomment {margin: 10px;}
	.tprofile {margin: 10px;}
	.tevaluate {margin: 18px;}
	.trcomment {padding: 5px;}
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
});
</script>
</head>
<body>
	<h3>${my.nick }���� ������</h3>
		<div class="image">
			<img src="upimg/kk.jpg" width="350px" height="350px">
		</div>
		
		<div class="profile">
			<table class="tprofile">
				<tr><td>����</td><td id="gender">${my.gender }</td><td>�������</td><td id="birth">${my.birth }</td></tr>
				<tr><td>��ȣ�</td><td>${my.favo }</td><td>Ȱ������</td><td>${my.loc }</td></tr>
				<tr><td width="100px">�ν�Ÿ�׷�</td><td width="160px"><a>${my.insta }</a></td>
				<td width="100px">���̽���</td><td width="160px"><a>${my.fbook }</a></td></tr>
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
				<tr><td>������</td><td></td></tr>
				<tr><td>�Ű�Ƚ��</td><td></td></tr>
			</table>
		</div>
</body>
</html>