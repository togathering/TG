package com.tg.webSocket.beans;

import java.util.Date;
import java.util.Map;

public class Room {
	String rTitle;
	String rSession;
	int rVolumn;//�ο���
	String rHost;//���� ������
	Date rDate;//���� ���೯¥
		
	//���񽺰� ������  ��String key map 
	Map<String, Service> map;
	
	//service�ȿ� ������������ ä�ð��� �޼ҵ���� room������  ���ο� ���� ���񽺵��� 
	
	
	public Room(String rTitle, String rSession, int rVolumn,
			String rHost, Date rDate) {	
		this.rTitle = rTitle;
		this.rSession = rSession;
		this.rVolumn = rVolumn;
		this.rHost = rHost;
		this.rDate = rDate;
	}
}
