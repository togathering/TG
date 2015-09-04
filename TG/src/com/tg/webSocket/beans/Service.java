package com.tg.webSocket.beans;

import org.springframework.web.socket.WebSocketSession;

public class Service {
	private String id;
	private String nickName;
	private WebSocketSession wSession ;
	private Room room;
	
	public Service(String id, String nickName, WebSocketSession wSession) {
		this.id = id;
		this.nickName = nickName;
		this.wSession = wSession;	
	}
	
	public String getId() {
		return id;
	}
	public String getNickName() {
		return nickName;
	}
	public WebSocketSession getwSession() {
		return wSession;
	}
	public Room getRoom() {
		return room;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
}
