package com.tg.common.beans;

import java.sql.Date;

public class NoteBean {
	private String senderId;
	private String receiverId;
	private String noteTitle;
	private String noteContent;
	private Date noteDate;
	private int noteNo;
	
	// 奄沙持失切 持失
	public NoteBean() {}
	

	public NoteBean(String senderId, String receiverId, String noteTitle,
			String noteContent, Date noteDate, int noteNo) {

		this.senderId = senderId;
		this.receiverId = receiverId;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.noteDate = noteDate;
		this.noteNo = noteNo;
	}

	public int getNoteNo() {
		return noteNo;
	}

	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}

	// setter, getter 五社球 () 持失
	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Date getNoteDate() {
		return noteDate;
	}
	
	public void setNoteDate(Date noteDate) {
		this.noteDate = noteDate;
	}
	
}
