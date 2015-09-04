package com.tg.webSocket.beans;

import java.util.Date;
import java.util.Map;

public class Room {
	String rTitle;
	String rSession;
	int rVolumn;//인원수
	String rHost;//모임 개설자
	Date rDate;//모임 진행날짜
		
	//서비스가 들어가야함  ㄴString key map 
	Map<String, Service> map;
	
	//service안에 소켓정보부터 채팅관련 메소드들이 room안으로  개인에 대한 서비스들이 
	
	
	public Room(String rTitle, String rSession, int rVolumn,
			String rHost, Date rDate) {	
		this.rTitle = rTitle;
		this.rSession = rSession;
		this.rVolumn = rVolumn;
		this.rHost = rHost;
		this.rDate = rDate;
	}
}
