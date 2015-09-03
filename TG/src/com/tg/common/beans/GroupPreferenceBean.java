package com.tg.common.beans;

public class GroupPreferenceBean {
	private int gno;
	private String category_name;
	private String province_name;
	private int ratio;
	 
	public GroupPreferenceBean() {
		
	}
	
	public GroupPreferenceBean(int gno, String category_name,
			String province_name, int ratio) {
		this.gno = gno;
		this.category_name = category_name;
		this.province_name = province_name;
		this.ratio = ratio;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public int getRatio() {
		return ratio;
	}

	public void setRatio(int ratio) {
		this.ratio = ratio;
	}
	
	
}
