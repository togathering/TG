<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TG:ä��</title>
<style type="text/css">
   #chatArea{
     width:600px; height: 300px; overflow-y:auto; border: 1px solid gray;  background-color: white;
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
    		if(parseInt(arr[0])==0) alert('������ ������ �����ϴ�!!');
    		else{
    			
    		  var titles = arr[1].split('��');
    		  var titleDiv="";
    		  for(var i=0; i<titles.length; i++){
    			  titleDiv+="<div>"+titles[i]+"</div>";
    		  }
    		 
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
    
    function onOpen(evt){ //��ȭ������
      appendMsg("����Ǿ����ϴ�.");
      wsocket.send('100|${id}'); //������ 100      
    }
    
    function onMessage(evt){//�������� �޽����� ������ ����
      var data = evt.data;
      if(data.substring(0,4)=='200|'){
    	appendMsg(data.substring(4));
      }
    }
    
    function onClose(evt){
    	appendMsg('������ �������ϴ�.');
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
      
      // ��ũ���� �� ������ �����ִ� ���
      var chatHeight = $('#chatArea').height();      
      var maxScroll = $('#chatMsg').height() - chatHeight;
      $('#chatArea').scrollTop(maxScroll);
    }
    
    $(document).ready(function(){
      $('#message').keypress(function(event){
        var keyCode = (event.keyCode? event.keyCode: event.which); 
        //���� event.keyCode �� ���� �ȵǴ� �������� ���� ����ó��
        if(keyCode=='13'){
        	send();
        }
        event.stopPropagation(); //�̺�Ʈ�� ���� ����
      });
      $('#sendBtn').click(function(){send();});
      $('#enterBtn').click(function(){connect();});
      $('#exitBtn').click(function(){disconnect();});
    });
  </script>
 
</head>
<body style="background-color: #FAFAFA;">
		<div style="z-index: 2;"><tiles:insertAttribute name="header"/></div>
		
<div style="margin-left: 370px; padding-top:30px; width: 650px;" >

		  <input type="button" class="sbutton" id="enterBtn" value="����">
		  <input type="button" class="sbutton" id="exitBtn" value="������">
		  <h4 style="padding: 20px 0;">ä������ ���� �߸´� ����� ã�ƺ���</h4>
		  <div id="chatArea">
		  <div id="chatMsg"></div></div>
		  <br>
		  <input type="text" class="search" id="message" placeholder="�ϰ���� ���� ���� ���۹�ư�� Ŭ��~!!" style="font-size:13px; height: 12px; width:486px; border: 1px solid gray; color: gray;">
		  <input type="button" class="sbutton" id="sendBtn" value="����" style="height: 35px; border: 1px solid lightgray;">
		
		
</div>
<!-- <div style="float: left; width: 45%" >
    <h3>�������Ӹ�</h3>
    <div id="titles"></div>
    

</div> -->
		
		<div style="position: relative; top: 50px"><tiles:insertAttribute name="footer"/></div>
</body>
</html>