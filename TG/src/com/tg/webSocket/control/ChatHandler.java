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
	
	@Override 	//������ Ŭ���̾�Ʈ�� ����ɶ� ȣ��
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		//WebSocketSession: Ŭ���̾�Ʈ���� ������ �����ϴ� ��ü
	       System.out.println("["+session.getId()+ "] ����");
	       users.put(session.getId() , session);
	}
	
	@Override //������ Ŭ���̾�Ʈ�� ����ɶ� ȣ��
	 public void afterConnectionClosed(WebSocketSession session,
					org.springframework.web.socket.CloseStatus status) throws Exception {
		 System.out.println("["+session.getId()+ "] ��������");
		 users.remove(session.getId());
	}
	
	@Override //������ Ŭ���̾�Ʈ�� �ؽ�Ʈ�޽����� ������ �� ȣ��
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
	   String msg = message.getPayload();//�ؽ�Ʈ ������ ���ϱ�
	   System.out.println("from["+session.getId()+"]: "+ msg);
	   for(WebSocketSession s : users.values()){
		 s.sendMessage(message);  
		 System.out.println(" ==> to["+session.getId()+"]: "+ msg);
	   }	  
	}
	
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
	  System.out.println("["+session.getId()+"]���ܹ߻�: "+ exception.getMessage());
	}

}
