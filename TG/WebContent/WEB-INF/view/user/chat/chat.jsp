<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
   #chatArea{
     width:200px; height: 100px; overflow-y:auto; border: 1px solid black;  
   }
 </style>
 <script type="text/javascript" src="js/jquery.js"></script>
 <script type="text/javascript">
 
    var wsocket;
    
    function connect(){
      wsocket = new WebSocket('ws://192.168.7.24/SpringMybatis2/chat-ws');
      wsocket.onopen = onOpen;
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;
    }

    function disconnect(){
      wsocket.close();
    }
    
    function onOpen(evt){
    	appendMsg("����Ǿ����ϴ�.");
    }
    
    function onMessage(evt){//�������� �޽����� ������ ����
      var data = evt.data;
      if(data.substring(0,4)=='msg:'){
    	appendMsg(data.substring(4));
      }
    }
    
    function onClose(evt){
    	appendMsg('������ �������ϴ�.');
    }
    
    function send(){
      var nickname = $('#nickname').val();
      var msg = $('#message').val();
      wsocket.send('msg:'+nickname+"��"+ msg);
      $('#message').val("");
    }
    
    function appendMsg(msg){
      $('#chatMsg').append(msg+'<br>');
      var chatHeight = $('#chatArea').height();      
      var maxScroll = $('#chatMsg').height() - chatHeight;
      $('#chatArea').scrollTop(maxScroll);
    }
    
    $(document).ready(function(){
      $('#message').keypress(function(event){
        var keyCode = (event.keyCode? event.keyCode: event.which);
        if(keyCode=='13'){
        	send();
        }
        event.stopPropagation();
      });
      $('#sendBtn').click(function(){send();});
      $('#enterBtn').click(function(){connect();});
      $('#exitBtn').click(function(){disconnect();});
    });
  </script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TG:ä��</title>
</head>
<body>
		<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
		
				�̸�: <input type="text" id="nickname">
		  <input type="button" id="enterBtn" value="����">
		  <input type="button" id="exitBtn" value="������">
		  <h3>��ȭ����</h3>
		  <div id="chatArea"><div id="chatMsg"></div></div>
		  <br>
		  <input type="text" id="message">
		  <input type="button" id="sendBtn" value="����">
		
		
		<div style="position: relative; top: 30px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>