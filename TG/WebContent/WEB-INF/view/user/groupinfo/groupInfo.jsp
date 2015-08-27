<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/groupInfo.css">
<title>${bean.gtitle}</title>

<style type="text/css">
a:link{
	color: black; text-decoration: none;
}
a:visited{
	color: black; text-decoration: none;
}
a:hover{
	color: #0080FF; text-decoration: none;
}
</style>

<script src="https://maps.googleapis.com/maps/api/js?sensor=true"></script> 
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"> 
	var map;
	var geocoder;

	function initialize(){
		var latlng = new google.maps.LatLng(37.4060784, 127.1164218);
	 	var myOptions = {
		  	zoom: 17,
		  	center:latlng,
		  	mapTypeId: google.maps.MapTypeId.ROADMAP   
		};
	 
	 	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	 	geocoder =  new google.maps.Geocoder();
	 	
	 	
	 	var address = '${group.gloc}';
	 	/* var address = '경기도 성남시 분당구 삼평동'; */

        //지오코딩하는 부분입니다.
 		geocoder.geocode( 
 			{'address': address}, 
 			function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) { //Geocoding이 성공적이라면,
					for(var i=0;i<results.length;i++){
						map.setCenter(results[i].geometry.location);
		    			new google.maps.Marker(
		    				{
			     				center: results[i].geometry.location,
		    					position: results[i].geometry.location,
			    				map: map
		   					}
		    			)
		    			
		   			} 
		         //결과가 여러 개일 수 있기 때문에 모든 결과를 지도에 marker에 표시합니다.
		  		} else { 
		  			alert("위치를 찾을 수 없습니다 "); 
		  		}
 			}
 		);
	      
	}
</script>
<script type="text/javascript">
	function infoload(){
		var attend = document.getElementById('attend');
		var wish = document.getElementById('wish');
		var now = new Date();
		var year = 	now.getFullYear(); 
		var month = now.getMonth()+1; 
		var day = now.getDate(); 
		var groupday = "${group.gday}";
		var gday = groupday.split("-", 3); 
		var date = gday[2].split(" ");
		
		if('${join}'=='ok'){
			var newBt = '<button type="button" class="button" name="attend" onclick="joinOut()">참가중</button>';
			attend.innerHTML = newBt;				
			
		}else if(year == gday[0] && month == gday[1] && day >= date[0]){			
			var endBt = '<button type="button" class="button" name="attend" onclick="">모임종료</button>';
			attend.innerHTML = endBt;	

		}else if('${group.gmax}'=='${group.gsum}'){
			var endBt = '<button type="button" class="button" name="attend" onclick="endGx()">모집완료</button>';
			attend.innerHTML = endBt;		
			
		}else{			
			if('${group.ghost}'=='${id}'){				
				var delBt = '<button type="button" class="button" name="attend" onclick="delGroup()">모임삭제</button>';
				attend.innerHTML = delBt;
				
			}else{
				var resetBt = '<button type="button" class="button" name="attend" onclick="join()">참석</button>';
				attend.innerHTML = resetBt;				
			}
		}
		if('${wish}'=='ok'){
			var newWishBt = '<button type="button" class="button" name="wish" onclick="cancelWish()" style="width:120px;">원해요 취소</button>';
			wish.innerHTML = newWishBt;
		}else{
			var newCancelWish = '<button type="button" class="button" name="wish" onclick="wishGroup()">원해요</button>';
			wish.innerHTML = newCancelWish;
		}
	}
	
	function joinOut() {
		location.href='cancelJoin?gno=${param.gno}';
	}
	
	function delGroup() {
		location.href = 'delGroup?gno=${param.gno}';
	}
	
	function kick(kickId) {
		location.href = 'kickGroup?gno=${param.gno}&pid='+kickId;
	}
	
	function join() {
		if('${id}' == ''){
			alert("로그인 해주세요");
			return;
		}
		if('${tel}' == ''){
			alert("마이페이지에서 연락 가능한 전화번호를 입력해주세요");
			return;
		}
		
		var gsum = ${group.gsum};
		var gmax = ${group.gmax};
		if((gsum+1) <= gmax){	
			
			location.href=  'joingroup?gno=${param.gno}';			
		}else{
			alert("참여 가능 인원을 초과하였습니다");
		}
	}
	
	function wishGroup() {
		if('${id}' == ''){
			alert("로그인 해주세요");
			return;
		}
		
		location.href = 'wishgroup?gno=${param.gno}';
		
	}
	
	function cancelWish() {
		location.href = 'cancelWish?gno='+${param.gno};
	}
	
	function endGx(){
		alert("모집완료된 모임입니다");
	}
	
	var first = true;	
	var end = 5; 
	var size = 0;
	function loadReplyPage() {
		if(!first){
			end+=5;
		}		
		$.ajax({url:'loadReply', type:'POST', data:'end='+end+'&gno=${param.gno}', dataType:'text',
			success:function(data){
				printReplyPage(data);				
			}
		});
	}
	
	function addReply() {
		if('${id}' == ''){
			alert("로그인 해주세요");
			return;
		}else{
			end = 5;
			var param = 'content='+document.replyFrm.reply.value+'&gno=${param.gno}&end='+end; 
			/* sendRequest('addReply.do', param, printReplyPage, 'POST'); */
			$.ajax({url:'addReply', type:'POST', data: param, dataType:'text',
				success:function(data){
					printReplyPage(data);				
				}
			});
			document.replyFrm.reply.value='';
		}
	}
	
	function delReply(replyno) {		
		$.ajax({url:'delReply', type:'POST', data: 'gno=${param.gno}&no='+replyno+'&end='+end, dataType:'text',
			success:function(data){
				printReplyPage(data);
			}
		});
	}
	
	function upReply(replyno,idx) {
		var newReply = document.getElementById(idx).firstChild.firstChild.value;		
		$.ajax({url:'upReply', type:'POST', data: 'content='+newReply+'&no='+replyno+'&gno=${param.gno}&end='+end, dataType:'text',
			success:function(data){
				printReplyPage(data);
			}
		});
	}
	function cancelUP(idx) {
		document.getElementById(idx).firstChild.firstChild.value='';
		document.getElementById(idx).firstChild.style.display='none';
	}
	
	function showUpReply(idx,ctnt) {
		document.getElementById(idx).firstChild.firstChild.value=ctnt;
		document.getElementById(idx).firstChild.style.display='';
	}
	
	function printReplyPage(replyData) {
		
		
			if(!first){
				clearReply(document.getElementById('replyDiv'));
			}
			
			
			var div = document.getElementById('replyDiv');
			var replys = eval(replyData);
			
			for(var i=1;i<replys.length;i++){
				
				var newSpan = document.createElement('span');
				var newDiv = document.createElement('div');
				var btSpan = document.createElement('span');
				var newUpForm = document.createElement('div');
				newUpForm.setAttribute("id",i);
				var no = replys[i].no;
				var name = replys[i].name;
				var content = replys[i].content;
				var id = replys[i].id;
				
					
				var upbt = '<button class="sbutton" type="button" onclick="showUpReply('+i+',\''+content+'\')">수정</button>    ';
				var delbt = '<button class="sbutton" type="button" onclick="delReply('+no+')">삭제</button><br><br>';

					
				var upForm = '<form name="UpFrm'+i+'" style="display: none">';
				upForm +=	'<textarea rows="5" cols="30" name="upreply'+i+'" id="upreply'+i+'"></textarea><br>';
				upForm +=	'<button  class="sbutton" type="button" name="bt'+i+'" onclick="upReply('+no+','+i+')">수정완료</button>    ';
				upForm += '<button  class="sbutton" type="button" name="bt'+i+'" onclick="cancelUP('+i+')">수정취소</button></form>';
				newSpan.innerHTML = name;
				newDiv.innerHTML = content;
				btSpan.innerHTML = upbt+delbt;
				newUpForm.innerHTML = upForm;
				div.appendChild(newSpan);
				div.appendChild(newDiv);
				if('${id}'==id){
					div.appendChild(btSpan);
					div.appendChild(newUpForm);						
				}
				if('${id}'==id)
				size=replys[0].size;
			}
			
			first = false;
		
		
	}
	
	function clearReply(replyDiv) {
		while (replyDiv.hasChildNodes()) {
			replyDiv.removeChild(replyDiv.lastChild);
		}
	}
	
	function loadFriend(gno) {
		window.open('myFriendList?page=invite&gno='+gno, '', 'width=300, height=400');
		
	}
	
	
	$(document).ready(function(){
		if('${id}'!=''){
			document.getElementById('invite').style.display = '';
		}
		
		if('${group.goption}' == '방장권한부여'){
			if('${group.ghost}'=='${id}'){
				var bts = document.getElementsByName('kickBt');
				for(var i=0;i<bts.length;i++){
					bts.item(i).style.display = '';					
				}
			}
		}
		
		loadReplyPage();
		infoload();
		initialize();
	});
	
</script>
</head>
<body>
<!-- 헤더시작 -->		
	<div style="z-index: 2;">
		<tiles:insertAttribute name="header" />
	</div>
<!-- 헤더끝 -->		
<!-- 상단 이미지+요약내용 -->
	<div>
		<h2 align="center">모임명 : ${group.gtitle}</h2><h3>${group.goption }</h3>
		<h3 align="center">ToGat	hering</h3>
		<hr>
		<!-- 	이미지삽입 -->
		<div style="padding:5px 1% 5px 10%; float: left; width:39%; height: 400px;">
			<img alt="" src="upimg/${group.gimg}" style="min-width: 45%; height: auto;">
		</div>
		<!-- 요약내용 -->			
		<div style="padding:5px 8% 5px 3%; float:right; width:39%; height: 400px;">		
			<div>
				<br>
				<p> < ${group.gtitle} > </p>
				<br>
				<p>모임의 모임일은 ${group.gday}입니다.</p>
				<br>
				<p>최소인원은 ${group.gmin}명 이고 최대인원은 ${group.gmax}명 입니다.</p>
				<br>
				<p>그리고 현재 참석인원은 ${group.gsum}명 입니다.</p>
			</div>
			<br>
			<form style="align:center;">
				<span id="attend"><button type="button" class="button"  name="attend" onclick="join()">참석</button></span>
				<span id="wish"><button type="button"  class="button" name="wish" onclick="wishGroup()">원해요</button></span>
				<span id="encore"><button type="button" name="encore" hidden="">앵콜</button></span><br>
				<span><button type="button" style="display: none" class="button" id="invite" name="invite" value="친구초대" onclick="loadFriend(${group.gno})">친구초대</button></span>
			</form>
		</div>
	</div>
	<!-- 상단 이미지+요약내용 끝-->
			<!-- 참가인원 시작 -->
			<div>
				<h2>참가인원들</h2>
				<table>
					<tr>
						<td width="100px"><a onclick="window.open('profile?id=${group.ghost }', '', 'width=850, height=350, screenX=200, screenY=100');"  style="color: red" >${group.ghost }</a></td>
						<td width="100px">그룹 호스트</td>
					</tr>
					<c:forEach  items='${joinlist}' var='list' >
						<tr>
							<td><a href="javascript:void(0)" onclick="window.open('profile?id=${list.pid}', '', 'width=850, height=350, screenX=200, screenY=100');" style="color: blue">${list.pid }</a></td>
							<td><input type="button" value="추방" style="display: none" name="kickBt" onclick="kick('${list.pid}')"></td>
						</tr>						
					</c:forEach>
				</table>
			</div><!-- 참가인원끝 -->
			
	<!-- 상세내용 -->
	<div>
		<h4 align="center">모임명</h4>
		<h2 align="center"> ${group.gtitle} </h2>
		<h4 align="center">모임 소개</h4><br>
	</div>
		<div style="border: 0px solid black; width: 80%;  margin: 1% auto; text-align:center; LINE-HEIGHT: 120%;
					padding-top: 10px; padding-bottom: 10px; ">
			<pre style="width:100%; background-color: #d9d9d9; margin: 0 auto; padding: 2% 1%;" >
				${group.gintro}
			</pre>
		</div>
		
		<!-- 태그표시 -->
		<div>
			<h3>태그</h3>
			<c:forEach var="tag" items="${tags}">
				<a href="tagResult?tag=${tag}">#${tag}</a>&nbsp 
			</c:forEach>
		</div>
			<hr>	
		<!-- 지도 -->
		<div style="width:80%;  margin: 1% auto;">
		<div id="map_canvas"style="width:100%; margin: 0 auto; padding: 2% 1%; height:450px;"></div>
		</div>
		<!-- 댓글 -->
		<hr>
		<div style="margin: 10px auto; width:80%;">
		<h3>댓글</h3>
		<div id="replyDiv"></div>
			<form style="margin:10px auto; width:100%" name="replyFrm">
				<textarea rows="5" name="reply" id="reply" style="width: 80%;"></textarea>
				<br>
				<button type="button" class="button" onclick="addReply()" style="width: 100px;">등록</button>
			</form>
				<br>
			<button type="button" class="button" onclick="loadReplyPage()" style="width: 110px; border-radius:1.5em 1.5em 1.5em 1.5em;">댓글더보기</button>
		</div>
	<!-- 하단footer -->
	<div style="position: relative; top: 30px">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>