package com.tg.common.beans;

import java.sql.Date;

public class WishBean {
	private int gno;
	private String id;
	private Date wdate;
	
	public WishBean() {
		
	}
	
	public WishBean(int gno, String id, Date wdate) {
		super();
		this.gno = gno;
		this.id = id;
		this.wdate = wdate;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	
}
