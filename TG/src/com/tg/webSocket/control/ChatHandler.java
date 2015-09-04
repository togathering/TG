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
	
	@Override 	//������ Ŭ���̾�Ʈ�� ����ɶ� ȣ��
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		//WebSocketSession: Ŭ���̾�Ʈ���� ������ �����ϴ� ��ü
		  
	       System.out.println("["+session.getId()+ "] ����");
	       System.out.println(id+"����");
	       
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
	   String msg = message.getPayload();//Ŭ���̾�Ʈ ������ �ؽ�Ʈ ������ ���ϱ�
	   
	   String msgs[] = msg.split("\\|");
	   
	   int protocol = Integer.parseInt(msgs[0]);
	   switch(protocol){
	     case 100://Ŭ���̾�Ʈ ����
	    	 //(String id, String nickName, WebSocketSession wSession)
	    	 users.put(id, new Service(id, nickName, session) );
	    	 //users.put(id , session); //Map�� session���
	    	 System.out.println("���");	    	 
	    	 break;
	    	 
	     case 200://�޽��� ����
	    	 System.out.println("map:"+ users);	    	 
	    	 nickName = msgs[1];
			 for(Service s : users.values()){
    		 //s.sendMessage(message);  
    		 //System.out.println(" ==> to["+session.getId()+"]: "+ msg);
    		 s.getwSession().sendMessage(new TextMessage("200|"+ nickName+"��"+msgs[2]));	    	 
			 }
			 break;
	  }	   
	   
	   System.out.println("from["+session.getId()+"]: "+ msg);
	}
	
	
	@Override
	public void handleTransportError(WebSocketSession session,
			Throwable exception) throws Exception {
	  System.out.println("["+session.getId()+"]���ܹ߻�: "+ exception.getMessage());
	}
	
}
