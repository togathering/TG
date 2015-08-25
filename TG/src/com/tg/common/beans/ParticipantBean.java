package com.tg.common.beans;

public class ParticipantBean {
	int gno;
	String pid;
	int rownum;
	
	public ParticipantBean() {
	}

	public ParticipantBean(int gno, String pid, int rownum) {
		super();
		this.gno = gno;
		this.pid = pid;
		this.rownum = rownum;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	
	
	
}
