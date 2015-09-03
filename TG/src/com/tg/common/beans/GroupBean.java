package com.tg.common.beans;

public class GroupBean {
	private int gno; // not null
	private String ghost; // not null
	private String gtitle; // not null
	private String gloc; // not null
	private String gintro; // not null
	private String gday; // not null
	private int gmax; // not null
	private int gmin; // not null
	private int gsum;
	private String gimg;
	private String gdate; // not null
	private String gtag;
	private String gstatus;
	private String nick; // not null
	private String goption; // not null
	private String gcategory;
	
	// 회원 자기소개 추가
	private String intro;
	
	public GroupBean() {
	
	}

	

	public GroupBean(int gno, String ghost, String gtitle, String gloc,
			String gintro, String gday, int gmax, int gmin, int gsum,
			String gimg, String gdate, String gtag, String gstatus,
			String nick, String goption, String gcategory, String intro) {
		this.gno = gno;
		this.ghost = ghost;
		this.gtitle = gtitle;
		this.gloc = gloc;
		this.gintro = gintro;
		this.gday = gday;
		this.gmax = gmax;
		this.gmin = gmin;
		this.gsum = gsum;
		this.gimg = gimg;
		this.gdate = gdate;
		this.gtag = gtag;
		this.gstatus = gstatus;
		this.nick = nick;
		this.goption = goption;
		this.gcategory = gcategory;
		this.intro = intro;
	}

	

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getGhost() {
		return ghost;
	}

	public void setGhost(String ghost) {
		this.ghost = ghost;
	}

	public String getGtitle() {
		return gtitle;
	}

	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}

	public String getGloc() {
		return gloc;
	}

	public void setGloc(String gloc) {
		this.gloc = gloc;
	}

	public String getGintro() {
		return gintro;
	}

	public void setGintro(String gintro) {
		this.gintro = gintro;
	}

	public String getGday() {
		return gday;
	}

	public void setGday(String gday) {
		this.gday = gday;
	}

	public int getGmax() {
		return gmax;
	}

	public void setGmax(int gmax) {
		this.gmax = gmax;
	}

	public int getGmin() {
		return gmin;
	}

	public void setGmin(int gmin) {
		this.gmin = gmin;
	}

	public int getGsum() {
		return gsum;
	}

	public void setGsum(int gsum) {
		this.gsum = gsum;
	}

	public String getGimg() {
		return gimg;
	}

	public void setGimg(String gimg) {
		this.gimg = gimg;
	}

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

	public String getGtag() {
		return gtag;
	}

	public void setGtag(String gtag) {
		this.gtag = gtag;
	}

	public String getGstatus() {
		return gstatus;
	}

	public void setGstatus(String gstatus) {
		this.gstatus = gstatus;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}



	public String getGoption() {
		return goption;
	}



	public void setGoption(String goption) {
		this.goption = goption;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	
}
