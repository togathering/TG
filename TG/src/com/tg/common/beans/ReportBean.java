package com.tg.common.beans;

import java.sql.Date;

public class ReportBean {
	private int no;
	private String reporter;
	private String accused;
	private String category;
	private String content;
	private Date rdate;
	private String status;
	
	public ReportBean() {
	}

	public ReportBean(int no, String reporter, String accused, String category,
			String content, Date rdate, String status) {
		super();
		this.no = no;
		this.reporter = reporter;
		this.accused = accused;
		this.category = category;
		this.content = content;
		this.rdate = rdate;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getAccused() {
		return accused;
	}

	public void setAccused(String accused) {
		this.accused = accused;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
