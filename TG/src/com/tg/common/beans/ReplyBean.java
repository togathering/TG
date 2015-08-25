package com.tg.common.beans;

public class ReplyBean {
	private int gno;
	private int no;
	private String id;
	private String name;
	private String content;
	
	public ReplyBean() {
		
	}

	public ReplyBean(int gno, int no, String id, String name, String content) {
		this.gno = gno;
		this.no = no;
		this.id = id;
		this.name = name;
		this.content = content;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
}
