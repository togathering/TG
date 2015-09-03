package com.tg.common.beans;

public class UserPreferenceBean {
	private String id;
	private String category_name;
	private String province_name;
	private int ratio;
	 
	public UserPreferenceBean() {
	}
	
	public UserPreferenceBean(String id, String category_name,
			String province_name, int ratio) {
		this.id = id;
		this.category_name = category_name;
		this.province_name = province_name;
		this.ratio = ratio;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
