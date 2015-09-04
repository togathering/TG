<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TG:채팅</title>
<style type="text/css">
   #chatArea{
     width:400px; height: 100px; overflow-y:auto; border: 1px solid black;  
   }
 </style>
 <script type="text/javascript" src="js/jquery.js"></script>
 <script type="text/javascript">
 
    var wsocket;
    
    
    
    function connect(){
       $.ajax({
    	 url:'chatId',
    	 data:{id:'${id}',nick:'${nick}'},
    	 type:'post',
    	 success:function(data){
    		var arr = data.split("|");
    		if(parseInt(arr[0])==0) alert('참여한 모임이 없습니다!!');
    		else{
    			alert(arr[1])
    		  var titles = arr[1].split('§');
    		  var titleDiv="";
    		  for(var i=0; i<titles.length; i++){
    			  titleDiv+="<div>"+titles[i]+"</div>";
    		  }
    		  alert(titleDiv);
    		  var titles = document.getElementById("titles");
    		  titles.innerHTML=titleDiv;
    		}
    	 }
      }); 	
    	
      wsocket = new WebSocket('ws://192.168.7.188/TG/TG-chat');
     
      wsocket.onopen = onOpen;
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;
    }

    function disconnect(){
      wsocket.close();
    }
    
    function onOpen(evt){ //대화방입장
      appendMsg("연결되었습니다.");
      wsocket.send('100|${id}'); //서버에 100      
    }
    
    function onMessage(evt){//서버에서 메시지를 받으면 실행
      var data = evt.data;
      if(data.substring(0,4)=='200|'){
    	appendMsg(data.substring(4));
      }
    }
    
    function onClose(evt){
    	appendMsg('연결을 끊었습니다.');
    }
    
    function send(){
      //var nickname = $('#nickname').val();
      var nickname= '${nick}';
      var msg = $('#message').val();
      wsocket.send('200|'+ nickname+'|'+msg);
      $('#message').val("");
    }
    
    function appendMsg(msg){
      $('#chatMsg').append(msg+'<br>');
      
      // 스크롤을 맨 밑으로 내려주는 기능
      var chatHeight = $('#chatArea').height();      
      var maxScroll = $('#chatMsg').height() - chatHeight;
      $('#chatArea').scrollTop(maxScroll);
    }
    
    $(document).ready(function(){
      $('#message').keypress(function(event){
        var keyCode = (event.keyCode? event.keyCode: event.which); 
        //만약 event.keyCode 가 적용 안되는 브라우저에 대한 예외처리
        if(keyCode=='13'){
        	send();
        }
        event.stopPropagation(); //이벤트의 전이 방지
      });
      $('#sendBtn').click(function(){send();});
      $('#enterBtn').click(function(){connect();});
      $('#exitBtn').click(function(){disconnect();});
    });
  </script>
 
</head>
<body>
		<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
		
<div style="margin-left: 300px; width: 45%" >

		  <input type="button" id="enterBtn" value="입장">
		  <input type="button" id="exitBtn" value="나가기">
		  <h3>나와 잘맞는 사람을 찾아봐요</h3>
		  <div id="chatArea">
		  <div id="chatMsg"></div></div>
		  <br>
		  <input type="text" id="message">
		  <input type="button" id="sendBtn" value="전송">
		
		
</div>
<!-- <div style="float: left; width: 45%" >
    <h3>참가모임명</h3>
    <div id="titles"></div>
    

</div> -->
		
		<div style="position: relative; top: 330px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>