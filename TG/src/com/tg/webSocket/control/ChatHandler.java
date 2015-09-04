package com.tg.webSocket.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.tg.webSocket.beans.Room;
import com.tg.webSocket.beans.Service;

public class ChatHandler extends TextWebSocketHandler{

	private Map<String, Service> users;
	
	
	private String id;
	private String nickName;
    

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setId(String id) {
		this.id = id;
	}

	  public ChatHandler() {
		 users = new HashMap<String, Service>();
	  }	
	
	@Override 	//웹소켓 클라이언트와 연결될때 호출
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		//WebSocketSession: 클라이언트와의 세션을 관리하는 객체
		  
	       System.out.println("["+session.getId()+ "] 연결");
	       System.out.println(id+"접속");
	       
	}
	
	
	
	@Override //웹소켓 클라이언트와 종료될때 호출
	 public void afterConnectionClosed(WebSocketSession session,
					org.springframework.web.socket.CloseStatus status) throws Exception {
		 System.out.println("["+session.getId()+ "] 연결종료");
		 users.remove(session.getId());
	}
	
	@Override //웹소켓 클라이언트가 텍스트메시지를 전송할 때 호출
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
	   String msg = message.getPayload();//클라이언트 보내는 텍스트 데이터 구하기
	   
	   String msgs[] = msg.split("\\|");
	   
	   int protocol = Integer.parseInt(msgs[0]);
	   switch(protocol){
	     case 100://클라이언트 입장
	    	 //(String id, String nickName, WebSocketSession wSession)
	    	 users.put(id, new Service(id, nickName, session) );
	    	 //users.put(id , session); //Map에 session등록
	    	 System.out.println("등록");	    	 
	    	 break;
	    	 
	     case 200://메시지 전송
	    	 System.out.println("map:"+ users);	    	 
	    	 nickName = msgs[1];
			 for(Service s : users.values()){
    		 //s.sendMessage(message);  
    		 //System.out.println(" ==> to["+session.getId()+"]: "+ msg);
    		 s.getwSession().sendMessage(new TextMessage("200|"+ nickName+"▷"+msgs[2]));	    	 
			 }
			 break;
	  }	   
	   
	   System.out.println("from["+session.getId()+"]: "+ msg);
	}
	
	
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
	  System.out.println("["+session.getId()+"]예외발생: "+ exception.getMessage());
	}
	
}
