package com.tg.common.beans;

import java.sql.Date;

public class QnaBean {
	private int qno;
	private String id;
	private String qtitle;
	private String qcont;
	private String tel;
	private Date qdate;
	private String rcont;
	private Date rdate;
	private String qstatus;

	public QnaBean() {
	
	}

	public QnaBean(int qno, String id, String qtitle, String qcont, String tel,
			Date qdate, String rcont, Date rdate, String qstatus) {
		super();
		this.qno = qno;
		this.id = id;
		this.qtitle = qtitle;
		this.qcont = qcont;
		this.tel = tel;
		this.qdate = qdate;
		this.rcont = rcont;
		this.rdate = rdate;
		this.qstatus = qstatus;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcont() {
		return qcont;
	}

	public void setQcont(String qcont) {
		this.qcont = qcont;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public String getRcont() {
		return rcont;
	}

	public void setRcont(String rcont) {
		this.rcont = rcont;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getQstatus() {
		return qstatus;
	}

	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}

	
}
