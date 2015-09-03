<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/search.css">

 
<title>ToGathering : 우리집처럼 편안하게</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">


	function loadlist() {
		$.ajax({url:"mainlist", type:"POST", dataType:"text",
			success:function(data){
				var list = document.getElementById('list');
				list.innerHTML = data;
			}
		});
	}
	
	function loadRecom() {
		$.ajax({url:"recommend", type:"POST", dataType:"text",
			success:function(data){
				var recomList = document.getElementById('recomList');
				document.getElementById('h3').style.display = '';
				recomList.innerHTML = data;
			}
		});
	}
	
	function gogroupinfo(gno){
		location.href = 'groupinfo?gno='+gno;
	}
	
	$(document).ready(function() {
		loadlist();
		if('${newbie}'=='nonewbie'){
			loadRecom();
		}
	});
</script>
</head>

<body>
<div><tiles:insertAttribute name="header"/></div>
	<section class="hero" >
		<section class="caption">
			<h2 class="caption" >환영합니다!</h2>
			<h3 class="properties">전국의 운동을 사랑하는 활력인들의 독특한 모임에 참여해 보세요.</h3>			
		</section>
		<section>
			<form class="frm" name="frm" action="groupsearch">
				<input type="text" class="search" placeholder="검색 고고" name="search">
				<button type="submit" class="button" name="join_bt" >모임 검색</button>
			</form>
		</section>	
	</section>
	<video id="video-background" src="img/video.mp4" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
	</video>
	
	
	<!--hero 끝   //  list 시작  -->
	
	<section class="listings">
	<div class="wrapper">
		<h3 style="display: none" id="h3">이런 모임은 어떠신가요</h3>
		<ul class="properties_list" id="recomList">
		
		</ul>
		<h3>얼마 안있으면 종료되요</h3>
		<ul class="properties_list" id="list">
			
		</ul>
	</div>
	</section>	<!--  end listing section  -->
<div><tiles:insertAttribute name="footer"/></div>
</body>
</html>