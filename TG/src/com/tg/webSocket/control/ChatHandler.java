package com.tg.webSocket.control;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler{

		
	  private Map<String, WebSocketSession> users;
	  
	  public ChatHandler() {
		 users = new HashMap<String, WebSocketSession>();
	  }	
	
	@Override 	//웹소켓 클라이언트와 연결될때 호출
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		//WebSocketSession: 클라이언트와의 세션을 관리하는 객체
	       System.out.println("["+session.getId()+ "] 연결");
	       users.put(session.getId() , session);
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
	   String msg = message.getPayload();//텍스트 데이터 구하기
	   System.out.println("from["+session.getId()+"]: "+ msg);
	   for(WebSocketSession s : users.values()){
		 s.sendMessage(message);  
		 System.out.println(" ==> to["+session.getId()+"]: "+ msg);
	   }	  
	}
	
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
	  System.out.println("["+session.getId()+"]예외발생: "+ exception.getMessage());
	}

}
