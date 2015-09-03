package com.tg.common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.UserPreferenceBean;

public class UserPreferenceDAO {
	@Autowired
	SqlSession session;
	
	public UserPreferenceBean select(String id){
		
		UserPreferenceBean bean = session.selectOne("user_pre.select", id);
		
		return bean;
	}
	
	public String selectTopProvince(String id){
		String topProvince = session.selectOne("user_pre.topProvince",id);
		
		return topProvince;
	}
	
	public String selectTopCategory(String id){
		String topCategory = session.selectOne("user_pre.topCategory",id);
		return topCategory;
	}
	
	public int selectRatioSum(String id){
		return session.selectOne("user_pre.ratioSum", id);
	}
}
