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

 
<title>ToGathering : �츮��ó�� ����ϰ�</title>
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
			<h2 class="caption" >ȯ���մϴ�!</h2>
			<h3 class="properties">������ ��� ����ϴ� Ȱ���ε��� ��Ư�� ���ӿ� ������ ������.</h3>			
		</section>
		<section>
			<form class="frm" name="frm" action="groupsearch">
				<input type="text" class="search" placeholder="�˻� ���" name="search">
				<button type="submit" class="button" name="join_bt" >���� �˻�</button>
			</form>
		</section>	
	</section>
	<video id="video-background" src="img/video.mp4" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
	</video>
	
	
	<!--hero ��   //  list ����  -->
	
	<section class="listings">
	<div class="wrapper">
		<h3 style="display: none" id="h3">�̷� ������ ��Ű���</h3>
		<ul class="properties_list" id="recomList">
		
		</ul>
		<h3>�� �������� ����ǿ�</h3>
		<ul class="properties_list" id="list">
			
		</ul>
	</div>
	</section>	<!--  end listing section  -->
<div><tiles:insertAttribute name="footer"/></div>
</body>
</html>